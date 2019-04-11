# LAB 5


```{r}
# TASK 1
# Написати функцію pmean, яка обчислює середнє значення (mean) забруднення
# сульфатами або нітратами серед заданого переліка моніторів.

pmean <- function(directory, pollutant, id = 1:332) {
    # Створення списку файлів. Робоча папка повинна містити папку "specdata"
    filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
    # Створення порожнього вектора для зберігання даних
    values <- numeric()
    # Створення циклу
    for (i in id) {
        data <- read.csv(filelist[i]) # Читання і зберігання "csv" файлів у "data"
        values <- c(values, data[[pollutant]]) # Відбір і додавання щоразу нових даних
    }
    # Обчислення середньої на основі відібраних величин
    mean(values, na.rm = TRUE)
}

# Використання функції pmean
pmean("specdata", "sulfate", 1:10)
# [1] 4.064128

pmean("specdata", "sulfate", 55)
# [1] 3.587319

pmean("specdata", "nitrate")
# [1] 1.702932
```

```{r}
# TASK 2
# Написати функцію complete, яка виводить кількість повних спостережень
# (the number of completely observed cases) для кожного файлу.

complete <- function(directory, id = 1:332) {
    # Створення списку файлів. Робоча папка повинна містити папку "specdata"
    filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
    # Створення порожнього вектора
    nobs <- numeric()
    # Створення циклу
    for (i in id) {
        data <- read.csv(filelist[i]) # Читання і збереження "csv" файлів
        nobs <- c(nobs, sum(complete.cases(data))) # Створення і додавання щоразу нових спостережень
    }
    # Створення датафрейму
    data.frame(id, nobs)
}

# Використання функції complete
complete("specdata", 1)
# id nobs
# 1  1  117

complete("specdata", c(2, 4, 8, 10, 12))
# id nobs
# 1  2 1041
# 2  4  474
# 3  8  192
# 4 10  148
# 5 12   96

complete("specdata", 50:60)
# id nobs
# 1  50  459
# 2  51  193
# 3  52  812
# 4  53  342
# 5  54  219
# 6  55  372
# 7  56  642
# 8  57  452
# 9  58  391
# 10 59  445
# 11 60  448
```

```{r}
# TASK 3
# Написати функцію corr, яка приймає два аргументи: directory (папка, де
# знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням
# дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів,
# кількість повних спостережень для яких більше порогового значення. Функція
# повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує
# порогового значення, функція повинна повернути numeric вектор довжиною 0.

corr <- function(directory, threshold = 0) {
    all <- complete(directory)
    if (sum(which(all$nobs>threshold))==0) {NULL}
    else {thresh_index <- as.numeric(all[which(all$nobs>threshold),]$id)}
    names <- list.files(directory)[thresh_index]
    read <- lapply(paste(directory,"/",names, sep = ""),read.csv)
    return(unlist(lapply(read, function(x){
        cor(x[,2],x[,3],use="pairwise.complete.obs")})))
}

# Використання функції corr
cr <- corr("specdata", 150)
head(cr); summary(cr)
# [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

cr <- corr("specdata", 400)
head(cr); summary(cr)
# [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

cr <- corr("specdata", 5000)
head(cr); summary(cr) ; length(cr)
# Error in corr("specdata", 5000) : object 'thresh_index' not found
# Something went wrong :-(
```