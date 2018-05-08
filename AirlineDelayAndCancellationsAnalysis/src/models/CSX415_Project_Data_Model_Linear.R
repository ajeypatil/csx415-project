linear.model = train(TrainData$AIRLINE ~ .,
                          data=TrainData, method='lm',
                          trControl=trainControl(method='cv',number=2))

linear.model

predictions_classes <- predict(linear.model$finalModel,TestData)

linear_model_error <- (predictions_classes != TestData$AIRLINE)

linearmodel_confusionMatrix <- confusionMatrix(predictions_classes, TestData$AIRLINE)