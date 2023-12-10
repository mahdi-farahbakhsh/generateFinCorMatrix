# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


# source('R/HCBM.R')
# source('R/Vine.R')
# source('R/onions.R')
# source('R/data_verification.R')


# # plot the results of HCBM
# # Hierarchical structure of financial correlation matrices
# set.seed(100)
# hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
# plot_corr_matrix(hcbm_mx)

# # plot the results of HCBM when permuted
# set.seed(100)
# hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3, permute = 'True')
# plot_corr_matrix(hcbm_mx)

# # generate time series from the generated correlation matrix
# # if the generated matrix is not positive semi-definite then there would be eror
# synthetic_time_series = time_series_from_correlation_matrix(hcbm_mx, 100)
#
# # plot the result of onions method -> this is by default permuted
# onions_mx = sample_from_extended_onion(dim = 40)
# plot_corr_matrix(onions_mx)
#
# # plot the result of onions method -> this is by default permuted
# dvine_mx = generate_from_dvine(dim = 40)
# plot_corr_matrix(dvine_mx)
#
# # checking the distribution of big eigenvalues for onions method
# # Marchenko Pastur property of financial correlation matrices
# onions_multi_mx = c()
# for (i in 1:100){
#   onions_mx = sample_from_extended_onion(dim = 40)
#   onions_multi_mx = array(c(onions_multi_mx, onions_mx), dim = c(40, 40, i))
# }
# plot_big_eigenvalue_distribution(onions_multi_mx, num_of_biggest = 2)
#
# # checking the distribution of pairwise correlations for dvine method
# # should have more entries on the right
# vine_multi_mx = c()
# for (i in 1:100){
#   vine_mx = generate_from_dvine(dim = 40)
#   vine_multi_mx = array(c(vine_multi_mx, vine_mx), dim = c(40, 40, i))
# }
# plot_pairwise_distribution(vine_multi_mx)
