% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analyze_set.R
\name{analyze_set}
\alias{analyze_set}
\title{Analyze a set of samples/standards}
\usage{
analyze_set(df, home = getwd(), specdir = "./raw_fz_files")
}
\arguments{
\item{df}{Takes in a dataframe object that contains multiple rows with files to analyze spectra from}

\item{home}{Takes in a character object that corresponds to the directory with all the files}

\item{specdir}{Takes in a character object that corresponds to the subdirectory that contains all the spectral files}
}
\description{
Retrieves the absorbance values for a set of samples or standards
}
