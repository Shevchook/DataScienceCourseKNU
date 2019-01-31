#LAB 01

#Task 1 Creating base (atomic) type variables
e1<-as.integer()
e2<-as.character()
e3<-as.numeric()
e4<-as.complex()
e5<-as.logical()



#Task 2
a<-5:75 # a is the vector which contains values from 5 to 75

d<-c(3.14,2.71,0,13) # d is the vector of certain numbers

y<-as.logical(1:100)  # y is the vector which contains 100 values of "TRUE"



#Task 3
h1<-c(0.5, 3.9, 0, 2)
h2<-c(1.3, 131, 2.2, 7)
h3<-c(3.5, 2.8, 4.6, 5.1)
h<-cbind(h1,h2,h3) # creating the matrix by cbind

    # creating the matrix by matrix:
hnew<-matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), 4, 3)



#Task 4 Creating a list
z<-list(e1,e2,e3,e4,e5) # this list contains the base types (vectors) created earlier
z1<-list(2,"character", 1.61803398874989, 1+2i, TRUE) # it works also



#Task 5
m<-factor(c("baby", "child", "adult"))



#Task 6
n<-c(1,2,3,4,NA,6,7,NA,9,NA,11)
#Not completed