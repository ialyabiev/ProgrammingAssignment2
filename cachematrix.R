## Put comments here that give an overall description of what your
## functions do

## Functions  makeCacheMatrix  and cacheSolve are created for speedup repetitions
## of inverse matrix calculation. The main idea is to create a special object 
## cacheMatrix for out input matrix. This object can hold the matrix 
## itsef and the inverted matrix. When we inverse our matrix first time
## we cache out result. Then when we need to inverse our matrix again 
## we just use cached result without any additional calculation. It helps 
## to make our calculations faster.


## Write a short comment describing this function

## Function makeCacheMatrix creates a special "matrix" object that can cache 
##its inverse. Function return a list of functions 
## set -  set the value of the matrix
## get - get the value of the matrix
## setInverse - set the value of the inverse matrix
## getInverse - get the value of the Inverse matrix

makeCacheMatrix <- function(x = matrix()) {
   xInverse <- NULL

   set <- function (y) {
           x <<- y
           xInverse <<- NULL 
   }
   get <- function() x
   
   setInverse <- function(yInverse) xInverse <<- yInverse
   getInverse <- function() xInverse
   
   list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function

## Function cacheSolve calculates the Inverse matrix of the special 
## "matrix" object created with the above function makeCacheMatrix.
## Function first checks if the inverse matrix has already been calculated
## for input parameter. If so, it gets solution from the cache and skips 
## the computation. Otherwise, it calculates the Inverse matrix  for 
## the input parameter and sets this object to the cache via setInverse function.



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        xInverse <- x$getInverse()
        
        if(!is.null(xInverse)) {
                message("getting cached data")
                return(xInverse)
        }
        data <- x$get()
        xInverse <- solve(data, ...)
        x$setInverse(xInverse)
        xInverse
}
