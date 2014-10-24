## Two functions for R Programming assignment 2
## 
## Usage:
## ------------------------------------
## > source("cachematrix.R")
## > c <- rbind(c(1,-1/4),c(-1/4,1))
## > x <- makeCacheMatrix(c)
## > x$makeInverseMatrix()
## > cacheSolve(x)
## ------------------------------------

## This function creates a special "matrix" that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL

	makeInverseMatrix <- function() {
		m <<- solve(x)
	}

	getInverseMatrix <- function() {
		m
	}

	list(makeInverseMatrix = makeInverseMatrix, getInverseMatrix = getInverseMatrix)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and hte matrix has not change),
## then the cacheSolve should receive the inverse from the cache.

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
	m <- x$getInverseMatrix()
	if (!is.null(m)) {
		message("getting cached data")
		return (m)
	}
	data <- x$makeInverseMatrix()
	data
}
