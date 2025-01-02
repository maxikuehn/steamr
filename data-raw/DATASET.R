## code to prepare `games` dataset goes here

games <- read.csv("data-raw/steam_game_details.csv.bz2") |>
  mutate(price = price / 10)

str(games)

usethis::use_data(games, overwrite = TRUE)


