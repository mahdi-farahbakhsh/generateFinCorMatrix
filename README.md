# Financial Correlation Matrix Generation
In finance research, correlation matrices are really important and play a very important role in financial mathematics. It appears that correlation matrices in financial world have some specific properties. In this project we implemented some of the proposed methods in papaers for generating synthetic correlation matrices in a way that try to hold the properties as much as possible. The first method is HCBM that you can implement and plot like this: 
```
hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
plot_corr_matrix(hcbm_mx)
```
The second method implemented here is dvine method. You can find the reference paper <a href="https://www.google.com/" target="_blank">Google</a>.

## Hierarchical Structure
We know that the assets that are in the same industry would have a high correlation with each other. In each industry there could be even some smaller subgroups of assets that are more correlated with each other because they have same effective factors on their prices. This property lead to the existence of a hierarchical structure in correlation matrices. You can see the hierarchical structure by runnnig the HCBM method. You can run this code:
```
hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
plot_corr_matrix(hcbm_mx)
```
## Marchenko–Pastur
The big eigenvalues 
