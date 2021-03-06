# Problem 2

# Улучва мишената с вероятност 0,2
# За да спечели , трябва да направи 3 точни попадения

# Удобно е да въведем сл.вел. X:= броят на неуспехите до 3-тия успех

# a )

# Вариант 1: ( по - трудния по мое мнение )

# Искаме да изчислим P(X = 5) , понеже за 8 изстрела,
# трябва да имаме 5 неуспеха + 2 успеха + последния успешен

# Отрицателно биномно разпределение !

dnbinom(5,3,0.2) # Искаме 3 успеха

# Вариант 2: ( по - лесния според мен )

# Просто искаме вероятността на 2 задължителни успеха измежду 7 с P = 0.2
# и след това 8-мия да е задължително успех , за да станат 3, това очевидно става така:

dbinom(2,7, 0.2)*0.2 # dbinom(k,n,p) k success in n trials with prob = p


# б) Повече от 6 изстрела ===> P( X > 6 ) = 1 - P( X<=6 )

# => 1 - pnbinom(3,3,0.2) ( q за квантил - искаме <= 3 )
1 - pnbinom(3,3,0.2)

# Или
pnbinom(3, 3, 0.2, lower.tail = F) #  == 1 - pnbinom(3, 3, 0.2)

# в)

sum(dnbinom(2:5, 3, 0.2))

[1] 0.1758822

# ИЛИ

pnbinom(5, 3, 0.2) - pnbinom(1, 3, 0.2)
