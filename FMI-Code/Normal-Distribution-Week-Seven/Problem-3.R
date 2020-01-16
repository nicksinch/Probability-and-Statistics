# Problem-3

library(UsingR)

# a)

hist(babies$wt1)
mean(babies$wt1)

#[1] 153.9765
w = babies$wt1[babies$wt1 < 999]
hist(w)
shapiro.test(w)

#Shapiro-Wilk normality test

#data:  w
#W = 0.92842, p-value < 2.2e-16

# не са нормално разпределени

# в)

Data = scan()
