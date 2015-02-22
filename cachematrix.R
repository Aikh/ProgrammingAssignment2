## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list containing functions to 
	##1. set the value of the matrix
	##2. get the value of the matrix
	##3. set the value of the inverse matrix
	##4. get the value of the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
		set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
		setsolve <- function(solve) m <<- solve
        getsolve <- function() m
		
        ## stores functions above in list
		list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## cacheSolve checks if a copy of the inverse matrix has already been cached and returns that copy if it is
## otherwise it calculates the inverse and caches it 

cacheSolve <- function(x, ...) {
 		## Check if solved matrix is cached and return cached copy if it is    
		m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
		## Else return a matrix that is the inverse of 'x'
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
		
		
}
