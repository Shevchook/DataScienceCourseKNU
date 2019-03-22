# LAB 4

```{r}
# Reading input data
airquality<-read.csv("D:/R/3rdATTEMPT/LAB_01/hw1_data.csv")
```

```{r}
# TASK 1
# Names of columns in data file
# Які назви стовпців файлу даних?

names(airquality)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"
```

```{r}
# TASK 2
# The first 6 rows
# Виведіть перші 6 строк фрейму даних

> head(airquality)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6
```

```{r}
# TASK 3
# How many rows in the dataframe
# Скільки спостерігань (строк) в дата фреймі?

> nrow(airquality)
[1] 153
```

```{r}
# TASK 4
# The last 10 rows
# Виведіть останні 10 строк дата фрейму

> tail(airquality,10)
    Ozone Solar.R Wind Temp Month Day
144    13     238 12.6   64     9  21
145    23      14  9.2   71     9  22
146    36     139 10.3   81     9  23
147     7      49 10.3   69     9  24
148    14      20 16.6   63     9  25
149    30     193  6.9   70     9  26
150    NA     145 13.2   77     9  27
151    14     191 14.3   75     9  28
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30
```

```{r}
# TASK 5
# How many NA in "Ozone" variable
# Як багато значень «NA» в стовпці «Ozone»?

> nrow(subset(airquality, is.na(Ozone)))
[1] 37
```

```{r}
# TASK 6
# Mean by "Ozone". Whithout NA's
# Яке середнє (mean) стовпця «Ozone». Виключити «NA» значення.

> mean(airquality$Ozone, na.rm = TRUE)
[1] 42.12931
```

```{r}
# TASK 7
# Creating a subset with "Ozone">31 and "Temp">90
# Виведіть частину набору даних (subset) зі значенням «Ozone» > 31 та
# «Temp» > 90. Яке середнє (mean) значень «Solar.R» в цьому наборі даних (subset)?

air <- subset(airquality, Ozone>31 & Temp>90)

# Mean for "Solar.R"

> mean(air$Solar.R)
[1] 212.8
```

```{r}
# TASK 8
# To calculate mean "Temp" for "June"
# Яке середнє значення (mean) для «Temp» для червня («Month» дорівнює 6)?

> mean(subset(airquality, Month==6)$Temp)
[1] 79.1
```

```{r}
# TASK 9
# Maximum "Ozone" value for "May"
# Яке максимальне значення «Ozone» для травня («Month» дорівнює 5)?

> max(subset(airquality, Month == 5)$Ozone, na.rm = TRUE)
[1] 115
```
