# Financial Correlation Matrix Generation
In finance research, correlation matrices are really important and play a very important role in financial mathematics. It appears that correlation matrices in financial world have some specific properties. In this project we implemented some of the proposed methods in papaers for generating synthetic correlation matrices in a way that try to hold the properties as much as possible. 
## HCBM
The first method is HCBM. You can find the reference for this method <a href="https://www.ijcai.org/Proceedings/16/Papers/367.pdf" target="_blank">here</a>. You can also run this method and plot the result like this: 
```
hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
plot_corr_matrix(hcbm_mx)
```
## Vine
The second method implemented here is dvine method. You can find the reference paper <a href="https://www.sciencedirect.com/science/article/pii/S0047259X05000886" target="_blank">here</a>. For running this method use this code:
```
dvine_mx = generate_from_dvine(dim = 40)
```
## Onions
Third method implemented here is the extended onions method. The algorithm comes from <a href="https://www.sciencedirect.com/science/article/pii/S0047259X09000876" target="_blank">this</a> paper. You can run the algorithm by this code:
```
onions_mx = sample_from_extended_onion(dim = 40)
```


## Hierarchical Structure
We know that the assets that are in the same industry would have a high correlation with each other. In each industry there could be even some smaller subgroups of assets that are more correlated with each other because they have same effective factors on their prices. This property lead to the existence of a hierarchical structure in correlation matrices. You can see the hierarchical structure by runnnig the HCBM method. You can run this code:
```
hcbm_mx = generate_hcbm_correlation_matrix(dim=70, block=3, depth=3)
plot_corr_matrix(hcbm_mx)
```
## Marchenko–Pastur
The big eigenvalues 
