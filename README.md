# Financial Correlation Matrix Generation
In finance research, correlation matrices are really important and play a very important role in financial mathematics. It appears that correlation matrices in financial world have some specific properties. In this project we implemented some of the proposed methods in papaers for generating synthetic correlation matrices in a way that try to hold the properties as much as possible. 
## Methods
### HCBM
The first method is HCBM. You can find the reference for this method <a href="https://www.ijcai.org/Proceedings/16/Papers/367.pdf" target="_blank">here</a>. You can also run this method and plot the result like this: 
```
hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
plot_corr_matrix(hcbm_mx)
```
### Vine
The second method implemented here is dvine method. You can find the reference paper <a href="https://www.sciencedirect.com/science/article/pii/S0047259X05000886" target="_blank">here</a>. For running this method use this code:
```
dvine_mx = generate_from_dvine(dim = 40)
```
### Onions
Third method implemented here is the extended onions method. The algorithm comes from <a href="https://www.sciencedirect.com/science/article/pii/S0047259X09000876" target="_blank">this</a> paper. You can run the algorithm by this code:
```
onions_mx = sample_from_extended_onion(dim = 40)
```
## Properties
As we said above, the financial correlation matrices should have some properties. When generating synthetic correlation matrices randomly we should note that the generated matrice should have these properties. However, to be honest it is not trivial to develope an algorithm for matrix generation that can satisfy all of the properties. Here you can find some of the peroperties and our implementations to verify if generated matrices satisfy them. 
### Hierarchical Structure
We know that the assets that are in the same industry would have a high correlation with each other. In each industry there could be even some smaller subgroups of assets that are more correlated with each other because they have same effective factors on their prices. This property lead to the existence of a hierarchical structure in correlation matrices. You can see the hierarchical structure by runnnig the HCBM method. You can run this code:
```
hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
plot_corr_matrix(hcbm_mx)
```
### Marchenko–Pastur
The big eigenvalues of financial correlation matrices would follow Marchenko-Pastur distribution. Here you can see the code to generate multiple matrices and plot the distribution. You can also use test on that to see if it is following Marchenko-Pastur. 
```
onions_multi_mx = c()
for (i in 1:100){
  onions_mx = sample_from_extended_onion(dim = 40)
  onions_multi_mx = array(c(onions_multi_mx, onions_mx), dim = c(40, 40, i))
}
plot_big_eigenvalue_distribution(onions_multi_mx, num_of_biggest = 2)
```
### Distribution of pairwise correlation
The pairwise correlations, all of the entries of correlation matrix, should be significantly shifted to the positive. You can verify this property by this sample code:
```
vine_multi_mx = c()
for (i in 1:100){
  vine_mx = generate_from_dvine(dim = 40)
  vine_multi_mx = array(c(vine_multi_mx, vine_mx), dim = c(40, 40, i))
}
plot_pairwise_distribution(vine_multi_mx)
```
### Perron-Frobenius
The entries of the first eigenvector should be positive. You can also generate matrices like above and plot the distribution using the plot_first_eigenvector_entries function.




