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

------------------------------------------------------------------------

Your data should be summarized in the following manner:

-   `standards.csv` - A csv file that contains a column with concentrations (mg Fe/L) and the corresponding filenames to their spectrophotometric measurements

-   `iron_raw_data.csv` - A csv with your samples and their filenames. Any number of metadata can be added. As long as the file is tidy (i.e. each row is an observation), it should be fine.

-   `raw_fz_files` - A folder with textfiles that are the ones being referenced in `standards.csv` and `iron_raw_data.csv`

## Analyze Standards

------------------------------------------------------------------------

Using the `tidyverse` package, read the `standards.csv` file using `read_csv()`. You should then be able to use the `analyze_set()` function from the `specanalysis` package to retrieve the wavelength and absorbance values for each standard.

```{r}
library(tidyverse)

stds <- read_csv("standards.csv")

stds <- analyze_set(stds)
```

A linear model can then be derived using the concentrations column and the absorbance column in the new dataframe.
