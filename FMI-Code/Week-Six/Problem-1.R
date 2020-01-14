# Problem 1 

# a) X e N(5,2) => varX = 2 = > sdX = sqrt(2)

x = rnorm(100, 5, sqrt(2)) 

boxplot(x, horizontal = T) # Displaying boxplot
hist(x) # Display a hist

# Empirical density
hist(x, probability = T)
lines(density(x))

# Theoretical density
z = seq(0, 10, 0.2) 

y = dnorm(z, 5, sqrt(2))

lines(z, y, col ='red')

qqnorm(x) # Theoretical quantiles

qqline(x) # Data quantiles
# Ако лежат близо до 1 права значи данните са Нормално разпределени

# b)
# X e U(5,2) , U - равномерно разпределение
# runif(n, minValue, maxValue)

u = runif(10000, 1, 5)
hist(u)

# Емпирична плътност
hist(u, probability = T)
lines(density(u))

# Tеоретична плътност
# една права която е като y = 0.25, където х е от 1 до 5
lines(c(1,5), c(0.25, 0.25))

# OR
z = seq(1, 5, 0.2)
z

y = dunif(z, 1, 5) # y = [0.25, 0.25, ...]
lines(z, y, col='red')

# c)
# X e Ex(3) - експоненциално разпределение

e = rexp(100, 3)

hist(e) 

# Емпирична плътност
hist(e, probability = T) 
lines(density(e)) 


# Теоретична плътност
z = seq(0, 3, 0.2)
y = dexp(z, 3)
lines(z, y, col='red')


# d)

# X ∈ Γ(5, 1)  - гама разпределение

g = rgamma(100, 5, 1)
hist(g)

# Емпирична плътност
hist(g)
hist(g, probability = T)

lines(density(g)) 

# Теоретична плътност
z = seq(0, 12, 0.2) # zashtoto kato pogledna hist vijdam che e do 12 po Ox
y = dgamma(z, 5, 1)
lines(z, y, col='red')

# Ж)
firstMix = rnorm(50,1, sqrt(2))

secondMix = rnorm(50,5, sqrt(2))

Mixed = c(firstMix, secondMix) # Mixing them both in a vector

# Емпирична плътност
hist(Mixed, probability = T)
lines(density(Mixed))

# Теоретична плътност
z = seq(-2, 8, 0.2)
y = dnorm(z, 5, 3) # Избираме 3 , защото е между 1 и 5 на firstMix и secondMix 
lines(z, y, col='red')
