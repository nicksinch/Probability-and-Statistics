# Нека X е случайна величина , която принадлежи на  N( N(25, 36)
# Sd = 36 => Var = sqrt(36) = 6
# Каква част от пъпешите са трето качество ?
# Тоест търсим P(X < 20)

pnorm(20, 25, 6)
[1] 0.2023284

# 20 %

# Колко голям трябва да е пъпеш , за да е първо качество ?

# 0.6 защото досега имахме 0.2 следователно всичко останало е от 0.2 до 1.0 ( в този интервал )
# средното на 0.2 и 1.0 = 0.6
> qnorm(0.6, 25, 6)
[1] 26.52008
