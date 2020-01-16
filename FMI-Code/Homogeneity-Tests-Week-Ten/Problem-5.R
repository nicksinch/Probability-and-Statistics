# Problem - 5

# myux - american
# myuy - japanese
# H0: myux = myuy
# H1: myux < myuy

d = scan()

# Copy-Paste na данните от линка...

m = matrix(d, ncol = 2, byrow = T)

X = m[, 1]

Y = m[, 2]

Y = Y[Y > 0]

# Проверяваме за ND ...

qqnorm(X)
qqline(X)

qqnorm(Y)
qqline(Y)

shapiro.test(X)

shapiro.test(Y)

t.test(X, Y, alternative = 'less')

elch Two Sample t-test

data:  X and Y
t = -12.946, df = 136.87, p-value < 2.2e-16
alternative hypothesis: true difference in means is less than 0
95 percent confidence interval:
  -Inf -9.014218
sample estimates:
  mean of x mean of y 
20.14458  30.48101

# => H1
