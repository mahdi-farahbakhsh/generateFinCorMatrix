% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/onions.R
\name{sample_from_extended_onion}
\alias{sample_from_extended_onion}
\title{Generating random correlation matrix using extended onions method
You can find the reference here: Reference: "Generating random correlation matrices based on vines and extended onion method"
by Daniel Lewandowski, Dorota Kurowicka, Harry Joe.
https://www.sciencedirect.com/science/article/pii/S0047259X09000876}
\usage{
sample_from_extended_onion(dim, eta = 2)
}
\arguments{
\item{dim}{an integer>3 showing the number of dimensions for the correlation matrix}

\item{eta}{The eta parameter for onion method}
}
\value{
random dim*dim correlation matrix
}
\description{
Generating random correlation matrix using extended onions method
You can find the reference here: Reference: "Generating random correlation matrices based on vines and extended onion method"
by Daniel Lewandowski, Dorota Kurowicka, Harry Joe.
https://www.sciencedirect.com/science/article/pii/S0047259X09000876
}
\examples{
sample_from_extended_onion(dim = 10)
sample_from_extended_onion(dim = 50)
sample_from_extended_onion(dim = 30, eta = 1.5)
}
