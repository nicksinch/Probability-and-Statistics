# Problem - 2

attach(InsectSprays)

boxplot(InsectSprays$count ~ InsectSprays$spray) # не е нужно

a = InsectSprays$count[InsectSprays$spray == "A"]
b = InsectSprays$count[InsectSprays$spray == "B"]
c = InsectSprays$count[InsectSprays$spray == "C"]
d = InsectSprays$count[InsectSprays$spray == "D"]
e = InsectSprays$count[InsectSprays$spray == "E"]
f = InsectSprays$count[InsectSprays$spray == "F"]

boxplot(count, spray) # не е нужно

hist(count[spray == 'D']) # не е нужно

dd = data.frame(a, b, c, d, e, f)
dd

    a  b c  d e  f
1  10 11 0  3 3 11
2   7 17 1  5 5  9
3  20 21 7 12 3 15
4  14 11 2  6 5 22
5  14 16 3  4 3 15
6  12 14 1  3 6 16
7  10 17 2  5 1 13
8  23 17 1  5 1 10
9  17 19 3  5 3 26
10 20 21 0  5 2 26
11 14  7 1  2 6 24
12 13 13 4  4 4 13

s = stack(dd)
s

values ind
1      10   a
2       7   a
3      20   a
4      14   a
5      14   a
6      12   a
7      10   a
8      23   a
9      17   a
10     20   a
11     14   a
12     13   a
13     11   b
14     17   b
15     21   b
16     11   b
17     16   b
18     14   b
19     17   b
20     17   b
21     19   b
22     21   b
23      7   b
24     13   b
25      0   c
26      1   c
27      7   c
28      2   c
29      3   c
30      1   c
31      2   c
32      1   c
33      3   c
34      0   c
35      1   c
36      4   c
37      3   d
38      5   d
39     12   d
40      6   d
41      4   d
42      3   d
43      5   d
44      5   d
45      5   d
46      5   d
47      2   d
48      4   d
49      3   e
50      5   e
51      3   e
52      5   e
53      3   e
54      6   e
55      1   e
56      1   e
57      3   e
58      2   e
59      6   e
60      4   e
61     11   f
62      9   f
63     15   f
64     22   f
65     15   f
66     16   f
67     13   f
68     10   f
69     26   f
70     26   f
71     24   f
72     13   f

# Проверяваме дали са ND

shapiro.test(s$values)

Shapiro-Wilk normality test

data:  s$values
W = 0.9216, p-value = 0.0002525

# Не са ND ===> Kruska.test

# H0: myuA = ... = myuF ( действат еднакво )
# H1: Поне един не действа като останалите ( не действат еднакво )


kruskal.test(s$values ~ s$ind)

Kruskal-Wallis rank sum test

data:  s$values by s$ind
Kruskal-Wallis chi-squared = 54.691, df = 5, p-value =
  1.511e-10

# ===> p-value-то е много малко (отхвърляме хипотезата) ===> H1


dd2 = data.frame(c,d,e) # Втора хипотеза , (C,D,E действат еднакво) - аналогично
s2 = stack(dd2)
s2

values ind
1       0   c
2       1   c
3       7   c
4       2   c
5       3   c
6       1   c
7       2   c
8       1   c
9       3   c
10      0   c
11      1   c
12      4   c
13      3   d
14      5   d
15     12   d
16      6   d
17      4   d
18      3   d
19      5   d
20      5   d
21      5   d
22      5   d
23      2   d
24      4   d
25      3   e
26      5   e
27      3   e
28      5   e
29      3   e
30      6   e
31      1   e
32      1   e
33      3   e
34      2   e
35      6   e
36      4   e

kruskal.test( s2$values ~ s2$ind )


Kruskal-Wallis rank sum test

data:  s2$values by s2$ind
Kruskal-Wallis chi-squared = 10.103, df = 2, p-value =
  0.0064


# ===> Отхвърляме и тази хипотеза.
