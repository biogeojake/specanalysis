test_that("multiple analyses works", {
  #Import tidyverse to use map
  library(tidyverse)

  #Create a test set
  set <- data.frame(conc = c(0, 5),
                    filename = c("test_spectrum.txt", "test_spectrum2.txt"))

  #Analyze the set
  p_set <- analyze_set(set, home = getwd(), specdir = getwd())

  #Test that the correct wavelength and abosrbance were pulled:
  expect_equal(p_set[1, 3], 562.09325)
  expect_equal(p_set[1, 4], 0.045783)
  expect_equal(p_set[2, 3], 562.09325)
  expect_equal(p_set[2, 4], 0.2338661)
})
