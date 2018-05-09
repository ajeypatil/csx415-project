random_forest.model = train(TrainData$AIRLINE_DELAY ~ .,
                          data=TrainData, method='ranger',
                          trControl=trainControl(method='cv',number=2))

random_forest.model

predictions <- predict(random_forest.model,TestData)

random_forest_model_error <- rmse(TestData$AIRLINE_DELAY,predictions)
