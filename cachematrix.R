## R script for defining matrix and find inverse of the matrix.
## Script shows the performance by caching the inverse of the matrix and reusing it whenever required

## Function for getting and setting the matrix 

makeCacheMatrix <- function(x = matrix()) {
##Declare inverse of matrix as null
invm <- NULL
##Function for assigning the value of matrix to variable 'x' and inverse
set <- function(y)
{
## <<- operator.Ex: var <<- value
## This operator will cause the interpreter to first search through the current environment to find the symbol var.
## If the interpreter does not find the symbol var in the current environment, then the interpreter will next search through the parent environment.
    ## The interpreter will recursively search through environments until it either finds the symbol var or reaches the global environment.

    x <<- y
invm <<- NULL
}
##getting matrix
get <- function() x
##assigning value to the inverse of the matrix
setinvm <- function(in_m)
invm <<- in_m
##getting value of inverse of matrix
getinvm <- function() invm

##the function returns the child function as a list
 list(set = set,get = get,setinvm = setinvm,getinvm = getinvm)
}


## Function to find inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
##assignning value of inverse of matrix to 'invm' returned by 'getinvm' function
 invm <- x$getinvm()
 ##condition to check if the inverse of matrix is calculated before or not.
 if(!is.null(invm))
{
message("getting cached data")
return(invm)
}
##getting value of matrix using 'get' function
dat <- x$get()
##finding inverse of the matrix
invm <- solve(dat)
##setting value for inverse of matrix
x$setinvm(invm)
##returning inverse of matrix
invm
}
