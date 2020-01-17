#Problem 1
> x = scan()
1: 10.0 13.6 13.2 11.6 12.5 14.2 14.9 14.5 13.4 8.6 11.5 16.0 14.2 16.8 17.9 17.0
17: 
Read 16 items
> x
 [1] 10.0 13.6 13.2 11.6 12.5 14.2 14.9 14.5 13.4  8.6 11.5 16.0 14.2 16.8 17.9 17.0
 // Initial observations
> boxplot(x, horizontal = T)
> hist(x)
> qqnorm(x)
> qqline(x)

> m = mean(x)
> m
[1] 13.74375
# 0.975 se poqvi ot => cqloto lice e 1(ima nqkakva grafika koqto prilicha na planina). 
# ot 1 izvajdame 0.95(po uslovie) = 0.05 
# demek ot dvete strani imame po 0.025 
# (na planinata sredata e 0.95 i drugite 2 strani tam kudeto se razdelqt kvantilite)
# sledovatelno 0.95 + 0.025 = 0.975
# drugite parametri 0 i 1 sa ot Normalno razpredelenie
> q = qnorm(0.975, 0, 1)
> q
[1] 1.959964

# tova sa nqkakvi formuli za cofidence interval = mean +- q*koren((sigma^2) / n) 
> lowerBound = m - q*3 / 4
> upperBound = m + q*3 / 4

# kakvo namerihme? srednata produljitelnost na jivota na horata shte e mejdu lower i upper s veroqtnost 95%

# kogato dispersiqta ne e izvestna
# 15 = broy nablyudeniq - 1
> q = qt(0.975, 15)
> q
[1] 2.13145
> lowerBound = m - q*s/4
> upperBound = m + q*s/4

# ima gotova funkciq ne e nujno da go pishesh
# za podaden vektor vrushta doveritelen interval za ochakvane

# default: conf.level = 95
> t.test(x)

	One Sample t-test

data:  x
t = 21.65, df = 15, p-value = 9.976e-13
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 12.39066 15.09684  # това е търсеният доверителен интервал
sample estimates:
mean of x 
 13.74375 

# s drug doveritelen interval
> t.test(x, conf.level = 0.96)

	One Sample t-test

data:  x
t = 21.65, df = 15, p-value = 9.976e-13
alternative hypothesis: true mean is not equal to 0
96 percent confidence interval:
 12.31633 15.17117 # това е търсеният доверителен интервал
sample estimates:
mean of x 
 13.74375 # оценка на очакването

#Problem2
> t.test(x, conf.level = 0.95)

	One Sample t-test

data:  x
t = 21.65, df = 15, p-value = 9.976e-13
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 12.39066 15.09684
sample estimates:
mean of x 
 13.74375 
 
> t.test(x, conf.level = 0.90)

	One Sample t-test

data:  x
t = 21.65, df = 15, p-value = 9.976e-13
alternative hypothesis: true mean is not equal to 0
90 percent confidence interval:
 12.63088 14.85662
sample estimates:
mean of x 
 13.74375

# Problem 3
> observations = rnorm(20, 5, 2)
> t = t.test(observations, conf.level = 0.90)
# това трябва да се провери t$conf.int[1] < t$estimate < t$conf.int[2]
# сега трябва да повторим опита 100 пъти
# и да видим колко често горното условие ще е изпълнено
> c = 0
> for(i in 1:100){
+     obs = rnorm(20, 5, 2)
+     t = t.test(obs, conf.level = 0.90)
+     if(t$conf.int[1] < t$estimate & t$estimate < t$conf.int[2]){
+         c = c + 1
+     }
+ }
> c
[1] 100 # => ВИНАГИ

# Problem 4
# student distribution => dt , pt, qt, rt

# degree of freedom 5
> st5 = rt(100,5)

# degree of freedom 10
> st10 = rt(100,10)

> hist(st5, probability = T)
> lines(density(st5))

# Problem 5
# x1 ... x150
# xi prinadleji na Bi(1, p)
 
> p = prop.test(87,150, conf.level = 0.92)
> p$conf.int
[1] 0.5051991 0.6514474
> p

	1-sample proportions test with continuity correction

data:  87 out of 150, null probability 0.5
X-squared = 3.5267, df = 1, p-value = 0.06039
alternative hypothesis: true p is not equal to 0.5
92 percent confidence interval:
 0.5051991 0.6514474
sample estimates:
   p 
0.58 

# Problem6
# ako sa bulevi kato 1/0 se pravi prop.test
# t.test e za N
# ako ne sa normalni se pravi test za medianata "wilcox.test" nqma iziskvane da sa N
# 6A
> hist(rat) # izglejda dobre(normalno razpredeleni)
> t.test(rat, conf.level = 0.96)

# 6B
> hist(exec.pay) # ne izglejda dobre, poveche prilicha na exp distr
> wilcox.test(exec.pay, conf.int = T, conf.level = 0.96)

# 6C
> hist(malpract) # ne e normalno razpr, poveche expr distr
> wilcox.test(malpract, conf.int = T, conf.level = 0.96)
