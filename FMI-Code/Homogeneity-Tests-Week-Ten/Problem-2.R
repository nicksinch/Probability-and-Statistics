# Problem - 2

# H0: muX = muY
# H1: muX < muY
# muX - лекуващи се с новото лекарство
# muY - лекуващи се с пласебо

X = scan()

Y = scan()

qqnorm(X)
qqline(X)

qqnorm(Y)
qqline(Y)

shapiro.test(X)

Shapiro-Wilk normality test

data:  X
W = 0.86663, p-value = 0.0913

shapiro.test(Y)

Shapiro-Wilk normality test

data:  Y
W = 0.93174, p-value = 0.4287

t.test(X, Y, alternative = "less")

Welch Two Sample t-test

data:  X and Y
t = -0.41894, df = 15.853, p-value = 0.3404 <---
alternative hypothesis: true difference in means is less than 0
95 percent confidence interval:
  -Inf 2.189994
sample estimates:
  mean of x mean of y 
11.40000  12.09091

# Извод: Не можем да отхвърлим Н0, т.е. лекарствата са горе-долу еднакви
