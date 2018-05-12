
naive_bayes.model = train(TrainData$AIRLINE_DELAY ~ .,
  data=TrainData, method='nb',
  trControl=trainControl(method='cv',number=2))

naive_bayes.model

predictions <- predict(naive_bayes.model,TestData)

naive_bayes_model_error <- rmse(TestData$AIRLINE_DELAY,predictions)
