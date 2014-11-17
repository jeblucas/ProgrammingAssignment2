## This couple of functions either 'solve's a matrix or it retrieves
## a previously 'solve'd matrix from a local cache.

## This function turns a submitted matrix into a list that contains
## a function that sets a value of a matrix, gets that value, sets
## a value of the inverse of that matrix, and gets that.

makeCacheMatrix <- function(x = matrix()) {

}


## This function takes a matrix and 'solve's it, assuming the matrix
## is not already 'solve'd and in the cache. If so, it just returns
## the cached inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
