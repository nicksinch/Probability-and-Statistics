# Problem 1.1
# Keeping track of mileage each time you fill up

miles = c(65311, 65624, 65908, 66219, 66499, 66821, 67145, 67447)

# Saves number of miles between fill-ups
x = diff(miles)
max(x)

mean(x)

min(x)

#Problem 1.2

commutes = c(17,16,20,24,22,15,21,15,17,22)

max(commutes)
mean(commutes)
min(commutes)

# 24 was a mistake, replace it with 18
commutes[which(commutes==24)] = 18
mean(commutes)
sum(commutes >= 20) # How many times was the commute 20 or more ?

# To get the percent of those that are less than 17
length(which(commutes < 17)) / length(commutes) 

# Problem 1.3

bill = c(46, 33, 39, 37, 46, 30, 48, 32, 49, 35, 30, 48)

amountSpent = sum(bill) # Total amount spent
min(bill) # Smallest amount spent
max(bill) # Largest amount spent

length(which(bill > 40)) # How many months are greater than 40, to get the percentage:
length(which(bill > 40)) / length(bill)

# Problem 1.4 analogically, going to 1.5

t1 = c(1,3,5,7,9)
t2 = c(2,3,5,7,11,13)

# t1 + t2 will yield an error since length(t1) != t2

# Problem 1.6

x2 = c(1, 8, 2, 6, 3, 8, 5, 5, 5, 5)

sum(x2) / 10

log10(x2)

((x2 - 4.4) / 2.875)
max(x2) - min(x2)
