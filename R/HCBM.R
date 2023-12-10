#' Generate Random Correlation Matrix Using Hierarchical Correlation Block Model
#' You can find the reference for this method here: Reference:  `Marti, G., Andler, S., Nielsen, F. and Donnat, P., 2016.
#' Clustering financial time series: How long is enough?. arXiv preprint arXiv:1603.04017.
#' <https://www.ijcai.org/Proceedings/16/Papers/367.pdf>`_
#'
#' @param dim an integer indicating the dimension of correlation matrix
#' @param block an integer indicating the number of blocks in each recursion
#' @param depth an integer showing the number of recursion in hierarchical structure
#' @param lower_bound a float in (-1, 1) showing the minimum correlation of assets
#' @param upper_bound a float in (0, 1) showing the maximum correlation of assets
#' @param permute a boolean to show if we want the order of assets to be randomized
#'
#' @return a random correlation matrix
#' @export
#'
#' @examples generate_hcbm_correlation_matrix(dim = 50, block = 3, depth = 2)
#' generate_hcbm_correlation_matrix(dim = 100, block = 2, depth = 3, permute = TRUE)
#' generate_hcbm_correlation_matrix(dim = 150, block = 3, depth = 3, lower_bound = -0.1)
generate_hcbm_correlation_matrix <- function(dim, block, depth, lower_bound = 0.1, upper_bound = 0.9, permute = FALSE) {
  depth = depth + 1
  rhos <- runif(depth, lower_bound, upper_bound)
  rhos <- sort(c(rhos, lower_bound, upper_bound))

  corr_mxs <- list()

  correlation_matrix <- matrix(0, nrow = dim, ncol = dim)
  correlation_matrix <- .hcbm_recursive(correlation_matrix, c(1, dim), block, depth, 1, rhos)
  diag(correlation_matrix) <- 1

  if (permute) {
    a <- sample(dim)
    correlation_matrix <- correlation_matrix[a, a]
  }

  corr_mxs[[1]] <- correlation_matrix

  corr_mxs <- matrix(unlist(corr_mxs), nrow = dim, ncol = dim)
  return(corr_mxs)
}


# This function is not going to be exported and will be called only for the package use
.hcbm_recursive <- function(matrix, block_range, block, depth, current_depth, rhos) {
  corr <- runif(1, rhos[current_depth], rhos[current_depth + 1])
  matrix[block_range[1]:block_range[2], block_range[1]:block_range[2]] <- corr

  if (current_depth == depth || block_range[1] == block_range[2]) {
    return(matrix)
  }

  blocks <- sample(block_range[1]:block_range[2], block - 1)
  blocks <- sort(c(blocks, block_range[1], block_range[2]))

  for (i in 1:(length(blocks) - 1)) {
    matrix <- .hcbm_recursive(matrix, c(blocks[i], blocks[i + 1]), block, depth, current_depth + 1, rhos)
  }

  return(matrix)
}


#' Generate a Random time series by getting a correlation matrix
#'
#' @param correlation_matrix a correlation matrix. It should be positive semi-definite
#' @param t_points an integer showing the number of data points over time to be generated
#' @param distribution_type a string indicating the distribution type for asset returns
#'
#' @return a matrix n by t that n is the number of assets and t is the number of datapoints
#' @export
#'
#' @examples time_series_from_correlation_matrix(mat, 100, 'normal')
#' time_series_from_correlation_matrix(mat, 50)
#' time_series_from_correlation_matrix(mat, 150, 'normal')
time_series_from_correlation_matrix <- function(correlation_matrix, t_points, distribution_type = 'normal') {
  returns <- NULL

  eigenvalues <- eigen(correlation_matrix)$values

  if (!(all(eigenvalues >= 0))) {
    stop('matrix should be positive semi-definite')
  }

  if (distribution_type == 'normal') {
    returns <- MASS::mvrnorm(n = t_points, mu = rep(0, nrow(correlation_matrix)), Sigma = correlation_matrix)
  }

  return(t(returns))
}
