# Loading mass package
library(MASS)

# attach(survey)

surv = MASS::survey

# Ex.1

# a) Number of Men

table(surv$Sex) # We see it's 118

# b) Men who smoke

# Make a table of Female and Male smokers
t = table(surv$Sex, surv$Smoke)

# Sum all the values of second row except for the 2nd column because they never smoke
sum(t[2,-2])

# c) Average Height of Men

av = mean(surv$Height[surv$Sex=='Male'],na.rm=T)

# d) Height and Sex of 6 youngest Students

# This sorts the indices (Note that) of all students' ages
i = order(surv$Age) 

# Then we take height of 6 youngest
surv$Height[i[1:6]]

# Finally, their Sex
surv$Sex[i[1:6]]

# Ex2.
# According to the data:

# a) What is the probability that an arbitrary man turns out to be a regular smoker?
prop.table(table(surv$Smoke))

# b) Probability that an arbitrary person turns out to be a regular men smoker ?
prop.table(table(surv$Sex, surv$Smoke))

# c) Prob. that an arbitrary male turns out to be a regular smoker
# Since we want only males, we should exclude females, which are 1st on the table
# That's why the second argument is a 1
prop.table(table(surv$Sex, surv$Smoke), 1)

# d) Prob. that an arbitrary regular smoker is a man ?
prop.table(table(surv$Sex, surv$Smoke), 2)

# ex.3
# Make a graphic representation of smoking students and also of those
# depending on their sex

pie(table(surv$Smoke)) # Pie Chart

barplot(table(surv$Smoke)) # Bar plot

# Setting 'legend' and 'beside' attribute to True means for both males and females will be printed
barplot(table(surv$Sex , surv$Smoke ), beside = T, legend = T)

# The probability barplot of the above barplot
barplot(prop.table(table(surv$Sex , surv$Smoke ), 2), beside = T, legend = T)
