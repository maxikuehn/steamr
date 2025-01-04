test_that("invalid app_id", {
  expect_error(get_game_details(-1))
  expect_error(get_game_details("invalid"))
})

test_that("invalid app_id", {
  g = get_game_details(72850)
  expect_equal(class(g), "game_details")
})
