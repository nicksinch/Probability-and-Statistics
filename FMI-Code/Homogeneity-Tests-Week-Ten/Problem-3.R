# Problem - 3

# H0: muX = muY
# H1: muX != muY

X = scan()

Y = scan()

boxplot(X,Y)

qqnorm(X)
qqline(X)

qqnorm(Y)
qqline(Y)

shapiro.test(X)

Shapiro-Wilk normality test

data:  X
W = 0.94879, p-value = 0.6543


# ===> ND !

shapiro.test(Y)
# ===> ND !


# Да забележим paired = T тук ! ( Защото са 2 'радара' ), т.е. еднакъв тип са
# а не 'непушачи' и 'пушачи' или 2 различни лекарства както на миналите 2 задачи

t.test(X, Y, paired = T, alternative = "two.sided")

Paired t-test

data:  X and Y
t = -0.26941, df = 9, p-value = 0.7937
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  -1.879354  1.479354
sample estimates:
  mean of the differences 
-0.2

# ===>H0 ( Радарите са еднакви )
