
naive_bayes.model = train(TrainData$AIRLINE ~ .,
  data=TrainData, method='nb',
  trControl=trainControl(method='cv',number=2))

naive_bayes.model

predictions_classes <- predict(naive_bayes.model$finalModel,TestData)

naive_bayes_model_error <- (predictions_classes != TestData$AIRLINE)

naive_bayes_confusionMatrix <- confusionMatrix(predictions_classes, TestData$AIRLINE)
