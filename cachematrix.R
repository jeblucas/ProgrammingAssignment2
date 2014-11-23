## This couple of functions either 'solve's a matrix or it retrieves
## a previously 'solve'd matrix from a local cache.

## This function turns a submitted matrix into a list that contains
## a function that sets a value of a matrix, gets that value, sets
## a value of the inverse of that matrix, and gets that.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <-function(solve) m <<- solve
  getinverse <-function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# makeVector <- function(x = numeric()) {
#   m <- NULL
#   set <- function(y) {
#     x <<- y
#     m <<- NULL
#   }
#   get <- function() x
#   setmean <- function(mean) m <<- mean
#   getmean <- function() m
#   list(set = set, get = get,
#        setmean = setmean,
#        getmean = getmean)
# }




## This function takes a matrix and 'solve's it, assuming the matrix
## is not already 'solve'd and in the cache. If so, it just returns
## the cached inverse.

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

# cachemean <- function(x, ...) {
#   m <- x$getmean()
#   if(!is.null(m)) {
#     message("getting cached data")
#     return(m)
#   }
#   data <- x$get()
#   m <- mean(data, ...)
#   x$setmean(m)
#   m
# }

