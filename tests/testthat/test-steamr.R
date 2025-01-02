# context("steamr") # deprecated

# Test that string array parsing works as expected
test_that("parse array one element", {
  t = str_arr_to_vector("['Genre']")
  expect_length(t, 1)
  expect_equal(t[1], "Genre")
})

test_that("parse array multiple elements", {
  t = str_arr_to_vector("['Genre', 'Name']")
  expect_length(t, 2)
  expect_equal(t, c("Genre", "Name"))
})

test_that("parse array no (0) elements", {
  t = str_arr_to_vector("[]")
  expect_length(t, 0)
  expect_equal(t, NULL)
})

test_that("parse array invalid sequence", {
  t = str_arr_to_vector("[,,]")
  expect_length(t, 0)
  expect_equal(t, NULL)
})

test_that("parse array any non-array sequence", {
  t = str_arr_to_vector("Hello world")
  expect_length(t, 1)
  expect_equal(t, "Helloworld")
})