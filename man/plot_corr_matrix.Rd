% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_verification.R
\name{plot_corr_matrix}
\alias{plot_corr_matrix}
\title{Function to plot a correlation matrix}
\usage{
plot_corr_matrix(corr_matrix)
}
\arguments{
\item{corr_matrix}{a dim by dim correlation matrix}
}
\value{
plots the correlation matrix and doesn't return a value
}
\description{
Function to plot a correlation matrix
}
\examples{
plot_corr_matrix(matrix(runif(10*10, min = -1, max = 1), ncol = 10))
plot_corr_matrix(matrix(runif(100*100, min = -1, max = 1), ncol = 100))
}
