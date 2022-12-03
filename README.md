# specanalysis

------------------------------------------------------------------------

This package is designed for the reproducible analysis of FerroZine spectrophotometric measurements. It is currently tailored for datasets that come out of the Caltech/International Geobiology group. This package was created for the purpose of a class

## Installing the package

------------------------------------------------------------------------

To install this package, you will need to install `devtools` and use the most up to date authentication token. Execute the following lines to install this package onto your device (Note: this authentication token will expire Dec. 9th. I will try to update the token when it does expire):

```{r}
library(devtools)

install_github("biogeojake/specanalysis", auth_token = "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")
```

After installation, you can import the package functions using the usual `library` function:

```{r}
library(specanalysis)
```

## Prerequisites

Your data should be summarized in the following manner:

-   `standards.csv` - A csv file that contains a column with concentrations (mg Fe/L) and the corresponding filenames to their spectrophotometric measurements

-   `iron_raw_data.csv` - A csv with your samples and their filenames. Any number of metadata can be added. As long as the file is tidy (i.e. each row is an observation), it should be fine.

-   `raw_fz_files` - A folder with textfiles that are the ones being referenced in `standards.csv` and `iron_raw_data.csv`

## Import Data

Once your working directory is formatted correctly, import your data using the `read_csv()` function from `tidyverse`. You will need to do this for both the standards and the samples:

```{r}
library(tidyverse)

stds <- read_csv('standards.csv')

samples <- read_csv('iron_raw_data.csv')
```

## Check Data Format

In order for the package functions to work, the dataframes should be formatted in a specific way. This includes having a column called `filename` and that the filenames themselves have the `.txt` extensions.

The `check_set()` function in this package will check that the `filename` column is present and add the file extension if it is not present.

```{r}
stds <- check_set(stds)

samples <- check_set(samples)
```

If there are any error messages, you will need to resolve the formatting discrepancies.

## Pulling Spectral Information

The wavelength and absorbance of interest (`specanalysis` currently only supports pulling 562 nm for FerroZine measurements) will be extracted using the `analyze_set()` function. You will want to specify the `home` directory (i.e. where you would like to keep your work at) and the `specdir` (i.e. where the spectral files are located) in order to cleanly read the text files.

```{r}

#home.directory = *Set the path to the directory of the files*

p_stds <- analyze_set(stds, home = home.directory, specdir = './raw_fz_files')

p_samples <- analyze_set(samples, home = home.directory, specdir = './raw_fz_files')
```
