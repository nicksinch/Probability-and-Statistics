# Problems solved during 2nd Week in FMI - PaS ( Probability and Statistics course)

# Problem 1

str(survey) # Loading survey

meanValue = mean(survey$Height, na.rm = T)
meanValue

# Getting Standard Deviation
Sd = sd(survey$Height, na.rm = T)
sd

# Average (Absolute) Deviation
# Formula for average deviation is sum(abs(Xi-meanValue0)/vectorLength, i = 1 to vectorLength
# I calculate it manually because I couldn't find a function that takes care of it
# ( Package should be downloaded )


subtractMean = c(survey$Height - meanValue)
AverageDev = sum(abs(subtractMean)) / length(survey$Height)
AverageDev

# Now making independent calulation for men and women

males = which(survey$Sex=="Male") # Gets vector of indices of students who are males
MalesHeight = survey$Height[males]
MalesHeight # Vector consisting only of males' heights

females = which(survey$Sex=="Female") # Gets vector of indices of students who are females
FemalesHeight = survey$Height[females]
FemalesHeight # Vector consisting only of females' heights

# What proportion of the students are between the interval:
# a) (Xn − Sn, Xn + Sn) ?
# b) (Xn − 2Sn, Xn + 2Sn) ?
# c) (Xn − 3Sn, Xn + 3Sn) ?


# Cut those values from survey$Height that are between the interval (mean - sd, mean + sd)
IntervalOne = cut(survey$Height, breaks=c(meanValue - Sd , meanValue + Sd ))
table(IntervalOne) # Shows us the number of those between this interval ( N = 143 )
# To calculate the proportion:
143 / length(survey$Height) # 0.6033755 ( Around 60% )

# (mean - 2sd, mean + 2sd)
IntervalTwo = cut(survey$Height, breaks=c(meanValue - 2*Sd , meanValue + 2*Sd ))
table(IntervalTwo) # Calculations are analogically made
202 / length(survey$Height) # 0.8523207 ( Around 85 %)

# (mean - 3sd, mean + 3sd)
IntervalThree = cut(survey$Height, breaks=c(meanValue - 3*Sd , meanValue + 3*Sd ))
table(IntervalThree) # Calculations are analogically made
209 / length(survey$Height) # 0.8818565 ( Around 88 % )

# Problem 2

boxplot(survey$Height)

boxplot(survey$Height,horizontal = T) 

boxplot(survey$Height[survey$Sex=="Male"])
boxplot(survey$Height[survey$Sex=="Female"])

boxplot(survey$Height~survey$Sex) 

# Problem 3 

HeightHist = hist(survey$Height) # Make a histogram
# Very usefly ( Displays the structure of an object (histogram in this case))
str(HeightHist)

lines(HeightHist$mids,HeightHist$counts)

HeightHist = hist(survey$Height, probability = T) # Shows probability dist on histogra
lines(density(survey$Height,na.rm = T)) # Adding density

boxplot(survey$Pulse~survey$Sex) # ??

PulseHist = hist(survey$Pulse)
lines(PulseHist$mids,PulseHist$counts) # Make lines to hist

lines(density(survey$Pulse,na.rm=T))

hist(survey$Pulse,probability = T)

hist(survey$Pulse,probability = T,xlim=c(0,150))

# We can later plar around some more with histogram parameters like
# xlim , ylim, xlab, axes, freq, density, etc



# We want to show the pulse from 0-150 so we set the xlim param. to 0,150
# And we also want the probabilities displayed from 0 to 0.05, so we set the ylim param.

hist(survey$Pulse,probability = T,ylim=c(0,0.05),xlim=c(0,150))

# Problem 4

library(UsingR)
attach(homedata)

plot(y1970,y2000)

abline(lm(y2000~y1970))

identify(y1970,y2000,n=2)
identify(y2000,y1970,n=2)
identify(y1970,y2000)
identify(y2000,y1970)
identify(y1970,y2000)

# Problem 5

str(anscombe)
cor(y1970,y2000)

sd(anscombe$x1) 
sd(anscombe$x2)
summary(anscombe$x1,na.rm=T)

