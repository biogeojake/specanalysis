test_that("checks for correct output", {
  #Import tidyverse to use map
  library(tidyverse)

  #Create a test set
  set <- data.frame(conc = c(0, 5),
                    filename = c("test_spectrum", "test_spectrum2.txt"))

  expect_output(check_set(set), 'Set has been cleaned')

})

test_that("checks for correct bad output", {
  #Import tidyverse to use map
  library(tidyverse)

  #Create a test set
  bad_set <- data.frame(conc = c(0, 5),
                    file = c("test_spectrum", "test_spectrum2.txt"))

  expect_output(check_set(bad_set), 'Could not detect filename column. Please write file to include a filename header.')

})

test_that("checks for cleaned filenames", {
  #Import tidyverse to use map
  library(tidyverse)

  #Create a test set
  set <- data.frame(conc = c(0, 5),
                    filename = c("test_spectrum", "test_spectrum2.txt"))

  checked_set <- check_set(set)

  expect_equal(checked_set[1, 2], "test_spectrum.txt")
  expect_equal(checked_set[2, 2], "test_spectrum2.txt")

})
