# Problem 1

> ages = scan()
1: 18 23 25 35 65 54 34 56 72 19 23 42 18 39 37
16: 
  Read 15 items
> pulses = scan()
1: 202 186 187 180 156 169 174 172 153 199 193 174 198 183 178
16: 
  Read 15 items

# Y = 220 - X ; svoboden chlen 220, koef = -1
> x = ages
> y = pulses

> mx = mean(x)
> my = mean(y)

> b1 = sum( ((y - my) * (x - mx)) / sum((x - mx)^2))
> b1
[1] -0.7977266
> b0 = my - b1*mx
> b0
[1] 210.0485
> abline(b0, b1)

# ima i gotova funkciq, koqto smqta vsichko ;)
# y e funkciq na x

> lm(y ~ x)

Call:
  lm(formula = y ~ x)

Coefficients:
  (Intercept)            x  
210.0485      -0.7977  

> l = lm(y ~ x)
> plot(x, y)
> abline(l)

# proverqvame koq e tazi chisto vizualno sumnitelno izglejdashta tochka
> identify(x, y, n=2)
# cykash na grafikata na tochkata
[1]  7 15

> x[7]
[1] 34
> y[7]
[1] 174

> summary(l)

Call:
  lm(formula = y ~ x)

Residuals:
  Min      1Q  Median      3Q     Max 
-8.9258 -2.5383  0.3879  3.1867  6.6242 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 210.04846    2.86694   73.27  < 2e-16 ***
  x            -0.79773    0.06996  -11.40 3.85e-08 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.578 on 13 degrees of freedom
Multiple R-squared:  0.9091,	Adjusted R-squared:  0.9021 
F-statistic:   130 on 1 and 13 DF,  p-value: 3.848e-08

# pishem nqkakvi neshta na duskata
# SSE, SST, SSR ==== ima nqkakvi formuli, summary ni gi dade vij gore :)

# v zadachata vidqhme Y = 220 - X
# no nie namerihme, che svobodniqt chlen e 210.04.., a koef e -0.79773

# ot duskata:
# H0: b1 = b
# H1: b1 != b
# t = (b1 - b) / SEb1, tiq sa dadeni v summary-to
# t e razpredelenie na student(n-2)

# v nashata zadacha
# H0: b1 = -1
# H1: b1 != -1
# tr da smetnem t

> s = summary(l)
> s$coefficients
Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 210.0484584 2.86693893  73.26576 2.124074e-18
x            -0.7977266 0.06996281 -11.40215 3.847987e-08

> coef(s)
Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 210.0484584 2.86693893  73.26576 2.124074e-18
x            -0.7977266 0.06996281 -11.40215 3.847987e-08

> cf = coef(s)

> t = (cf[2,1] - (-1)) / cf[2,2]
> t
[1] 2.891157

# pt vrushta nqkakvo lice ot lqvata strana
# izvadil go e ot 1, za da poluchi dqsnata strana
# i go umnojava po 2
# za da poluchim sbora na dvete chasti
> (1 - pt(t, df=length(x) - 2)) * 2
[1] 0.01262031

# 0.01 < 0.05 => H1


# sega proverqvame
# H0: b0 = 220
# H1: b0 != 220

> t = (cf[1,1] - 220) / cf[1,2]
> t
[1] -3.471138

# tozi put samo pt, zashtoto e otricatelno, bez 1 -
# pak po dve, za da suberem i dvete strani
> pt(t, df = length(y) - 2) * 2
[1] 0.004136843

# namerete max puls za 30, 40 ,50
# Y = 210 -0.79X
# X = 30, 40, 50
# ako iskame ruchno - s gornoto uravnenie, no moje i s gotova funkciq ;)

> d = data.frame(x=c(30,40,50))
> d
x
1 30
2 40
3 50

# 1=30, 2=40, 3=50
> predict.lm(l, d)
1        2        3 
186.1167 178.1394 170.1621


# za doveritelniq interval ot 90%
> predict.lm(l, d, interval = 'confidence', level = 0.90)
fit      lwr      upr
1 186.1167 183.8348 188.3986
2 178.1394 176.0203 180.2585
3 170.1621 167.5459 172.7783

# chertaem grafikata sega na dov interval
> d = data.frame(x=seq(10, 80, 10))
> pr = predict.lm(l, d, interval = 'confidence', level = 0.90)
> plot(x, y)
> abline(l)
# gorniq dov interval
> lines(seq(10, 80, 10), pr[, 3], col='red')
# dolniq dov interval
> lines(seq(10, 80, 10), pr[, 2], col='blue')

# kak testvame modela? gledame nqkolko neshta v summary
# gledame multiple R-squared, pr(>|t|)
# ili da pusnem plot(l)
# tova pravi nqkolko posledovatelni grafiki na l
# Residuals vs Fitted ako ima nqkakva zavisimost m/u tochkite znachi neshto ne e nared (nz?)
# drug problem: ako grafikata izglejda kato sonic wave(narastvasht)

#Problem 3
> x = scan()
1: 8.9 6.4 12.8 9.6 13.8 16.1 12.4 12.8 11.8 16.0 7.4 12.5
13: 
  Read 12 items
> y = scan()
1: 306.2 272.5 385.0 392.5 400.0 531.2 415.0 407.5 373.7 493.7 325.0 400.0
13: 
  Read 12 items

> plot(x, y)
> l = lm(y~x)
> abline(l)
> summary(l)

# ochakvana rekolta za 10cm/m^2
> d = data.frame(x = c(10))
> predict.lm(l, d)
1 
355.0099 

# ?? Y = 139.31  + 21.57X
# koeficintite doydoha ot summary

# H0: b1 <=24 // b1 = 24
# H1: b1 > 24 // b1 != 24

# t = (b1 - 24) / SEb1
# w = { t > q } // ako beshe dvustranna hipoteza, kato b1 = X i b1 != X, togava umnojavame pt(...) * 2
# no v tazi zadacha imame po-malko

> cf = coef(summary(l))
> cf
Estimate Std. Error  t value     Pr(>|t|)
(Intercept) 139.31164  34.297481 4.061862 2.279736e-03
x            21.56982   2.840369 7.594022 1.852563e-05

> t = (cf[2,1] - 24) / cf[2,2]
> t
[1] -0.8555844

> 1 - pt(t, df=length(x) - 2)w
[1] 0.7938708
# tova e p-val
# => H0 // ne moje da tvurdim che vodi do uvelichavane

# Problem 2
> library(UsingR)
> plot(mtcars)

> x = mtcars[,3] #displacement
> y = mtcars[,1] #consumption
> z = mtcars[,4] #horsepower

# Razhod = b1.ObemNaDvig + b0,
# b1?

> plot(x,y)
> l = lm(y ~ x)
> abline(l)
> coef(summary(l))
Estimate  Std. Error   t value     Pr(>|t|)
(Intercept) 29.59985476 1.229719515 24.070411 3.576586e-21
x           -0.04121512 0.004711833 -8.747152 9.380327e-10

# b1 = -0.04121512
# b0 = 29.59985476

# izvod namalqva razstoqnieto, koeto izminavame za vseki cm3