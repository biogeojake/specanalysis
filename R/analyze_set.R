#'Analyze a set of samples/standards
#'
#'@description Retrieves the absorbance values for a set of samples or standards
#'
#'@param df Takes in a dataframe object that contains multiple rows with files to analyze spectra from
#'@param home Takes in a character object that corresponds to the directory with all the files
#'@param specdir Takes in a character object that corresponds to the subdirectory that contains all the spectral files
#'
#'@export

analyze_set <- function(df, home = getwd(), specdir = "./raw_fz_files"){

  # Move down to the spectral file directory
  setwd(specdir)

  #Create a df of wavelength and absorbance from each sample
  wave_ab <- df$filename %>%
    map(find_abs)

  #Combine the components into one clean dataframe
  wave_ab <- do.call("rbind", wave_ab)

  #Combine wavelength and absorbance to the original dataframe
  df <- cbind(df, wave_ab)

  #Move back up to the main directory
  setwd(home)

  #Return the dataframe
  df
}
