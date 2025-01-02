#' Steam Game Details
#'
#' A subset of Game Details from the Steam API
#'
#'
#' @format ## `games`
#' A data frame with 500 rows and 11 columns:
#' \describe{
#'   \item{app_id}{Steam App ID}
#'   \item{name}{Name of the game}
#'   \item{description}{Short description of the game}
#'   \item{image}{Image URL}
#'   \item{developers}{Developers of the game}
#'   \item{publishers}{Publishers of the game}
#'   \item{price}{Price of the game in EUR}
#'   \item{metacritic}{Metacritic score}
#'   \item{genres}{Genres of the game}
#'   \item{recommendations}{Number of recommendations}
#'   \item{release_date}{Release date of the game}
#' }
#' @source Huggingface: [FronkonGames/steam-games-dataset](https://huggingface.co/datasets/FronkonGames/steam-games-dataset)
#' and Steam API <https://store.steampowered.com/api/appdetails?appids=AppID>
#'
"games"
