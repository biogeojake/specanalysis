#'Calculate Concentrations for Sample Set
#'
#'@description Calculates concentrations of samples based on the calibration curve created from calibrate_set()
#'
#'@param samples Takes in a dataframe with processed sample information and converts the absorbance values to concentrations.
#'@param curve Takes in a vector object that contains the calibration curve information from calibrate_set().
#'@param dilution Takes in a numeric value that is used to determine and dilution factors to include.
#'
#'@export

calc_conc <- function(samples, curve, dilution = 1){
  #Extract calibration curve information
  slope = curve[["absorbance"]]
  intercept = curve[["(Intercept)"]]

  #Calculate concentration using curve and dilution
  p_samples <- samples %>%
    mutate(concentration = (slope*absorbance + intercept)*dilution)

  #Return the dataframe with concentrations
  p_samples

}
