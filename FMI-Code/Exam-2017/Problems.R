# Problem 1
# 1A
> sum(Aids2$age < 20)
[1] 39

# 1B
> Aids2$sex[order(Aids2$diag, decreasing = F)][1:5]
[1] M M M M M
Levels: F M

# 1C
> sum(Aids2$T.categ == "blood" & Aids2$sex == "M") / sum(Aids2$sex == "M")
[1] 0.02069717

# 1D
> table(Aids2$status, Aids2$state)
   
     NSW Other  QLD  VIC
  A  664   107   78  233
  D 1116   142  148  355

> plot(Aids2$status, Aids2$state)

# Problem 2
# H0: myuW <= myuM (myuW = myuM)
# H1: myuW > myuM

> men = Aids2$status[Aids2$sex == "M"]
> women = Aids2$status[Aids2$sex == "F"]

> men_d = sum(men == "D")
> women_d = sum(women == "D")

> prop.test(c(women_d, men_d), c(length(women), length(men)), alternative = "greater") 

	2-sample test for equality of proportions with continuity correction

data:  c(women_d, men_d) out of c(length(women), length(men))
X-squared = 0.13041, df = 1, p-value = 0.641 # => H0 
alternative hypothesis: greater
95 percent confidence interval:
 -0.1173963  1.0000000
sample estimates:
   prop 1    prop 2 
0.5955056 0.6201888 

# Профанска проверка за подсигуряване
> men_d / length(men)
[1] 0.6201888 # 62% death rate

> women_d / length(women)
[1] 0.5955056 # 59% death rate

# Problem 3
> d_ages = Aids2$age[Aids2$status == "D"]
> shapiro.test(d_ages)

	Shapiro-Wilk normality test

data:  d_ages
W = 0.96911, p-value < 2.2e-16
# => d_ages ne e N от Шапиро
# => wilcox.test

# H0: myu = 38
# H1: myu != 38

> wilcox.test(d_ages, mu = 38, alternative = "two.sided")

	Wilcoxon signed rank test with continuity correction

data:  d_ages
V = 649730, p-value = 0.00164 # => H1
alternative hypothesis: true location is not equal to 38

# OR

> hist(d_ages)
> qqnorm(d_ages)
> qqline(d_ages)
# Сякаш изглеждат нормално разпределени тук

> t.test(d_ages, mu=38, alternative = "two.sided")

	One Sample t-test

data:  d_ages
t = -0.83886, df = 1760, p-value = 0.4017 # => H0
alternative hypothesis: true mean is not equal to 38
95 percent confidence interval:
 37.31002 38.27658
sample estimates:
mean of x 
  37.7933 

# Problem 4
> obs = rchisq(100, df = 10)
> hist(obs)
> min(obs)
[1] 2.137195
> max(obs)
[1] 22.02741

#th density
> z = seq(2, 22.2, 0.2) # слагаме мин и макс от интервала
> y = dchisq(z, df = 10)

> hist(obs, probability = T)
> lines(z, y, col='red')

# Problem 5
> m_cats = cats[cats$Sex == "M",]
> l = lm(m_cats$Hwt ~ m_cats$Bwt)
> l$coefficients
(Intercept)  m_cats$Bwt 
  -1.184088    4.312679 
# => Hwt = -1.184088 + 4.312679Bwt, така зависи

> plot(m_cats$Bwt, m_cats$Hwt)
> abline(l)
> s = summary(l)

# има проблем, когато се прави предикт с имената на колоните
# затова въвеждаме следните промени
> y = m_cats$Hwt
> x = m_cats$Bwt
> l = lm(y ~ x)
> d = data.frame(x=2.6)
# 95 доверителен интервал за сърцето на котка, която има телесно тегло 2.6кг
> predict.lm(l, d, interval = 'confidence', level = 0.95)
       fit      lwr      upr
1 10.02888 9.655434 10.40232

# искаме да видим дали
> s = summary(l)
> s

Call:
lm(formula = y ~ x, data = m_cats[, 2:3])

Residuals:
    Min      1Q  Median      3Q     Max 
-3.7728 -1.0478 -0.2976  0.9835  4.8646 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  -1.1841     0.9983  -1.186    0.239    
x             4.3127     0.3399  12.688   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.557 on 95 degrees of freedom
Multiple R-squared:  0.6289,	Adjusted R-squared:  0.625 
F-statistic:   161 on 1 and 95 DF,  p-value: < 2.2e-16

# oт коефициента пред х виждаме, че при увеличение на телесното тегло с 1кг
# се получава увеличение в теглото на сърцето с 4.3127 грама
# нас ни питат можем ли да твърдим че се получава увеличение с 5 грама

# H0: b1 = 5; 2-sided
# H1: b1 != 5

# t = (coefEstX - 5) / coefErX

> t = (s$coefficients[2,1] - 5) / s$coefficients[2,2]
> t
[1] -2.022163

# oказа се отрицателно =>
> pt(t, length(x) - 2) * 2
[1] 0.04597144 # това е p-val => не може да твърдим, че при котки по-тежки с 1кг, сърцето по-тежко с 5грама
