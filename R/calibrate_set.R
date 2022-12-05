#'Get Calibration Curve from Standards
#'
#'@description Creates a linear model from standard data
#'
#'@param stds Takes in a dataframe that corresponds to the standards data among the data sets.
#'
#'@export

calibrate_set <- function(stds){
  #create a linear model object using lm()
  m <- lm(formula = concentration ~ absorbance, data = stds)

  #extract just the slope and intercept of the linear model
  cf <- coef(m)

  #return just the coefficients
  cf
}
