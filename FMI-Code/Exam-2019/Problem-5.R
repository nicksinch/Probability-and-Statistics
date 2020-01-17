#Problem - 5

# H0: Injuries _ || _ Rank
# H1 Зависими са 

wo_inj = c(43, 96, 123)
inj = c(12, 32, 35)
dead = c(8, 18, 44)

m = matrix(c(wo_inj, inj, dead), nrow = 3, byrow=T)
m
[,1] [,2] [,3]
[1,]   43   96  123
[2,]   12   32   35
[3,]    8   18   44

chisq.test(m)

Pearson's Chi-squared test

data:  m
X-squared = 6.749, df = 4, p-value = 0.1498

# ===> H0
