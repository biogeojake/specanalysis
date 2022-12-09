test_that("file reading works", {
  #Retrieve spectrum from test file
  spec <- get_spec("test_spectrum.txt")

  #Test that the first value is correct:
  #Test for data type:
  expect_equal(is.numeric(spec[1, 1]), TRUE)
  expect_equal(is.numeric(spec[1, 2]), TRUE)

  #Test for value:
  expect_equal(spec[1, 1], 339.45932)
  expect_equal(spec[1, 2], -2.2718416)


  #Test that the last value is correct:
  expect_equal(spec[nrow(spec), 1], 1018.82213)
  expect_equal(spec[nrow(spec), 2], 0.3328246)
})
