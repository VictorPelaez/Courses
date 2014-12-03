## Description;
## The following function calculates the inverse of the special "matrix" 
## created with the function called makeCacheMatrix.R 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the mean from the cache and skips the computation.
## Otherwise, it calculates the inverse of the matrix and sets the value 
## of the inverse in the cache via the setmatrix function.

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")## Return the inverse of the matrix from cache
      return(m)                     ## Return a matrix that is the inverse of 'x'
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}