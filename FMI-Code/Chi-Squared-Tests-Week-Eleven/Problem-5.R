# Problem 5
# Полезно:  rbind функцията прави една таблица от много таблици

# Четем измерените продукти продуктите

Products = scan()

# Правим матрица:

ProductMatrix = matrix(Products, ncol=5, byrow = T) # може и с nrow = 4

[,1] [,2] [,3] [,4] [,5]
[1,]   44   74   79   72   31
[2,]   14   25   27   24   10
[3,]   15   20   20   23    9
[4,]    3    5    5    0    0

chisq.test(ProductMatrix)

Pearson's Chi-squared test

data:  ProductMatrix
X-squared = 7.8308, df = 12, p-value = 0.7982

Warning message:
In chisq.test(ProductMatrix) : Chi-squared approximation may be incorrec

# => са независими ( денят не влияе на качеството )


