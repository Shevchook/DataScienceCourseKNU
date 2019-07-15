# LAB 07

## SECTION ONE
```{r}
# Створити функцію prepare_set, яка приймає ім’я файлу і повертає дата фрейм.
prepare_set <- function(file_name) {
    
    # TASK 1. Зчитати файл
    df <- read.csv("olympics.csv", skip = 1, header = TRUE, encoding="UTF-8",
                     stringsAsFactors = FALSE)
    
    # TASK 2. Дати назву першому стовпцю
    names(df)[1] <- c("Country")
    
    # TASK 3. Автоматично в циклі згенерувати назви останніх стовпців:
    for (i in 1:length(names(df))) {
        name <- names(df)[i]
        if (str_sub(name, 2, 3) == "01") names(df)[i] <- str_c("Gold", str_sub(name, 6))
        if (str_sub(name, 2, 3) == "02") names(df)[i] <- str_c("Silver", str_sub(name, 6))
        if (str_sub(name, 2, 3) == "03") names(df)[i] <- str_c("Bronze", str_sub(name, 6))
        if (str_sub(name, 1, 2) == "X.") names(df)[i] <- str_sub(name,4)
    }

    # TASK 4. Привести назви країн до виду "Afghanistan", "Algeria"
    # розділити текст за символом "("
    cn <- strsplit(df$Country, "(", fixed=TRUE)
    # залишити тільки назви країн
    df$Country <- sapply(cn, "[", 1)
    # видалити пробіли після назв країн
    df$Country <- str_trim(df$Country)
    
    
    # TASK 5.     
    # створити ID з трьох літер
    df$ID <- str_sub(sapply(cn, "[", 2), 1, 3)
    
    # TASK 6.
    # видалити рядок "Totals"
    df <- df[-which(df$Country == "Totals"),]
    
}
```

```{r}
# ANSWERS
# Створення дата фрейму за допомогою функції prepare_set
olympics <- prepare_set("olympics.csv")
```

```{r}
# Питання 1
# Яка країна виграла найбільшу кількість золотих нагород на літніх іграх?
answer_one <- function() {
    olympics[which.max(olympics$Gold), "Country"]
}
> answer_one()
[1] "United States"
```

```{r}
# Питання 2
# Яка країна має найбільшу різницю між кількістю нагород на літніх та зимових іграх?
answer_two <- function() {
    olympics[which.max(abs(olympics$Total-olympics$Total.1)), "Country"]
}
> answer_two()
[1] "United States"
```

```{r}
# Питання 3
# В якій країні найбільша різниця між літніми та зимовими золотими нагородами
# відносно до загальної кількості золотих нагород? Врахувати тільки країни які
# мають як мінімум по одній нагороді в літніх та зимових іграх.
answer_three <- function() {
    my_subset <- subset(olympics, Gold >0 & Gold.1 >0)
    my_subset[which.max(abs((my_subset$Gold-my_subset$Gold.1)/my_subset$Gold.2)), "Country"]
}
> answer_three()
[1] "Bulgaria"
```

```{r}
# Питання 4
# Знайти кількість балів по кожній країні. Бали рахуються наступним чином:
# золота нагорода Gold.2 це три бали, срібна Silver.2 - 2 бали та бронзова
# Bronze.2 – 1 бал. Функція повинна повертати дата фрейм довжиною 146, який
# складається з двох колонок: "Country", "Points".
answer_four <- function() {
    olympics$Points <- (olympics$Gold.2*3 + olympics$Silver.2*2 + olympics$Bronze.2*1)
    olympics[, c("Country", "Points")]
    
}
> answer_four()
                             Country Points
1                        Afghanistan      2
2                            Algeria     27
3                          Argentina    130
4                            Armenia     16
5                        Australasia     22
6                          Australia    923
7                            Austria    569
8                         Azerbaijan     43
9                            Bahamas     24
10                           Bahrain      1
11                          Barbados      1
12                           Belarus    154
13                           Belgium    276
14                           Bermuda      1
15                           Bohemia      5
16                          Botswana      2
17                            Brazil    184
18               British West Indies      2
19                          Bulgaria    411
20                           Burundi      3
21                          Cameroon     12
22                            Canada    846
23                             Chile     24
24                             China   1120
25                          Colombia     29
26                        Costa Rica      7
27                       Ivory Coast      2
28                           Croatia     67
29                              Cuba    420
30                            Cyprus      2
31                    Czech Republic    134
32                    Czechoslovakia    327
33                           Denmark    335
34                          Djibouti      1
35                Dominican Republic     14
36                           Ecuador      5
37                             Egypt     49
38                           Eritrea      1
39                           Estonia     77
40                          Ethiopia     94
41                           Finland    895
42                            France   1500
43                             Gabon      2
44                           Georgia     42
45                           Germany   1546
46            United Team of Germany    269
47                      East Germany   1068
48                      West Germany    459
49                             Ghana      5
50                     Great Britain   1574
51                            Greece    213
52                           Grenada      3
53                         Guatemala      2
54                            Guyana      1
55                             Haiti      3
56                         Hong Kong      6
57                           Hungary    962
58                           Iceland      6
59                             India     50
60                         Indonesia     49
61                              Iran    110
62                              Iraq      1
63                           Ireland     55
64                            Israel     10
65                             Italy   1333
66                           Jamaica    131
67                             Japan    866
68                        Kazakhstan    113
69                             Kenya    168
70                       North Korea     90
71                       South Korea    609
72                            Kuwait      2
73                        Kyrgyzstan      4
74                            Latvia     47
75                           Lebanon      6
76                     Liechtenstein     15
77                         Lithuania     38
78                        Luxembourg      9
79                         Macedonia      1
80                          Malaysia      9
81                         Mauritius      1
82                            Mexico    109
83                           Moldova      9
84                          Mongolia     37
85                        Montenegro      2
86                           Morocco     39
87                        Mozambique      4
88                           Namibia      8
89                       Netherlands    727
90              Netherlands Antilles      2
91                       New Zealand    203
92                             Niger      1
93                           Nigeria     37
94                            Norway    985
95                          Pakistan     19
96                            Panama      5
97                          Paraguay      2
98                              Peru      9
99                       Philippines     11
100                           Poland    520
101                         Portugal     39
102                      Puerto Rico     10
103                            Qatar      4
104                          Romania    572
105                           Russia   1042
106                   Russian Empire     14
107                     Soviet Union   2526
108                     Unified Team    287
109                     Saudi Arabia      4
110                          Senegal      2
111                           Serbia     11
112            Serbia and Montenegro     17
113                        Singapore      6
114                         Slovakia     58
115                         Slovenia     56
116                     South Africa    148
117                            Spain    268
118                        Sri Lanka      4
119                            Sudan      2
120                         Suriname      4
121                           Sweden   1217
122                      Switzerland    630
123                            Syria      6
124                   Chinese Taipei     32
125                       Tajikistan      4
126                         Tanzania      4
127                         Thailand     44
128                             Togo      1
129                            Tonga      2
130              Trinidad and Tobago     27
131                          Tunisia     19
132                           Turkey    191
133                           Uganda     14
134                          Ukraine    220
135             United Arab Emirates      3
136                    United States   5684
137                          Uruguay     16
138                       Uzbekistan     38
139                        Venezuela     18
140                          Vietnam      4
141                   Virgin Islands      2
142                       Yugoslavia    171
143 Independent Olympic Participants      4
144                           Zambia      3
145                         Zimbabwe     18
146                       Mixed team     38
```

## SECTION TWO
```{r}
# Зчитуємо файл
census_df <- read.csv("census.csv", stringsAsFactors = FALSE)

# Питання 5
# В якому штаті (state) більше всього округів (county)? Функція повинна
# повернути одне текстове значення

answer_five <- function() {
    # розділити df за стовпчиком STNAME
    splitting <- split(census_df, census_df$STNAME)
    # порахувати кількість рядків у кожній частині
    CountiesNum <- sapply(splitting, nrow)
    # вивести ім’я штату з найбільшою кількістю округів
    names(which.max(CountiesNum))
}

> answer_five()
[1] "Texas"
```

```{r}
# Питання 6
# Якщо розглядати три найбільш населених округа (county) з кожного штату, які
# три найбільш населені штати (в порядку з більш до менш населеного)? Використовуйте
# CENSUS2010POP. Функція повинна повернути вектор з трьох текстових значень.

answer_six <- function() {
    # відсортувати у порядку зменшення чисельності CENSUS2010POP
    my_order <- census_df[order(census_df$STNAME, -census_df$CENSUS2010POP), ]
    # розділити df за стовпчиком STNAME
    splitting <- split(my_order, my_order$STNAME)
    splitting <- lapply(splitting, function (x) sum (x[2:4, "CENSUS2010POP"]))
    splitting <- splitting[order(unlist(splitting), decreasing = TRUE, na.last = TRUE)]
    # вивести перші три назви
    names(splitting) [1:3]
}

> answer_six()
[1] "California" "Texas"      "Illinois"
```

```{r}
# Питання 7
# Який округ (county) має найбільшу абсолютну зміну в населенні протягом періоду
# 2010-2015? (Підказка: значення населення зберігається в колонках з POPESTIMATE2010
# до POPESTIMATE2015. Необхідно розглядати всі шість колонок). Якщо населення округу
# за 5річний період 100, 120, 80, 105, 100, 130, то найбільша різниця за період буде
# |130-80|=50. Функція повинна повернути одне текстове значення.

answer_seven <- function() {
    # позбутися рядків із даними по цілому штату
    CountiesOnly <- census_df[census_df$COUNTY !=0,]
    # додати нові змінні з макс і мін величиною у стовпчиках від 10 до 15
    CountiesOnly$max <- apply(CountiesOnly[, 10:15], 1, max)
    CountiesOnly$min <- apply(CountiesOnly[, 10:15], 1, min)
    # знайти назву округа з найбільшою абсолютною зміною
    CountiesOnly[which.max(CountiesOnly$max-CountiesOnly$min), "CTYNAME"]
}

> answer_seven()
[1] "Harris County"
```

```{r}
# Питання 8
# Напишіть функцію, яка знаходить округи (county), що належать регіонам 1 або 2,
# назва яких починається з "Washington" та POPESTIMATE2015 більше ніж POPESTIMATE2014.
# Функція повинна повернути 5х2 дата фрейм з колонками "STNAME", "CTYNAME".

answer_eight <- function() {
    # залишити регіони 1 та 2
    select_reg <- subset(census_df, (REGION == 1 | REGION == 2))
    # вибрати округи, назва яких починається з "Washington"
    Washingtons <- select_reg[grep("Washington", select_reg$CTYNAME),]
    # знайти ті, в яких POPESTIMATE2015 більше ніж POPESTIMATE2014
    pop_growth <- subset(Washingtons, POPESTIMATE2015>POPESTIMATE2014)
    # створити 5х2 дата фрейм з колонками "STNAME", "CTYNAME"
    pop_growth[, c("STNAME", "CTYNAME")]
}

> answer_eight()
           STNAME           CTYNAME
897          Iowa Washington County
1420    Minnesota Washington County
2346 Pennsylvania Washington County
2356 Rhode Island Washington County
3164    Wisconsin Washington County
```