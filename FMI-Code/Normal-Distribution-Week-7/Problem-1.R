#For a normal distribution, 68% of the observations are within +/- one standard deviation of the mean,
# 95% are within +/- two standard deviations, 
#and 99.7% are within +- three standard deviations.


# Problem 1

# Колкото по - голям е коеф. на свобода (df), толкова по - вероятно е данните
# да са нормално разпределени !
# В Shapiro-Wilk Normality Тестовете, H0 е че данните са нормално разпределени!
# Ако p-value-то, което теста връща < 0.05, то тогава ОТХВЪРЛЯМЕ H0.
# Ако е по - голямо, я приемаме.


X = rt(100, df = 1)

qqnorm(X)
qqline(X)

shapiro.test(X)

Shapiro-Wilk normality test

data:  X
W = 0.076305, p-value < 2.2e-16

Y = rt(100,df = 10)
qqnorm(Y)
qqline(X)
shapiro.test(Y)

Shapiro-Wilk normality test

data:  Y
W = 0.98379, p-value = 0.2592

Z = rt(100, df = 100)

qqnorm(Z)
qqline(Z)
shapiro.test(Z)

Shapiro-Wilk normality test

data:  Z
W = 0.992, p-value = 0.8215

