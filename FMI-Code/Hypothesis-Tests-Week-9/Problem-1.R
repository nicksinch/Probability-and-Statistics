# Problem-1
# H0 true mean = 24
# H1 true mean != 24


# Начин 1: Теоретичния ( По - трудния )

vacation
boxplot(vacation, horizontal = T)

hist(vacation)

qqnorm(vacation)
qqline(vacation)
shapiro.test(vacation)

Shapiro-Wilk normality test

data:  vacation
W = 0.95272, p-value = 0.1374

# ND !

meanValue = mean(vacation)
meanValue

[1] 20.51429

Sd = sd(vacation)
Sd

VacationLength = length(vacation)

t = (meanValue - 24) * sqrt(VacationLength) / Sd
t
[1] -2.258439

val = pt(t, 34)*2 # The Student Distribution

[1] 0.0304478

# Ако val < 0.05 => H1,
# Ако val >= 0.05 => H0

# В нашия случай отхвърляме хипотезата


# Начин 2: (По - лесния)

t.test(vacation, mu=24, alternative = "two.sided") # Student's t-Test


One Sample t-test

data:  vacation
t = -2.2584, df = 34, p-value = 0.03045 <----- Ето го p-value-то
alternative hypothesis: true mean is not equal to 24
95 percent confidence interval:
  17.37768 23.65089
sample estimates:
  mean of x 
20.51429 

# ===> Отхвърляме 


# Забележка! Ако данните не бяха нормално разпределени, wilcox test

# Ако има някаква пропориция - (prop.test) "Пример на Каменов: Каква е вероятността 5% от жените да са бременни?"


