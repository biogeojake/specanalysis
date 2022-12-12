test_that("test for appropriate calibration", {
  #Import tidyverse for mutate()
  library(tidyverse)

  #Create  dummy standards set
  test_stds <- data.frame(absorbance = c(0, 0.25, 0.5, 1),
                          concentration = c(5, 17.5, 30, 55))

  #Create a calibration curve
  calibration <- calibrate_set(test_stds)

  #Create dummy sample set
  samples <- data.frame(absorbance = c(0.3, 0.6, 0.8))


  #Calc concentration of dummy set
  p_samples <- calc_conc(samples = samples, curve = calibration)

  expect_equal(p_samples$concentration, c(20, 35, 45))
})

test_that("test that dilution works", {
  #Import tidyverse for mutate()
  library(tidyverse)

  #Create  dummy standards set
  test_stds <- data.frame(absorbance = c(0, 0.25, 0.5, 1),
                          concentration = c(5, 17.5, 30, 55))

  #Create a calibration curve
  calibration <- calibrate_set(test_stds)

  #Create dummy sample set
  samples <- data.frame(absorbance = c(0.3, 0.6, 0.8))


  #Calc concentration of dummy set
  p_samples <- calc_conc(samples = samples, curve = calibration, dilution = 2)

  expect_equal(p_samples$concentration, c(40, 70, 90))
})
