# Problem 2
#H0 - всяка цифра се среща с p = 1/10
#H1 - поне една се среща с p != 1/10

library(UsingR)
pi2000[1:200]

CountDigitsTable = table(pi2000[1:200])

0  1  2  3  4  5  6  7  8  9 
19 20 24 20 22 20 15 12 25 23

chisq.test(CountDigitsTable)

Chi-squared test for given probabilities

data:  CountDigitsTable
X-squared = 7.2, df = 9, p-value = 0.6163

# p-value = 0.6163 ===> H0