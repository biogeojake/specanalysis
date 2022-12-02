#'Analyze a set of samples/standards
#'
#'@description Retrieves the absorbance values for a set of samples or standards
#'
#'@param df Takes in a dataframe object that contains multiple rows with files to analyze spectra from
#'
#'@export

analyze_set <- function(df){

  #Create a data frame that will have the dataframe with wavelength and absorbance
  #B <- lapply(X = df[ , col.num], FUN = find_abs)

  B.test <- df$filename %>%
    map(find_abs)
  #Combine the components into one clean dataframe
  B <- do.call("rbind", B)

  #Combine wavelength and absorbance to the original dataframe
  df <- cbind(df, B)

  #Return the dataframe
  df
}
