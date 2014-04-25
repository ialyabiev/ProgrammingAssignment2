source("cachematrix.R")
m <- matrix(log(1:64),8,8)
!is.null(solve(m))


timeGeneral <- system.time(
        {
        for( i in 1:10000) mInv <- solve(m)
})

timeCached <- system.time({
        mc <- makeCacheMatrix(m)
        for( i in 1:10000) mInv <- cacheSolve(mc)
        
})

print("inverse matrix in a general way")
print (timeGeneral)
print("inverse matrix with caching")
print (timeCached)
