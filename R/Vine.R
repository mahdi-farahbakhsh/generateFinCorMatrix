

#' Generate matrix using the statistical method of D-vine
#'
#' @param dim an integer>3 showing the number of dimensions
#'
#' @return a random dim*dim correlation matrix
#' @export
#'
#' @examples a = generate_from_dvine(dim = 3)
#' generate_from_dvine(dim = 10)
#' generate_from_dvine(dim = 50)

generate_from_dvine <- function(dim) { # dim at least 3
  beta <- dim / 2
  partial_correlations <- matrix(1, nrow = dim, ncol = dim)

  # 1. Generate partial correlation matrix
  for (k in 1:(dim - 1)) {
    for (i in 1:(dim - k)){
      partial_correlations[i, i + k] <- 2 * rbeta(1, beta, beta) - 1
      partial_correlations[i + k, i] <- partial_correlations[i, i + k]
    }
    beta <- beta - 0.5
  }

  # 2. Calculate correlations
  # the names are chosen just the same as the names in the paper
  for (k in 2:(dim - 1)) {
    for (i in 1:(dim - k)) {
      j <- i + k
      R <- partial_correlations[i:(j), i:(j)]
      r1 <- R[1, 2:(dim(R)[1] - 1)]
      r3 <- R[dim(R)[1], 2:(dim(R)[1] - 1)]
      R <- solve(R[2:(dim(R)[1] - 1), 2:(dim(R)[2] - 1)])

      val <- t(as.matrix(r1)) %*% R %*% r3
      coef <- (1 - t(as.matrix(r1)) %*% R %*% r1) * (1 - t(as.matrix(r3)) %*% R %*% r3)

      partial_correlations[i, j] <- partial_correlations[i, j] * sqrt(coef) + val
      partial_correlations[j, i] <- partial_correlations[i, j]
    }
  }

  return(array(partial_correlations, dim = c(dim, dim)))
}
