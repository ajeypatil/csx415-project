# Convert to categorial variable

DelaysAndCancellations$AIRLINE <- factor(DelaysAndCancellations$AIRLINE)
DelaysAndCancellations$ORIGIN_AIRPORT <- factor(DelaysAndCancellations$ORIGIN_AIRPORT)
DelaysAndCancellations$DESTINATION_AIRPORT <- factor(DelaysAndCancellations$DESTINATION_AIRPORT)
DelaysAndCancellations$MONTH <- factor(DelaysAndCancellations$MONTH)
DelaysAndCancellations$DAY_OF_WEEK <- factor(DelaysAndCancellations$DAY_OF_WEEK)
DelaysAndCancellations$DelayedOrCancelled <- factor(DelaysAndCancellations$DelayedOrCancelled)
#preProcessDb <- preProcess(DelaysAndCancellations, method=c("medianImpute","nzv"))
preProcessDb <- preProcess(DelaysAndCancellations, method=c("medianImpute"))
delaysdb <- predict(preProcessDb,DelaysAndCancellations)

delaysdb <- delaysdb[sample(nrow(delaysdb)),]

b <- createDataPartition(delaysdb$DelayedOrCancelled, p = 0.8, list=FALSE)
TrainData    <- delaysdb[b,]
TestData     <- delaysdb[-b,]

