# Problem - 2

# a)

Norm = rnorm(100, 1, 2) # sqrt(4) = 2
NormMatrix = matrix(Norm, nrow = 100)

str(NormMatrix) # Матрица със 100 реда и 1 колона

SumRow = rowSums(NormMatrix) # ???
str(SumRow)

hist(SumRow)
boxplot(SumRow,horizontal = T)

qqnorm(SumRow)
qqline(SumRow)

shapiro.test(SumRow)

#Shapiro-Wilk normality test

#data:  SumRow
#W = 0.96349, p-value = 0.007193

mean(SumRow)
var(SumRow)


# б)

U = runif(100, 0, 6)
UMatrix = matrix(U, nrow = 100)
USum = rowSums(UMatrix)
qqnorm(USum)
shapiro.test(USum)

#Shapiro-Wilk normality test

#data:  USum
#W = 0.96299, p-value = 0.006607

U = runif(200, 0, 6)
UMatrix = matrix(U, nrow = 100)
USum = rowSums(UMatrix)
qqnorm(USum)
shapiro.test(USum)

#Shapiro-Wilk normality test

#data:  USum
#W = 0.98822, p-value = 0.5246

U = runif(1000, 0, 6)
UMatrix = matrix(U, nrow = 100)
USum = rowSums(UMatrix)
qqnorm(USum)
shapiro.test(USum)

#Shapiro-Wilk normality test

#data:  USum
#W = 0.98026, p-value = 0.1393


U = runif(10000, 0, 6)
UMatrix = matrix(U, nrow = 100)
USum = rowSums(UMatrix)
qqnorm(USum)
shapiro.test(USum)


# Shapiro-Wilk normality test

# data:  USum
# W = 0.99308, p-value = 0.893

hist(USum)
hist(USum, probability = T)
lines(density(USum))

# В)

Exp = rexp(100, 3)
ExpMatrix = matrix(Exp, nrow = 100)
SumExp = rowSums(ExpMatrix)
qqnorm(SumExp)
shapiro.test(SumExp)

#Shapiro-Wilk normality test

#data:  SumExp
#W = 0.86509, p-value = 4.466e-08

Exp = rexp(200, 3)
ExpMatrix = matrix(Exp, nrow = 100)
SumExp = rowSums(ExpMatrix)
qqnorm(SumExp)
shapiro.test(SumExp)

#Shapiro-Wilk normality test

#data:  SumExp
#W = 0.90106, p-value = 1.586e-06


Exp = rexp(1000, 3)
ExpMatrix = matrix(Exp, nrow = 100)
SumExp = rowSums(ExpMatrix)
qqnorm(SumExp)
shapiro.test(SumExp)

#Shapiro-Wilk normality test

#data:  SumExp
#W = 0.97639, p-value = 0.06933

Exp = rexp(10000, 3)
ExpMatrix = matrix(Exp, nrow = 100)
SumExp = rowSums(ExpMatrix)
qqnorm(SumExp)
shapiro.test(SumExp)

#Shapiro-Wilk normality test

#data:  SumExp
#W = 0.99062, p-value = 0.7143


