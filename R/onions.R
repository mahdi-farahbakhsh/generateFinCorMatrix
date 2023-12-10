#' Generating random correlation matrix using extended onions method
#' You can find the reference here: Reference: "Generating random correlation matrices based on vines and extended onion method"
#' by Daniel Lewandowski, Dorota Kurowicka, Harry Joe.
#' https://www.sciencedirect.com/science/article/pii/S0047259X09000876
#'
#' @param dim an integer>3 showing the number of dimensions for the correlation matrix
#' @param eta The eta parameter for onion method
#'
#' @return random dim*dim correlation matrix
#' @export
#'
#' @examples sample_from_extended_onion(dim = 10)
#' sample_from_extended_onion(dim = 50)
#' sample_from_extended_onion(dim = 30, eta = 1.5)
sample_from_extended_onion <- function(dim, eta = 2) {
  result <- vector("list", 1)

  .find_A <- function(matrix){
    svd_decomp <- svd(matrix)
    u <- svd_decomp$u
    s <- svd_decomp$d
    return(u %*% sqrt(diag(s)))
  }

  for (j in 1:1) {
    beta <- eta + (dim - 2) / 2
    corr <- matrix(1, nrow = 2, ncol = 2)
    corr[1, 2] <- corr[2, 1] <- 2 * rbeta(1, shape1 = beta, shape2 = beta) - 1

    for (i in 1:(dim - 2)) {
      beta <- beta - .5
      y <- rbeta(1, shape1 = (i + 1) / 2, shape2 = beta)
      u <- rnorm(i + 1)
      u <- u / sqrt(sum(u^2))

      A <- .find_A(corr)
      z <- matrix(sqrt(y) * A %*% u, ncol = 1)
      corr <- cbind(corr, z)
      z <- rbind(z, 1)

      corr <- rbind(corr, t(z))
    }

    result[[j]] <- corr
  }
  return(array(unlist(result), dim = c(dim, dim)))
}
