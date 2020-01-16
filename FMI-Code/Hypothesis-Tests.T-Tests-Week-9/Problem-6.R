# Problem 6

# X is N(2,4); n observations; n = 10, 30, 100
# n = 10

# а) Н0: mu = 3, H1: mu != 3
# б) Н0: mu = 5, H1: mu != 5

# а) при n = 10

Gen1 = rnorm(10,2,2)

t.test(Gen1, mu = 3, alternative = "two.sided")


One Sample t-test

data:  Gen1
t = -3.0302, df = 9, p-value = 0.01424
alternative hypothesis: true mean is not equal to 3
95 percent confidence interval:
  -0.2547824  2.5276426
sample estimates:
  mean of x 
1.13643

# При n = 30

Gen1 = rnorm(30,2,2)

t.test(Gen1, mu = 3, alternative = "two.sided")

One Sample t-test

data:  Gen1
t = -2.4922, df = 29, p-value = 0.01866
alternative hypothesis: true mean is not equal to 3
95 percent confidence interval:
  1.418965 2.844242
sample estimates:
  mean of x 
2.131604 

# при n = 100

Gen1 = rnorm(100,2,2)

t.test(Gen1, mu = 3, alternative = "two.sided")

One Sample t-test

data:  Gen1
t = -5.856, df = 99, p-value = 6.198e-08
alternative hypothesis: true mean is not equal to 3
95 percent confidence interval:
  1.370410 2.195252
sample estimates:
  mean of x 
1.782831

# б) при n = 10


Gen1 = rnorm(10,2,2)
t.test(Gen1, mu = 5, alternative = "two.sided")

ne Sample t-test

data:  Gen1
t = -10.064, df = 9, p-value = 3.394e-06
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
  -0.3472916  1.6154984
sample estimates:
  mean of x 
0.6341034 


# Аналогично за останалите случаи при n = 30 и n = 100 ...
