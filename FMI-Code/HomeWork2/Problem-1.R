# Problem - 1

FourthExpr = morley[morley$Expt == '4', ]

FourthExpr

hist(FourthExpr$Speed) # изглежда добре!

qqnorm(FourthExpr$Speed)
qqline(FourthExpr$Speed)

shapiro.test(FourthExpr$Speed)

results = t.test(FourthExpr$Speed, conf.level = 0.97)
results

results$conf.int