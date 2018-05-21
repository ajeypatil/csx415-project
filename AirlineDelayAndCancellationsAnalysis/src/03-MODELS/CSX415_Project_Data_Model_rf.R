library(randomForest)
rf.model = randomForest(TrainData$DelayedOrCancelled ~ .,data=TrainData)

rf_predictions <- predict(rf.model,TestData)
