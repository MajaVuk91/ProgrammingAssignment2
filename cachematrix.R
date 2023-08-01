## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  # Function to set the matrix
  setMatrix <- function(newValue) {
    x <<- newValue
    inv <<- NULL  # Reset the cached inverse when the matrix is changed
  }
  
  # Function to get the matrix
  getMatrix <- function() {
    x
  }
  
  # Function to set the cached inverse
  setInverse <- function(newInverse) {
    inv <<- newInverse
  }
  
  # Function to get the cached inverse
  getInverse <- function() {
    inv
  }
  
  # Return a list of the functions
  list(setMatrix = setMatrix,
       getMatrix = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}



## Write a short comment describing this function

cacheSolve <- function(cacheMatrix) {
  # Check if the cached inverse already exists
  inv <- cacheMatrix$getInverse()
  
  # If the cached inverse exists, return it
  if (!is.null(inv)) {
    message("Getting cached inverse")
    return(inv)
  }
  
  # If the cached inverse doesn't exist, compute the inverse
  data <- cacheMatrix$getMatrix()
  inv <- solve(data)
  
  # Cache the inverse
  cacheMatrix$setInverse(inv)
  
  # Return the computed inverse
  inv
}

mat <- matrix(c(1, 2, 3, 4), nrow = 2)
cacheMat <- makeCacheMatrix(mat)
cacheSolve(cacheMat)

# Retrieve the cached inverse
cacheSolve(cacheMat)







