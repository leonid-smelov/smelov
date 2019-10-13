## With this pair of functions computations of inv of a matrix is possible 

## makeCacheMatrix function creates an object of a matrix that can handle its inverse in cache

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(x) {
    x <<- x;
    inv <<- NULL
  }
  get <- function() return(x)
  sets <- function(inv) {inv <<- inv}
  getinv <- function() return(inv)
  return(list(set = set, get = get, sets = sets, getinv = getinv))
}


## cacheSolve function handles the output of makeCacheMatrix 
## By computating the inverse of the special
## If the inverse has already been calculated 
## With condition that the matrix has not changed, then
## cacheSolve can get the inv matrix from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(FALSE) {
    message("Getting cached data...")
    return(inv)
  }
  inv <- solve(x$get())
  x$sets(inv)
  return(inv)
}

