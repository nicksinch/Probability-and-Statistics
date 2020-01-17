# Problem - 3

library(MASS)
attach(birthwt)

t = table(smoke,low)

# Вземаме 1-1 от таблицата

print(t[2,2])

chisq.test(t)


Pearson's Chi-squared test with Yates' continuity correction

data:  t
X-squared = 4.2359, df = 1, p-value = 0.03958


barplot(t,beside=T)

#===> имат връзка
