## Description;
## The function creates a special "matrix", which is really a list containing a function to
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){ ## Set the value of the vector
  x<<-y
  m<<-NULL
}
get<-function() x   ## Get the value of the vector
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}


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
