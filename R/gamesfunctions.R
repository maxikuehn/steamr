# Helper Functions

#' Function to analyse date column in the dataset and add a column containing only the year
#' @param games The "games" dataset
#' @return The "games" dataset with an added column "year"
#' @import dplyr
#' @keywords internal
addyear <- function(games) {
  games$release_date <- as.Date(games$release_date, "%Y-%m-%d")
  games <- games |>
    mutate(year = as.numeric(format(release_date, "%Y")))
  return(games)
}

#' Function to manually parse a serialized str array into a R vector.
#' If the array has no (valid) elements, NULL is returned.
#' If the string s is a non-array sequence, the sequence is returned as a single element
#' @param s a string containing an array like \['A', 'B'\]
#' @return spl The vector of elements
#' @import dplyr
#' @import stringr
#' @keywords internal
str_arr_to_vector <- function(s) {
  if (length(s) == 0) {
    return(NULL)
  }
  rm <- str_replace_all(s, "\\[|'| |\\]", "")
  spl <- str_split_1(rm, pattern = "(\\s*,\\s*)") # ist schon vektor
  if (all(spl == "")) {
    return(NULL)
  }
  return(spl)
}

#' Function to separate rows with multiple genres into multiple rows
#' @param games The "games" dataset
#' @return games The "games" dataset with rows separated by genres
#' @import dplyr
#' @import tidyr
#' @keywords internal
separatebygenre <- function(games) {
  games <- games |> # TODO call by ref ueberschreibt schon variable oder lokal?
    rowwise() |>
    mutate(genres = list(str_arr_to_vector(genres))) |>
    unnest_longer(genres) |>
    mutate(across(genres, as.factor))
  return(games)
}

# Statistics Functions

#' Function to visualise the average game price per year
#' Genres include: Action, Adventure, Casual, Indie, MassivelyMultiplayer, Racing, RPG, Simulation, Sports, Strategy
#' @param games The "games" dataset
#' @param selectedgenres Vector of genres to be visualised, OPTIONAL (all genres are selected if this parameter is not provided)
#' @return avgpriceplot a ggplot object
#' @export
#' @import dplyr
#' @import ggplot2
avgpriceperyear <- function(games, selectedgenres = NULL) {
  games <- separatebygenre(addyear(games))
  games <- games |>
    select(name, price, year, genres) |>
    # Scheinbar gibt es einen ausreisser
    filter(price < 891000) |>
    group_by(year, genres) |>
    summarise(mean_price = mean(price)) |>
    arrange(year)
  if (!is.null(selectedgenres)) {
    games <- games |> filter(genres %in% selectedgenres)
    if (nrow(games) == 0) {
      warning("The selected genre(s) could not be found in the dataset")
    }
  }
  priceperyear <- ggplot(games, aes(year, mean_price, colour = genres)) +
    geom_line() +
    labs(x = "Year", y = "Average price in \u20ac", title = "Average price evolution per Genre") # \u20ac is Euro in Unicode escape
  return(priceperyear)
}
