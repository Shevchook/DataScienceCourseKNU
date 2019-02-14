# LAB 2

```{r}
#Task 1

v<-rnorm(100) # Creating vector v
v[10] # to show 10th element
v[10:20] # to show from 10th to 20th element
v[v>0] # to show elements bigger than 0

 # to show 10 elements starting from 20th
```


```{r}
#Task 2

# Creating the data frame
y<-data.frame(a = rnorm(100), b = 1:100, cc = sample(letters, 100, replace = TRUE))

tail(y,10) # the last 10 rows
y[10:20,] # from 10th to 20th rows
y[10,"b"] # 10th value from "b" column
y[,"cc"] # all values from "cc" column
```


```{r}
#Task 3

z<-c(1,2,3,NA,4,NA,5) # Creating vector

z[!is.na(z)] # elements is not NA
mean(z,na.rm=TRUE) # mean without NA
mean(z,na=TRUE) # mean with NA
```

