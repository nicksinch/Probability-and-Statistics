# Y = b0 + b1X1 + b2X2 + .... + bpXp + e(epsilon(greshka))
# predniq put imahme samo Y = b0 + b1X
# Y1 x11 .... xp1
# ...
# Yn xn1 .... xpn
# v R go pishem kato lm(Y~X1 + X2 + .... + Xp)

# Kamenov's Example:
> x1 = runif(100, 0, 5)
> hist(x1)
> x2 = rexp(100, 2)
> hist(x2)
> x3 = rnorm(100, 2)
> hist(x3)
> err = rnorm(100, 0.1)
> y = 0.5 * x1 - x3 + err
> d = data.frame(y, x1, x2, x3)
> plot(d)

> l = lm(y ~ x1 + x2 + x3)
> summary(l)

Call:
lm(formula = y ~ x1 + x2 + x3)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.14019 -0.63046 -0.00818  0.70043  2.46565 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.06450    0.28823   0.224    0.823    
x1           0.51140    0.06711   7.620  1.8e-11 ***
x2           0.10753    0.20843   0.516    0.607    
x3          -1.02803    0.09786 -10.505  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9573 on 96 degrees of freedom
Multiple R-squared:  0.644,	Adjusted R-squared:  0.6328 
F-statistic: 57.88 on 3 and 96 DF,  p-value: < 2.2e-16

> y2 = 0.5 * x1 - x3
> l2 = lm(y2 ~ x1 + x2 + x3)
> summary(l2)
...

# razglejdame prednite rezultati

# Y = 0.5X1 - X3
# Y = 0.06 + 0.51X1 + 0.10X2 - 1.02X3

# 1.8e-11 => tova e po malko ot 0.05 => koef ne moje da e nula => H1

# H0: b1 = 0
# H1: b1 != 0 

# 0.607 => tova e po-golqmo ot 0.05 => koef pred x2 moje da e nula => H0
# H0 : b2 = 0
# H1: b2 !=0

# a p-valueto ot posledniq red (2.2e-16) proverqva dali
# vijdame che tova e po-malko ot 0.05 => H1
# H0 : b1 = b2 = b3 = ... = 0
# H1 : pone edno e razlichno ot nula

#tuy kato b2 == 0 e s visoko p-value, moje da go mahnem izcqlo
> l2 = lm(y ~ x1 + x3)
> summary(l2)

Call:
lm(formula = y ~ x1 + x3)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.15726 -0.60831 -0.01656  0.68564  2.41440 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.11014    0.27327   0.403    0.688    
x1           0.50618    0.06610   7.658 1.42e-11 ***
x3          -1.01880    0.09585 -10.629  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9536 on 97 degrees of freedom
Multiple R-squared:  0.643,	Adjusted R-squared:  0.6356 
F-statistic: 87.35 on 2 and 97 DF,  p-value: < 2.2e-16

# Lirichesko otklonenie R^2
# chertaem prava i gledame tochkite dali sa okolo pravata
# ako sa okolo pravata => multiple R^2 shte se okaje golqmo (tova oznachava che ima malko ostatuchno razseyvane)
# dori da imame prava, ako tochkite sa mnogo razseqni => multiple R^2 e malko
# R e ot 0 do 1
# R pokazva kakuv procent ot razseyvaneto na dannite se opisva ot modela
# koga schitame R za golqmo? v psihologiqta 0.4 e golqmo; vyv fizikata 0.9 e golqmo

# Kamenov explains multiple R^2 with an example

> z = x1 + err
> z2 = x1 + 3*err

> plot(x1, z)
> plot(x1, z2)

> points(x1, z, col='red')
# vijdame che modela s po-golqmata greshka e po-razseqn

> lz = lm(z ~ x1)
> lz2 = lm(z2 ~ x1)

> summary(lz)
...
Multiple R-squared:  0.705,	Adjusted R-squared:  0.702 
...

> summary(lz2)
...
Multiple R-squared:  0.2141,	Adjusted R-squared:  0.2061 
...

# vijdame che lz ima po-visok Multiple R^2, zaradi po-malkata greshka ;)
# bravo mr Kamenov, well done
# ggwp
# kray na liricheskoto otklonenie R^2

# vijdame che l2 ima po-visoka stoynost na adjusted R-squared: 0.6356
# => po-dobre da rabotim s l2

# za sravnqvane na 2 modela, koito sa vlojeni edin v drug

> anova(l, l2)
Analysis of Variance Table

Model 1: y ~ x1 + x2 + x3
Model 2: y ~ x1 + x3
  Res.Df    RSS Df Sum of Sq      F Pr(>F)
1     96 87.969                           
2     97 88.212 -1  -0.24388 0.2661 0.6071

# 0.6071 => e proverka za razlikata m/u dvata modela => za b2
# H0: b2 = 0
# H1: b2 != 0
# => H0 => dvata modela vurshat ednakva rabota


> l3 = lm(y ~ x1)
> anova(l, l3)
Analysis of Variance Table

Model 1: y ~ x1 + x2 + x3
Model 2: y ~ x1
  Res.Df     RSS Df Sum of Sq      F    Pr(>F)    
1     96  87.969                                  
2     98 190.956 -2   -102.99 56.195 < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# tova proverqva dali
# H0: b2 = b3 = 0
# H1 : pone edno ot b2 ili b3 e razlichno e 0
# vijdame che  2.2e-16 => H1

> summary(l2)

Call:
lm(formula = y ~ x1 + x3)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.15726 -0.60831 -0.01656  0.68564  2.41440 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.11014    0.27327   0.403    0.688   

# vijdame che na svobodniq chlen imame 0.823
# koeto oznachava che i toy e kandidat za stavane 0

# ako iskame da mahnem svobodniq chlen pravim slednoto
> li = lm(y ~ x1 + x3 - 1)
> summary(li)

Call:
lm(formula = y ~ x1 + x3 - 1)

Residuals:
     Min       1Q   Median       3Q      Max 
-2.12229 -0.56856 -0.02268  0.71395  2.38690 

Coefficients:
   Estimate Std. Error t value Pr(>|t|)    
x1  0.52297    0.05111   10.23   <2e-16 ***
x3 -0.99156    0.06767  -14.65   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9495 on 98 degrees of freedom
Multiple R-squared:  0.6896,	Adjusted R-squared:  0.6833 
F-statistic: 108.9 on 2 and 98 DF,  p-value: < 2.2e-16

# vijdame che intercept izchezva, kogato dobavim -1

# Problem1
> f = read.csv2('C:/Users/grade/Desktop/Height.txt', sep='\t', dec='.')
> f = f * 2.54

> l = lm(Height ~ momheight + dadheight, data = f) #  moje i lm(Height ~ . , data =f)
> summary(l)

Call:
lm(formula = Height ~ momheight + dadheight, data = f)

Residuals:
     Min       1Q   Median       3Q      Max 
-13.3980  -3.9527  -0.0944   3.7392  14.7302 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 47.11002    9.37967   5.023 1.08e-06 ***
momheight    0.30351    0.05446   5.573 7.61e-08 ***
dadheight    0.38786    0.04721   8.216 2.10e-14 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5.159 on 211 degrees of freedom
Multiple R-squared:  0.4335,	Adjusted R-squared:  0.4281 
F-statistic: 80.73 on 2 and 211 DF,  p-value: < 2.2e-16

# vijdame mnogo malki p-value ta => ne mojem da gi mahnem
> ldad = lm(Height ~ . -momheight, data = f)

> anova(l, ldad)
Analysis of Variance Table

Model 1: Height ~ momheight + dadheight
Model 2: Height ~ (momheight + dadheight) - momheight
  Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1    211 5616.1                                  
2    212 6442.7 -1   -826.56 31.054 7.608e-08 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# 7.608e-08 => modelite sa razlichni => nqmame osnovanie da izpolzvame po-malkiq model

> d = data.frame(momheight = c(160, 162, 166), dadheight = c(176 , 180, 185))
> d
  momheight dadheight
1       160       176
2       162       180
3       166       185

> predict.lm(l, d, level = 0.98)
       1        2        3 
163.9335 166.0919 169.2452 

# dvoykata ot 1vi red shte proizvede dete s rust 163.9335 itn

> predict.lm(l, d, interval = 'confidence', level = 0.98)
       fit      lwr      upr
1 163.9335 163.0837 164.7833 # 1va dvoyka v tozi interval
2 166.0919 165.1771 167.0067 # 2ra dvoyka v tozi interval
3 169.2452 168.0254 170.4651


# Problem2
> x = scan()
1: 100 200 300 450 600 800 1000
8: 
Read 7 items
> y = scan()
1: 253 337 395 451 495 534 574
8: 
Read 7 items
> plot(x, y)
> l = lm(y ~ x)
> abline(l)

# grafikata prilicha na kriva, zatova kamenov iska druga kriva
# ako iskame formula ot 2ra stepen pishem taka
# Y ~ X + I(X^2)

> l2 = lm(y ~ x + I(x^2))
> summary(l)

Call:
lm(formula = y ~ x)

Residuals:
       1        2        3        4        5        6        7 
-49.8788   0.7086  25.2959  31.1769  25.0578  -2.7675 -29.5929 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 269.46607   24.18421  11.142 0.000102 ***
x             0.33413    0.04181   7.992 0.000495 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 33.5 on 5 degrees of freedom
Multiple R-squared:  0.9274,	Adjusted R-squared:  0.9129 
F-statistic: 63.88 on 1 and 5 DF,  p-value: 0.0004951

> summary(l2)

Call:
lm(formula = y ~ x + I(x^2))

Residuals:
      1       2       3       4       5       6       7 
-14.420   9.192  13.624   2.060  -6.158 -12.912   8.614 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  2.002e+02  1.695e+01  11.811 0.000294 ***
x            7.062e-01  7.568e-02   9.332 0.000734 ***
I(x^2)      -3.410e-04  6.754e-05  -5.049 0.007237 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 13.79 on 4 degrees of freedom
Multiple R-squared:  0.9902,	Adjusted R-squared:  0.9852 
F-statistic: 201.1 on 2 and 4 DF,  p-value: 9.696e-05

# vijdame che imat hubavi stoynosti za Adjusted R-squared

> lines(x, l2$fitted.values, col='red')
# vijdame che tova opisva po-dobre
# tova e po-dobriqt model ;)

# Kamenov kazva, che tova e riskova procedura
# dade nqkakuv primer za 4ta stepen
# tezi modeli sa bili overfit
# double edged sword

# Problem 3

> l = lm(homeprice$list ~ homeprice$full + homeprice$half)
> summary(l)

Call:
lm(formula = homeprice$list ~ homeprice$full + homeprice$half)

Residuals:
    Min      1Q  Median      3Q     Max 
-157.88  -40.88   15.17   36.77  125.27 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)       22.98      39.47   0.582 0.565363    
homeprice$full   113.25      18.89   5.995 2.49e-06 ***
homeprice$half    86.41      21.19   4.078 0.000381 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 74.48 on 26 degrees of freedom
Multiple R-squared:  0.6448,	Adjusted R-squared:  0.6175 
F-statistic:  23.6 on 2 and 26 DF,  p-value: 1.431e-06

# Intercept has Pv of 0.565362 => can be removed!

> lwc = lm(homeprice$list ~ homeprice$full + homeprice$half - 1) # lwc := l without (free/intercept)coef

> anova(l, lwc)

Analysis of Variance Table

Model 1: homeprice$list ~ homeprice$full + homeprice$half
Model 2: homeprice$list ~ homeprice$full + homeprice$half - 1
  Res.Df    RSS Df Sum of Sq      F Pr(>F)
1     26 144220                           
2     27 146101 -1     -1881 0.3391 0.5654
> lwc

Call:
lm(formula = homeprice$list ~ homeprice$full + homeprice$half - 
    1)

Coefficients:
homeprice$full  homeprice$half  
        122.81           92.02  

# виждаме, че Pr(>F) = 0.5654 => може да използваме lwc като l

> s = summary(lwc)
> s

Call:
lm(formula = homeprice$list ~ homeprice$full + homeprice$half - 
    1)

Residuals:
    Min      1Q  Median      3Q     Max 
-159.63  -42.63   28.59   41.37  122.67 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
homeprice$full  122.808      9.227  13.310 2.24e-13 ***
homeprice$half   92.018     18.637   4.937 3.60e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 73.56 on 27 degrees of freedom
Multiple R-squared:  0.9437,	Adjusted R-squared:  0.9396 
F-statistic: 226.4 on 2 and 27 DF,  p-value: < 2.2e-16

> s$coefficients
                Estimate Std. Error   t value     Pr(>|t|)
homeprice$full 122.80837   9.226847 13.309896 2.237610e-13
homeprice$half  92.01762  18.637316  4.937278 3.604756e-05

> t = (s$coefficients[1,1] - 15000) / s$coefficients[1,2]
> t
[1] -1612.381
> pt(t, df=length(homeprice$list) - 2)
[1] 4.008049e-69

# maybe do (1-pt) * 2 ?
# ...

# or 2*pt?
> 2 * pt(t, df=length(homeprice$list) - 2)
[1] 8.016099e-69
