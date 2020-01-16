# Problem - 4

#H0: muX = muY    
#H1: muX != muY
#muX - време за напускане на едната компания
#muY - време за напускане на другата компани

X = ewr$AA[ewr$inorout=="out"] # Вземаме тези, които напускат от АА
X
[1] 22.7 24.8 26.4 33.7 29.3 33.4 26.4 26.2 24.2 26.3 26.3 23.2
[13] 22.9 25.6 26.6 29.3 35.2 30.2 29.7 27.0 24.0 24.1 24.8

Y = ewr$NW[ewr$inorout=="out"] # Вземаме тези, които напускат от NW
Y
[1] 19.7 21.6 22.4 26.1 23.2 24.8 22.8 21.9 21.4 22.0 21.2 19.9
[13] 21.3 22.7 23.0 25.5 31.9 25.0 24.5 24.1 21.8 20.7 21.4

qqnorm(X)
qqline(X)

qqnorm(Y)
qqline(Y)

shapiro.test(X)

Shapiro-Wilk normality test

data:  X
W = 0.89811, p-value = 0.02312

# NOT ND !

shapiro.test(Y)

Shapiro-Wilk normality test

data:  Y
W = 0.84517, p-value = 0.002226

# NOT ND !

# Не са ND ===> ще използваме wilcox.test

wilcox.test(X,Y,alternative = "two.sided")

Wilcoxon rank sum test with continuity correction

data:  X and Y
W = 460.5, p-value = 1.736e-05
alternative hypothesis: true location shift is not equal to 0

Warning message:
  In wilcox.test.default(X, Y, alternative = "two.sided") :
  cannot compute exact p-value with ties

# Отхвътляме H0 ! Т.е. е H1
