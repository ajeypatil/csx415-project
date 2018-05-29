# Convert to categorial variable

DelaysAndCancellations <- DelaysAndCancellations[,c('AIRLINE','ORIGIN_AIRPORT','DESTINATION_AIRPORT','MONTH','DAY_OF_WEEK','SCHEDULED_DEPARTURE','DelayedOrCancelled')]

DelaysAndCancellations$SCHEDULED_DEPARTURE <- (DelaysAndCancellations$SCHEDULED_DEPARTURE %/% 100)
DelaysAndCancellations$SCHEDULED_DEPARTURE <- factor(DelaysAndCancellations$SCHEDULED_DEPARTURE)

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

