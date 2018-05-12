
linear.model = lm(TrainData$AIRLINE_DELAY ~ ., data=TrainData)

linear.model

predictions <- predict(linear.model,TestData)

linear_model_error <- rmse(TestData$AIRLINE_DELAY, predictions)
