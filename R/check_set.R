#'Check that the set is valid
#'
#'@description Checks if the filename column is explicitly written and ensures the format is correct
#'
#'@param df Takes in a dataframe object that corresponds to the sample or standard files
#'
#'@export

check_set <- function(df){
  #Check if set has a column with 'filename'
  if (!('filename' %in% colnames(df))) {
    print('Could not detect filename column. Please write file to include a filename header.')
  } else {
    #Check if set has proper file extensions and add it if not there
    df$filename[!str_detect(df$filename, '.txt')] <- paste(df$filename, '.txt', sep = '')
    print('Set has been cleaned')
  }

  #Returned cleaned dataframe
  df
}
