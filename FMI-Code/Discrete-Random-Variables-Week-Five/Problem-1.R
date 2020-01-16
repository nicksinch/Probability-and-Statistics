# Problem 1

# If we want the probability to roll exactly 4 6's out of 30 tries
dbinom(4,30, 1/6)

pbinom(4,30,1/6) # Since we want < 5 6s (it means <= 4, a quantile)
# This is the Cumulative prob. distribution function
# which is equal to exactly 0 6s + exactly 1 6s + exactly 2 6s
# + exactly 3 6s + exactly 4 six.

# The above is the same as
sum(dbinom(0:4,30,1/6))

# With a probability of 0.75, we can claim that there will be
# more than 4 6s. rolled, which is shown with
qbinom(0.75,30,1/6,lower.tail = F) 

# By default lower.tail is set to True ( X <= x) and if false X > x

# With a prob. of 0.75, less than or equal to 6 6s will be rolled
qbinom(0.75,30,1/6,lower.tail = T)


sampleList=rbinom(1000,30,1/6)
# First argument: number of OBSERVATIONS you want to see
# Second argument: number of TRIALS per OBSERVATION
# Probability of success for each TRIAL

# So the above function makes a vector of 1000 observations 
# Consisting of 30 trials each one with a prob. of succes 1/6 for each trial

# We can also model a bernoulli trial, which just has 1 trial:

rbinom(10,1,0.5) # 10 obs. with 1 trial with 0.5 prob. of success


# Problem 3

HyperVector = rhyper(1000,7,6,8)
# 7 white balls, 6 black and we draw 8

HyperVector[1:10]

minValue = min(HyperVector)

maxValue = max(HyperVector)

Ex = mean(HyperVector)

Variance=var(HyperVector) # Measure of dispersion ( SD ^ 2)

7*8/13

barplot(table(HyperVector))

hist(HyperVector)

hist(HyperVector,breaks = 1:7,probability = T)

sum(dhyper(2:7,7,6,8))

x=dhyper(2:7,7,6,8)

lines(c(1,1.2,2,3,3,4,4,5,4,6,6))

