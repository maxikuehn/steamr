#' Create a Game Details S3 Object
#'
#' This function generates an S3 object summarizing a game's details.
#' @param app_id The Steam App ID of the game.
#' @return An S3 object of class 'game_details'.
#' @examples
#' game <- get_game_details(72850)
#' print(game)
#' summary(game)
#' @export
get_game_details <- function(app_id) {
  if (!is.numeric(app_id)) {
    stop("App ID must be a numeric value.")
  }

  # Find the game in the dataset
  game <- games[games$app_id == app_id, ]

  if (nrow(game) == 0) {
    stop("Game with the given App ID not found.")
  }

  # Create the summary object
  obj <- as.list(game)

  # Assign the class
  class(obj) <- "game_details"

  return(obj)
}


#' Prints Game Details
#'
#' @param x game_details Object
#' @param ... ignored
#' @export
print.game_details <- function(x, ...) {
  cat("Game Details:\n")
  for (field in names(x)) {
    cat(field, ": ", x[[field]], "\n", sep = "")
  }
}


#' Print a Summary of Game Details
#'
#' @param object game_details Object
#' @param ... ignored
#' @export
summary.game_details <- function(object, ...) {
  cat("Summary of Game Details:\n")
  cat("Name:", object$name, "\n")
  cat("Release Year:", format(as.Date(object$release_date), "%Y"), "\n")
  cat("Genres:", object$genres, "\n")
  cat("Price:", object$price, "EUR\n")
  cat("Recommendations:", object$recommendations, "\n")
  cat("Metacritic:", object$metacritic)
}
