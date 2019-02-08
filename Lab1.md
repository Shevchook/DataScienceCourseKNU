```{r}
#LAB 01
#Task 1 Creating base (atomic) type variables
e1<-as.integer()
e2<-as.character()
e3<-as.numeric()
e4<-as.complex()
e5<-as.logical()
# 2nd variant based on your tip:
e6<-10L
e7<-"ten"
e8<-3.14
e9<-1+2i
e10<-TRUE
```

```{r}
#Task 2
a<-5:75 # a is the vector which contains values from 5 to 75
d<-c(3.14,2.71,0,13) # d is the vector of certain numbers
y<-rep(TRUE,100)  # yes, your variant is much better
```

```{r}
#Task 3
h1<-c(0.5, 3.9, 0, 2)
h2<-c(1.3, 131, 2.2, 7)
h3<-c(3.5, 2.8, 4.6, 5.1)
h<-cbind(h1,h2,h3) # creating the matrix by cbind
# creating the matrix by matrix:
hnew<-matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), 4, 3)
```

```{r}
#Task 4 Creating a list
z<-list(e1,e2,e3,e4,e5) # this list contains the base types (vectors) created earlier
z1<-list(2,"character", 1.61803398874989, 1+2i, TRUE) # it works also
```

```{r}
#Task 5
m<-factor(c("baby", "child", "adult"))
```

```{r}
#Task 6
n<-c(1,2,3,4,NA,6,7,NA,9,NA,11)
match(NA,n) # match function only returns index of the first encounter
which(n %in% c(NA)) # %in% returns indices of the all elements listed under c()
summary(n) # print descriptive statistics and number of NA`s
```


```{r}
#Task 7
#Creating the dataframe from *.csv
popData<-read.csv("D:/R/3rdATTEMPT/LAB_01/data.csv")
# This will print the dataframe in console
popData
```

```{r}
#Task 8
# Replacing the name of fisrt column "city" by "town"
names(popData)[1]<-"town"
# Replacing the strange names assigned by read.csv by integer numbers
names(popData)[5:105]<-as.integer(0:100)
```
