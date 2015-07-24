## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Create a special "matrix", which is a list containing
## a function to
  ##   - set the value of the matrix
  ##   - get the value of the matrix
  ##   - set the value of the inverse matrix
  ##   - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
          # holds the cached value or NULL if nothing is cached
          # initially nothing is cached so set it to NULL
      i <- NULL
      
      # store a matrix
      set <- function(y) {
            x <<- y
            # since the matrix is assign a new value
            i <<- NULL
   }
   # return the stored matrix
      get <- function(){
        x
      } 
   # cache the given argument
     setinverse <- function(solve) {
       i <<- solve
     }
   # get the cached value
      getinverse <- function(){ 
                i
    } 
   # return a list.Each named element of the list is a function
      list(
            set = set,
            get = get,
            setinverse = setinverse,
            getinverse = getinverse
        )
}


## Write a short comment describing this function
## the following function Calculates the inverse of the special "matrix" created with the above
## function, reusing cached result if it is available

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinverse()
  # if a cached valued exists return it
      if(!is.null(i)) {
            message("getting cached data")
            return(i)
        }
  # otherwise get the matrix, caclulate the inverse and store it in
  # the cache
      m <- x$get()
      i <- solve(m, ...)
      x$setinverse(i)
  # return the inverse
      i
}

