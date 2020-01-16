# Problem - 6

X = c(39, 50, 61, 67, 40, 40, 54) 
Y = c(60, 53, 42, 41, 40, 54, 63, 69)

qqnorm(X)
qqline(X)

qqnorm(Y)
qqline(Y)

shapiro.test(X)

Shapiro-Wilk normality test

data:  X
W = 0.8903, p-value = 0.2762

shapiro.test(Y)

Shapiro-Wilk normality test
data:  Y
W = 0.9149, p-value = 0.3899

# Нормално разпределени са ===> можем да ползваме t.test
# Но не слагаме paired = TRUE, понеже векторите са с != дължина

t.test(X,Y,alternative="two.sided")

Welch Two Sample t-test

data:  X and Y
t = -0.45541, df = 12.665, p-value = 0.6565 <----
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  -15.008141   9.793855
sample estimates:
  mean of x mean of y 
50.14286  52.75000 

# => H0
# диодите имат еднакво напрежение за пробив
