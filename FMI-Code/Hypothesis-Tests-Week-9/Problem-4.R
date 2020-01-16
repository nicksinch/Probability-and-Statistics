# Problem - 4
# H0 : >= 100 години.
# H1 : < 100 години.

Stomach = c = cancer$stomach
Stomach
[1]  124   42   25   45  412   51 1112   46  103  876  146  340
[13]  396

qqnorm(Stomach)
qqline(Stomach)

# Не са ND !

# Да се забележи алтернативата "less" ( заради H1 )
wilcox.test(Stomach, mu = 100, alternative = "less")

Wilcoxon signed rank test

data:  Stomach
V = 61, p-value = 0.8633 <--- 
alternative hypothesis: true location is less than 100

# ===> H0

# Ако се иска H0 да е <= 100, а H1 > 100 , тогава

wilcox.test(Stomach, mu = 100, alternative = "greater")


Wilcoxon signed rank test

data:  Stomach
V = 61, p-value = 0.1527
alternative hypothesis: true location is greater than 100


# p -value 0.1527