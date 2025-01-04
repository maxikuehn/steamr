#' Steam Game Data
#'
#' Subset of game details from the Steam API and Huggingface dataset.
#'
#' @format A data frame with 500 rows and 11 variables:
#' \describe{
#'   \item{app_id}{Unique Steam ID}
#'   \item{name}{Game name}
#'   \item{description}{Short game description}
#'   \item{image}{Image URL}
#'   \item{developers, publishers}{Game developers and publishers}
#'   \item{price}{Price in EUR}
#'   \item{metacritic}{Metacritic score}
#'   \item{genres}{Game genres (comma-separated)}
#'   \item{recommendations}{Number of recommendations}
#'   \item{release_date}{Game release date}
#' }
#' @source Huggingface: [FronkonGames/steam-games-dataset](https://huggingface.co/datasets/FronkonGames/steam-games-dataset)
#' @source Steam API: <https://store.steampowered.com/api/appdetails?appids=AppID>
#'
"games"
