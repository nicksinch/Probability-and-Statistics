# Problem - 3

# H0 : mu = 5
# H1 : mu > 5

Mins = scan()

1: 12.8 3.5 2.9 9.4 8.7 0.7 0.2 2.8 1.9 2.8 3.1 15.8
13: 
  Read 12 items

qqnorm(Mins)
qqline(Mins)

# Не са ND ===> wilcox.test

# Да се забележи : alternative = "greater"
wilcox.test(Mins, mu = 5, alternative = "greater") 

Wilcoxon signed rank test with continuity correction

data:  Mins
V = 39, p-value = 0.5156 <---
alternative hypothesis: true location is greater than 5

Warning message:
  In wilcox.test.default(Mins, mu = 5, alternative = "greater") :
  cannot compute exact p-value with ties


# p-value > 0.05 ===> не може да отхвърлим H0