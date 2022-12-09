test_that("finds right absorbance", {
  abs <- find_abs("test_spectrum.txt")

  #Test that it finds the most appropriate wavelength:
  expect_equal(abs[1, 1], 562.09325)

  #Test that it finds the corresponding absorbance:
  expect_equal(abs[1, 2], 0.045783)
})
