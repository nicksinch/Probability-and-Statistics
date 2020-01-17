# Problem - 4

file = read.csv("DomR2.txt", header = T)

# Понеже y e откликът
m1 = lm(file $y ~ file $x1 + file $x2 + file$x3)

summary(m1)

Call:
  lm(formula = file$y ~ file$x1 + file$x2 + file$x3)

Residuals:
  Min      1Q  Median      3Q     Max 
-2.3555 -1.0974 -0.0440  0.8564  3.8141 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.78819    1.59837   0.493 0.628626    
file$x1     -1.69794    0.38941  -4.360 0.000486 ***
  file$x2     -0.01992    0.02047  -0.973 0.344931    
file$x3      1.11443    0.13025   8.556  2.3e-07 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.648 on 16 degrees of freedom
Multiple R-squared:  0.879,	Adjusted R-squared:  0.8563 
F-statistic: 38.73 on 3 and 16 DF,  p-value: 1.451e-07

m2 = lm(file$y ~ file$x1 + file$x3)

summary(m2)

m3 = lm(file$y ~ file$x1 + file$x3 - 1) #За да махнем (Intercept) => -1

anova(m1, m3)

s = summary(m3)
print(s)

coef = -1
x1Estimate = s$coefficients[1,1]
x1StdErr = s$coefficients[1,2]

t = (x1Estimate - coef) / x1StdErr
x1Len = length(file$x1)

if (t > 0) {
  p_val = 2 *( 1 - pt(t, df = x1Len - 2))
  } else {
    p_val = 2 * pt(t, df = x1Len - 2)
    }
print(p_val)