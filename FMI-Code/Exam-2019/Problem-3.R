# Problem - 3

# lb := light baby
# nb: = normal baby
lb_women_age = birthwt$age[birthwt$low == 1] # Вземаме годините, на тези с по - лекото родено бебе
nb_women_age = birthwt$age[birthwt$low == 0] # ---/---

hist(lb_women_age)
hist(nb_women_age)

# Изглеждат по - млади, но нека да направим тестовете

# H0: myuLB >= myuNB 
# H1: myuLB < myuNB # родили бебе под 2,5кг са по-млади

shapiro.test(lb_women_age) # ND !
shapiro.test(nb_women_age) # NOT ND !

# ====> Wilcox test


wilcox.test(lb_women_age, nb_women_age, alternative = "less")

	Wilcoxon rank sum test with continuity correction

data:  lb_women_age and nb_women_age
W = 3432, p-value = 0.1236
alternative hypothesis: true location shift is less than 0

# => H0 (т.е НЕ МОЖЕ ДА ТВЪРДИМ, ЧЕ РОДИЛИТЕ БЕБЕ ПОД 2.5КГ СА ПО-МЛАДИ) ????????? (UNCERTAIN)
