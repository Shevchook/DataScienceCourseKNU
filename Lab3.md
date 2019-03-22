# LAB 3

```{r}
#TASK 1
# Creating the function which returns sum of two arguments:
add2<-function(x,y) {x+y}

# Setting of two arguments:
x<-2.71828182845905
y<-1.61803398874989

# Using of created function
add2(x,y)  
```  

```{r}
#TASK 2
# Function to find elements bigger than n with n=10 by default
above <- function(x, n=10) {x[x>n]}

# Creating the vector to evaluate
x <- c(0,1,1,2,3,5,8,13,21,34)

# Function "above" returns elements from vector "x" which are bigger than default value
above(x)
# Function "above" returns elements from vector "x" which are bigger than specified value
above(x, 2)
```

```{r}
#TASK 3. Create the function to compare elements of the vector with constant.

# Creating the vector to evaluate
x <- c(0,1,1,2,3,5,8,13,21,34)

# The function
my_ifelse <- function(x, exp, n) {
  if(exp=="==") {res=x[x==n]}
  else if (exp=="<") {res=x[x<n]}
  else if (exp==">") {res=x[x>n]}
  else if (exp==">=") {res=x[x>=n]}
  else if (exp=="<=") {res=x[x<=n]}
  else res=x
  res
}
```

```{r}
#TASK 4. To create the function to calculate mean by matrix columns.
# Creating the matrix
x<-matrix(c(1, 2, 3, 4, 5, NA), 2, 3)

columnmean <- function(x, removeNA=TRUE) {
  n <- ncol(x)
  v <- numeric(n)
  for (i in 1:ncol(x)){
    v[i] <- mean(x[,i], na.rm = removeNA)
  }
   v
}
```
