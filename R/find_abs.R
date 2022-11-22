#'Find Absorbance Value
#'
#'@description Retrieves the absorbance value for FerroZine measurements
#'
#'

find_abs <- function(txtfile){

  #Obtain data frame of spectral values
  spectrum <- get_spec(txtfile)

  #Retrieve wavelength closest to wl and correspdoning absorbance
  df <- spectrum[which.min(abs(562 - spectrum$wavelength)),]

  #Report a data frame of the wavelength and absorbance
  df
}
