# Problem-2

# H0  - Вероятността , че клиентите са доволни -> 50%
# H1 - P != 50%

prop.test(41, 100, alternative = "two.sided")

1-sample proportions test with continuity correction

data:  41 out of 100, null probability 0.5
X-squared = 2.89, df = 1, p-value = 0.08913 <----
alternative hypothesis: true p is not equal to 0.5
95 percent confidence interval:
  0.3140323 0.5129652
sample estimates:
  p 
0.41

# p -value - то е 0.08 > 0.05 ===> H0 

prop.test(410, 1000, p = 0.5, alternative = "two.sided") # Може и да зададем p ако искаме

1-sample proportions test with continuity correction

data:  410 out of 1000, null probability 0.5
X-squared = 32.041, df = 1, p-value = 1.51e-08 <---
alternative hypothesis: true p is not equal to 0.5
95 percent confidence interval:
  0.3794248 0.4412753
sample estimates:
  p 
0.41 


# p-value = 1.51e-08 ===> H1

# Сега когато твърдение се променя на :
# ПОНЕ 50% от клиентите са доволни от услуги на компанията :

prop.test(41, 100, p = 0.5, alternative = "less")

1-sample proportions test with continuity correction

data:  41 out of 100, null probability 0.5
X-squared = 2.89, df = 1, p-value = 0.04457 <---
alternative hypothesis: true p is less than 0.5
95 percent confidence interval:
  0.0000000 0.4972414
sample estimates:
  p 
0.41 

# Можем да се зачудим дали е H0 или H1, но по - скоро е H1

