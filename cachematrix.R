## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

####This function calculates the inverse of a given matrix and stores it
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## Write a short comment describing this function

#### This function checks whether there is already saved inverse matrix in the cash, if not calculates 
#### the inverse matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}

#### This code generates a random matrix and executes the functions
z <- matrix(rexp(400, rate=.1), nrow=20, ncol=20)
matr <- makeCacheMatrix(z)
cacheSolve(matr)