# Problem 1
#Функция за проверка: oneway.test (Y ~ X) средното на У спрямо Х
#Данните трябва да са нормално разпределени
#Н0: Имат еднакви критерий ( myu1 = myu2= myu3 ).
#H1: Поне един има различен критерий.



First = scan()

Second = scan()

Third = scan()

myu1 = mean(First)
myu2 = mean(Second)
myu3 = mean(Third)

boxplot(First,Second,Third)

d = data.frame(First, Second, Third )

boxplot(d) # Same as the first, but with names

First Second Third
1      5      3     4
2      4      2     6
3      4      4     4
4      6      5     2
5      4      3     4
6      6      4     5
7      3      3     5
8      3      4     3
9      4      2     6
10     5      4     4


s = stack(d) # буквало вкарва всички в стойности в стек 
# И им "задава" индекс, който отговаря на това от коя променлива са (kindof) :



values    ind
1       5  First
2       4  First
3       4  First
4       6  First
5       4  First
6       6  First
7       3  First
8       3  First
9       4  First
10      5  First
11      3 Second
12      2 Second
13      4 Second
14      5 Second
15      3 Second
16      4 Second
17      3 Second
18      4 Second
19      2 Second
20      4 Second
21      4  Third
22      6  Third
23      4  Third
24      2  Third
25      4  Third
26      5  Third
27      5  Third
28      3  Third
29      6  Third
30      4  Third

# Проверяваме дали данните на тримата са ND

shapiro.test(First) # p-value = 0.177 ===> ND
shapiro.test(Second) # p-value = 0.2449 ===> ND
shapiro.test(Third) #p-value = 0.4365 ===> ND

# Следователно можем да пуснем oneway.test
# (Test for Equal Means in a One-Way Layout)

oneway.test(s)

oneway.test(s$values ~ s$ind)

One-way analysis of means (not assuming equal
                           variances)

data:  s$values and s$ind
F = 2.7825, num df = 2.000, denom df = 17.811, p-value
= 0.0888

# p-value > 0.05 ===> H0( по - скоро са еднакви ), ако е < 0 , я отхвърляме

# Когато данните не са нормално разпределени, използваме Kurskal-test :

kruskal.test(  s$values ~ s$ind )

Kruskal-Wallis rank sum test

data:  s$values by s$ind
Kruskal-Wallis chi-squared = 4.3647, df = 2, p-value =
  0.1128
