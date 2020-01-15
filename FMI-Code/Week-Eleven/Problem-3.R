# Problem 3 - Letter Distributions
# Подобна на примера от 'Simple-R', секция 'Хи-квадрат тестове'

# H0 ( Null Hypothesis ) - Думата е на английски.
# H1 ( Алтернатива ) - Думата НЕ е на английски.

LetterFreq = c(102,108,90,95,82,40)

Prob = c(12.7, 9.56, 8.17, 7.51, 6.97, 6.75, 48.34) # 48.34 are other letters

# Понеже в chisq.test вероятностите трябва да се сумират до 1 
Prob = Prob / 100

# Понеже като пуснем chisq.test, векторите, които подаваме трябва да са с еднакви дължини
# Добавяме броя срещания на другите букви, различни от E ,T ,A ,O , I, N

LetterFreq = c(LetterFreq,1036 - sum(LetterFreq))

chisq.test(LetterFreq, p = Prob)

Chi-squared test for given probabilities

data:  LetterFreq
X-squared = 26.396, df = 6, p-value = 0.0001878

# p-val = 0.0001878 Следователно H0 е отхвърлена и приемаме H1.
