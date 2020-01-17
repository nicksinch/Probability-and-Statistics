# Problem - 2

library(UsingR)
attach(birthwt)


# a)

t = birthwt[smoke == 1 & bwt < 2500,] # Пушачки, родили бебе под 2.5кг.
length(birthwt[smoke == 1 & bwt < 2500,]$low)
[1] 30

# Може и със sum(low & smoke)


# б)
table(smoke, race)


        race
smoke  1  2  3
      0 44 16 55
      1 52 10 12
      
barplot(table(smoke,race))


