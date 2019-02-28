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
