# we need corrplot

#' Plotting the distribution of all pairwise correlations
#'
#' @param mat a 2d correlation matrix or 3d array of n correlation matrices
#'
#' @return this function just plots. Doesn't return a value
#' @export
#'
#' @examples array(rnorm(10*10), nrow = 10)
#' plot_pairwise_distribution(array(rnorm(10 * 10 * 5), dim = c(10, 10, 5)))
plot_pairwise_distribution <- function(mat) {
  # Flatten the matrix into a vector
  vec <- as.vector(mat)

  # Plot the histogram
  hist(vec, main = "Distribution of Matrix Entries", xlab = "Matrix Entries", col = "lightblue")
}


#' Plot the distribution of the k biggest eigenvalues of more than one matrix
#'
#' @param mat an dim * dim * n array of n correlation matrices
#' @param num_of_biggest an integer showing how many of biggest eigenvalues to be shown
#'
#' @return it plots the distribution of big eigenvalues and doesn't return a value
#' @export
#'
#' @examples plot_big_eigenvalue_distribution(array(rnorm(10 * 10 * 5), dim = c(10, 10, 5)))
#' plot_big_eigenvalue_distribution(array(rnorm(20 * 20 * 15), dim = c(20, 20, 15)), num_of_biggest = 3)
plot_big_eigenvalue_distribution <- function(mat, num_of_biggest=NULL) {
  if (is.null(num_of_biggest)){
    num_of_biggest = dim(mat)[1]
  }

  # Calculate the eigenvalues
  all_eigenvalues = c()
  for (i in 1:dim(mat)[3]){
    eigenvalues <- eigen(mat[,,i])$values
    eigenvalues <- tail(sort(eigenvalues), num_of_biggest)
    all_eigenvalues = c(all_eigenvalues, eigenvalues)
  }

  # Plot the histogram
  hist(Mod(all_eigenvalues), main = "Distribution of Eigenvalues", xlab = "Eigenvalues", col = "lightblue")
}


#' Plot distribution of the entries of the first eigenvector
#'
#' @param mat a 3d dim * dim * n array of n correlation matrices
#'
#' @return plots the distribution of elements of the first eigenvector and return no value
#' @export
#'
#' @examples plot_first_eigenvector_entries(array(rnorm(10 * 10 * 5), dim = c(10, 10, 5)))
#' plot_first_eigenvector_entries(array(rnorm(4 * 4 * 5), dim = c(4, 4, 5)))
plot_first_eigenvector_entries <- function(mat){
  all_entries = c()
  for (i in 1:dim(mat)[3]){
    eigen_result <- eigen(mat[,,i])

    # Get the index of the largest eigenvalue
    index_max_eigenvalue <- which.max(Mod(eigen_result$values))

    # Get the eigenvector associated with the largest eigenvalue
    eigenvector <- eigen_result$vectors[, index_max_eigenvalue]
    all_entries = c(all_entries, eigenvector)
  }

  # Plot the distribution of the entries of the eigenvector
  hist(Mod(all_entries), main = "Distribution of Eigenvector Entries", xlab = "Eigenvector Entries")
}


#' Function to plot a correlation matrix
#'
#' @param corr_matrix a dim by dim correlation matrix
#'
#' @return plots the correlation matrix and doesn't return a value
#' @export
#'
#' @examples plot_corr_matrix(matrix(runif(10*10, min = -1, max = 1), ncol = 10))
#' plot_corr_matrix(matrix(runif(100*100, min = -1, max = 1), ncol = 100))
plot_corr_matrix <- function(corr_matrix) {
  corrplot::corrplot(corr_matrix, tl.pos = 'n')
}


#source("R/Vine.R")

#dimension = 50
#matrices = c()
#for(i in 1:10){
#  a = generate_from_dvine(dim = dimension)
#  matrices = array(c(matrices, a), dim = c(dimension, dimension, i))
#}

#plot_eigenvalue_distribution(matrices, 2)

#plot_first_eigenvector_entries(matrices)

#plot_pairwise_distribution(matrices)

#plot_corr_matrix(matrices[,,1])
