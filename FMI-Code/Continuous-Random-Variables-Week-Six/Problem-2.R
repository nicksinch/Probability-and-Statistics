# Problem 2

# Generating 100 observations with SD = 1
Obs = rnorm(100,0,sqrt(1))

# To see how much values are in the intervals (-1,1], (-2, 2], (-3,3]
table(cut(Obs,c(-1,1)))

table(cut(Obs, c(-2,2)))

table(cut(Obs, c(-3,3)))

# Theoretical probability to be in the (-1,1] interval
# Same ND but now we are interested in the intervals, so we use pnorm(quantile f.)
pnorm(1,0,1)-pnorm(-1,0,1) # quantile func.

# Theoretical probability to be in the (-2,2] interval
pnorm(2,0,1)-pnorm(-2,0,1) # quantile func.

# Theoretical probability to be in the (-3,3] interval
pnorm(3,0,1)-pnorm(-3,0,1) # quantile func.
