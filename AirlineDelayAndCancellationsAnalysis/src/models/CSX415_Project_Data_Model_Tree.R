random_forest.model = train(TrainData$AIRLINE ~ .,
                          data=TrainData, method='ranger',
                          trControl=trainControl(method='cv',number=2))

random_forest.model

predictions_classes <- predict(random_forest.model$finalModel,TestData)

random_forest_model_error <- (predictions_classes != TestData$AIRLINE)

random_forest_confusionMatrix <- confusionMatrix(predictions_classes, TestData$AIRLINE)
