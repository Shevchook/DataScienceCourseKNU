# LAB 4

```{r}
# Reading input data
airquality<-read.csv("D:/R/3rdATTEMPT/LAB_01/hw1_data.csv")
```

```{r}
# TASK 1
# Names of columns in data file
names(airquality)
```

```{r}
# TASK 2
# The first 6 rows
head(airquality)
```

```{r}
# TASK 3
# How many rows in the dataframe
nrow(airquality)
```

```{r}
# TASK 4
# The last 10 rows
tail(airquality,10)
```

```{r}
# TASK 5
# How many NA in "Ozone" variable
nrow(subset(airquality, is.na(Ozone)))
```

```{r}
# TASK 6
# Mean by "Ozone". Whithout NA's
mean(airquality$Ozone, na.rm = TRUE)
```

```{r}
# TASK 7
# Creating a subset with "Ozone">31 and "Temp">90
air <- subset(airquality, Ozone>31 & Temp>90)
# Mean for "Solar.R"
mean(air$Solar.R)
```

```{r}
# TASK 8
# To calculate mean "Temp" for "June"
mean(subset(airquality, Month==6)$Temp)
```

```{r}
# TASK 9
# Maximum "Ozone" value for "May"
max(subset(airquality, Month == 5)$Ozone, na.rm = TRUE)
```