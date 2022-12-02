#'Find Absorbance Value
#'
#'@description Retrieves the absorbance value for FerroZine measurements
#'
#'@param txtfile Takes in a character value that corresponds to a textfile with spectral data
#'@param wl Takes in a numeric value that corresponds to the wavelength you would like to extract absorbance values from. The default value is 562 for FerroZine assays
#'
#'@export

find_abs <- function(txtfile, wl = 562){

  #Obtain data frame of spectral values
  spectrum <- get_spec(txtfile)

  #Retrieve wavelength closest to wl and correspdoning absorbance
  df <- spectrum[which.min(abs(wl - spectrum$wavelength)),]

  #Report a data frame of the wavelength and absorbance
  df
}
