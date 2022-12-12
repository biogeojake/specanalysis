test_that("gets good calibration curve values", {

  #Create a test set that has an intercept of 5 and a slope of 50
  test_stds <- data.frame(absorbance = c(0, 0.25, 0.5, 1),
                          concentration = c(5, 17.5, 30, 55))

  #Use calbiration function
  calibration <- calibrate_set(test_stds)

  #Check for appropriate coefficients
  expect_equal(calibration[["absorbance"]], 50)
  expect_equal(calibration[["(Intercept)"]], 5)

})
