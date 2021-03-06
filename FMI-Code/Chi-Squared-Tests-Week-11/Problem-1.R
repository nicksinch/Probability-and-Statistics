# Probem 1

# Задачата е взета от книгата "Simple R", секция 'Хи-квадрат тестове'

# Четем съответните честтоти на цифрата от хвърлянията на зара
DiceFreq = c(22,21,22,27,22,36)

# Интересуваме се дали зарът е симетричен ?
# Ако е симетричен, тогава всяка страна да се падне, е равновероятна = 1/6

# Т.е. , при 150 хвърляния , очакваме всяка страна да има около 25 падания
# Но това, което лови окото е , че 6-цата се е паднала 36 пъти.

# За да разберем дали зарът е симетричен, трябва да видим
# колко са се отдалечили данните от очакваното ?

# Ако Fi е съответната честота на категория i,
# а Ei е очакваният брой да се падне съответното число от категория i
# Тогава Xi^2 statistic е дефиниран по следния начин:

# sum( (Fi - Ei)^2 / Ei)

# Тогава полученото число е сравнително голямо , ако има
# голямо несъответсвие между фактическите честоти и очакваните и малко, ако такова няма


# Правим вектор със съответните вероятности:
Probs = rep(1/6,6)

# H0 ( Null Hypothesis ( Нулева хипотеза )) : Вероятностите за всяка категория i, са така , както са представени (т.е. p = 1/6)
# H1 ( Alternative Hypothesis (Алтернативна хипотеза )) : Поне една няма тази вероятност ( 1/6 ).

chisq.test(DiceFreq, p=Probs)

X-squared = 6.72, df = 5, p-value = 0.2423

# Виждаме , че p-value = 0.2423, така че НЯМА причина да отхвърлим H0
# (Хипотезата, че зарът е симетричен.)
