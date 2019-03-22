# LAB 3

```{r}
#TASK 1
# Creating the function which returns sum of two arguments:
# Функція add2(x, y), яка повертає суму двох чисел
add2<-function(x,y) {x+y}

# Setting of two arguments:
x<-2.71828182845905
y<-1.61803398874989

# Using of created function
add2(x,y)
# Console
[1] 4.336316
```  

```{r}
#TASK 2
# Function to find elements bigger than n with n=10 by default
# Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.
above <- function(x, n=10) {x[x>n]}

# Creating the vector to evaluate
x <- c(0,1,1,2,3,5,8,13,21,34)

# Function "above" returns elements from vector "x" which are bigger than default value
above(x)
# Console [1] 13 21 34
# Function "above" returns elements from vector "x" which are bigger than specified value
above(x, 2)
# Console
[1]  3  5  8 13 21 34
```

```{r}
#TASK 3. Create the function to compare elements of the vector with constant.
# Функція my_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його
# елементи за допомогою exp з n, та повертає елементи вектору, які
# відповідають умові expression. Наприклад, my_ifelse(x, “>”, 0) повертає всі
# елементи x, які більші 0. Exp може дорівнювати “<”, “>”, “<=”, “>=”, “==”.
# Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.

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
# Console
> my_ifelse(x, "<", 13)
[1] 0 1 1 2 3 5 8
> my_ifelse(x, ">", 13)
[1] 21 34
> my_ifelse(x, "&", 13)
 [1]  0  1  1  2  3  5  8 13 21 34
my_ifelse(x, "A", )
 [1]  0  1  1  2  3  5  8 13 21 34

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
# Console
> columnmean(x)
[1] 1.5 3.5 5.0
```
