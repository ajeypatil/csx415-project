# Convert to categorial variable
delaysdb$AIRLINE <- factor(delaysdb$AIRLINE) 

preProcessDb <- preProcess(delaysdb, method=c("medianImpute","nzv","center", "scale"))
delaysdb <- predict(preProcessDb,delaysdb)

delaysdb <- delaysdb[sample(nrow(delaysdb)),]

b <- createDataPartition(delaysdb$AIRLINE_DELAY, p = 0.8, list=FALSE)
TrainData    <- delaysdb[b,]
TestData     <- delaysdb[-b,]

