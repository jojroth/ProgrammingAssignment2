mat## The functions contained in this file may help reduce processing time
## when it is necessary to repeatedly calculate the inverse of a matrix

## makeCachematrix: creates a matrix object that caches its inverse
## has to be run prio to cachesolve

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL ## assign Null to matrix m, for later check wether inverse has already been calculated
  set <- function(y) {
    x <<- y
    m <<- NULL ## assign Null to matrix in parent environment
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve ## assigns inverse matrix to m
  getinverse <- function() m
  list(set = set, get = get, 
       setinverse = setinverse, getinverse = getinverse)
}


## cachesolve: computes the inverse of the matrix created by makeCachematrix
## if this has already been calculated and if the matrix is unchanged, 
## then cachesole retrieves the inverse from the cache instead of calculating it again.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {  ## in case inverse has already been computed
    message("getting cached inverse matrix")
    return(m)
  }
  matrix <- x$get()
  m <- solve(data) ## calculate inverse matrix and assign value to m
  x$setinverse(m) ## assigns inverse matrix to m
  m
}