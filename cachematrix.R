## This couple of functions either 'solve's a matrix or it retrieves
## a previously 'solve'd matrix from a local cache.

## This function turns a submitted matrix into a list that contains
## a function that sets a value of a matrix, gets that value, sets
## a value of the inverse of that matrix, and gets that.

makeCacheMatrix <- function(x = matrix()) {
  ## Clear out references to m in the environment and create the set function that
  ## puts the x argument in the environment with label y
  m <- NULL
  set <- function(y)  {
    x <<- y
    m <<- NULL
  }
  
  ## Create a function get that works on x
  get <- function() x
  
  ## Create two more functions that either 'solve' what's passed and store it
  ## or just fetch the inverse if we have it already. Then list the stored items.
  setinverse <-function(solve) m <<- solve
  getinverse <-function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## This function takes a matrix and 'solve's it, assuming the matrix
## is not already 'solve'd and in the cache. If so, it just returns
## the cached inverse.

cacheSolve <- function(x, ...) {
  
  ## Create m where m is the cached inverse of matrix x
  m <- x$getinverse()
  
  ## if we already cached the inverse, just return m
  if(!is.null(m)) {
    message("getting cached data")
    return(m)  
  }
  
  ## otherwise, pass x into the get function and label it data
  data <- x$get()
  
  ## label m as the 'solve'd data item and use setinverse to store
  ## that inverse in the environment for future use and return m
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
