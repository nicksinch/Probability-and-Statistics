# Problem - 4

Observations = rnbinom(200,1,1/13)

shapiro.test(Observations)

Shapiro-Wilk normality test

data:  Observations
W = 0.7351, p-value < 2.2e-16
	
# ===> не са нормално разпределени , пускаме wilcox.test , защото искаме доверителен интервал	

wilcox.test(Observations, conf.level = 0.90, conf.int = T)


Wilcoxon signed rank test with continuity correction

data:  Observations
V = 16836, p-value < 2.2e-16
alternative hypothesis: true location is not equal to 0
90 percent confidence interval:
  8.499967 10.500040
sample estimates:
  (pseudo)median 
9.500013
  
  
# P(X=9) ; асото е 10та карта
  
# emp
dnbinom(9, 1, 1/13) # брой неуспехи до първия успех
[1] 0.03742809


# X = 10
sum(Observations == 10) / length(Observations)
[1] 0.05

