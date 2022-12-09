# specanalysis

------------------------------------------------------------------------

This package is designed for the reproducible analysis of FerroZine spectrophotometric measurements. It is currently tailored for datasets that come out of the Caltech/International Geobiology group. This package was created for the purpose of a class

## Installing the package

------------------------------------------------------------------------

To install this package, you will need to install `devtools`. Execute the following lines to install this package onto your device:

```{r}
library(devtools)

install_github("biogeojake/specanalysis")
```

After installation, you can import the package functions using the usual `library` function:

```{r}
library(specanalysis)
```

## Prerequisites

Your data should be summarized in the following manner:

-   `standards.csv` - A csv file that contains a column with `concentration` (mg Fe/L) and the corresponding `filename` to their spectrophotometric measurements

-   `iron_raw_data.csv` - A csv with your samples and their `filename`. Any number of metadata can be added. As long as the file is tidy (i.e. each row is an observation), it should be fine.

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

## Creating a Calibration Curve

The calibration curve will be made using the processed standard data and will take advantage of the custom `calibrate_set()` function within the `specanalysis` package.

```{r}
calibration <- calibrate_set(p_stds)
```

This function will hopefully prompt any QC analysis in the future. For now, it strictly returns slope and intercept and it is up to the user to evaluate the quality of the calibration.

## Calculating Concentrations

To then calculate the concentrations of the sample set, we can use `calc_conc()` to give extract concentrations.

```{r}
proc_samples <- calc_conc(p_samples, curve = calibration, dilution = 1)
```

The dilution factor could be adjusted to account for any secondary dilutions or extract volume conversions.

## Analysis Assessment

It is highly recommended that a plot be made to look at the linearity of the standards, the quality of the calibration, and look for sample that lie outside of the calibration curve. Future version of this package aim to provide functions to do this.

------------------------------------------------------------------------

## Quick Start

To concisely perform the analysis, you may also use the following code block:

```{r}
calibration <- stds %>%
  check_set() %>%
  analyze_set(home = home.directory, specdir = "./raw_fz_files") %>%
  calibrate_set()

proc_samples <- samples %>%
  check_set() %>%
  analyze_set(home = home.directory, specdir = "./raw_fz_files") %>%
  calc_conc(curve = calibration, dilution = 1)
```
