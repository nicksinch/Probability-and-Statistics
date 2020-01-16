# Problem - 5

# H0: p >= 80%
# H1 : p < 80%


table(survey$Sex, survey$Smoke)

          Heavy Never Occas Regul
Female     5    99     9     5
Male       6    89    10    12


# Тук имаме пропорции ( процентите ) и искаме да разберем
# дали можем да твърдим че 89 ( непушачите ) от 117 ( общо мъже )
# са поне 80 %. Това става много лесно така: 
prop.test(89,117,p=0.8,alternative="less")


1-sample proportions test with continuity correction

data:  89 out of 117, null probability 0.8
X-squared = 0.89797, df = 1, p-value = 0.1717 <---
alternative hypothesis: true p is less than 0.8
95 percent confidence interval:
  0.0000000 0.8229968
sample estimates:
  p 
0.7606838 

# p-value = 0.1717 > 0.05 ===> не можем да отхвърлим H0
