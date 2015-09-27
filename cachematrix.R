# makeCacheMatrix computes the inverse of a square matrix.  If the inverse value does not change it retrieves it from memory.
# setmatrix takes a series of numbers and puts them in a square matrix vector.
# getmatrix retrieves the values of the square matrix.
# setinverse receives the inverse value and stores it in memory.
# getinverse gets the inverse value from memory.


makeCacheMatrix <- function(x) { 
  
  m <- NULL 
  setmatrix <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  getmatrix <- function() {
    x 
  }
  
  setinverse <- function(m_inverse) {
    m <<- m_inverse 
  }
  
  getinverse <- function() {
    m
  } 
  
  list(setmatrix = setmatrix, getmatrix = getmatrix,
       setinverse = setinverse,
       getinverse = getinverse)
  
}
 

## cacheSolve executes the functions created in makeCacheMatrix.  
## if the value of the inverse has not changed, it will retrieve it from memory and return it.  
##If it has changed, it will recompute it.

cacheSolve <- function(x)   {
  m<-x$getinverse()
  if (!is.null(m))  {
    return(m)
  }
  
  inv <- solve(x$getmatrix())
  print(x$setinverse(inv))
}