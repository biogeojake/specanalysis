#'Retrieve Spectral Values
#'
#'@description get_spec() parses a text file to extract only the absorption and wavelength values
#'
#'@param txtfile Takes in a character that corresponds to a text file that contains spectral data. This is designed to parse the structure from the collaborator's sepctrophotometer.
#'@returns A dataframe with wavelengths and absorbance
#'
#'@export


get_spec <- function(txtfile) {

  #Read text file into a vector line by line
  spec <- readLines(txtfile)

  #Find the index range that corresponds to the wavelength and absorbance values
  index <- match(">>>>>Begin Spectral Data<<<<<", spec)+1
  end <- length(spec)

  #Store only the data into a vector
  spec_vals <- spec[c(index:end)]

  #Separate out wavelength and absorbance values into a dataframe
  f <- data.frame(do.call(rbind, strsplit(spec_vals, "\t", fixed = TRUE)))
  colnames(f) <- c("wavelength", "absorbance")

  #Convert character values into numeric values
  f$wavelength <- as.numeric(f$wavelength)
  f$absorbance <- as.numeric(f$absorbance)

  #Return the data frame
  f
}
