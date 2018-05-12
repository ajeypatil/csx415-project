tree.model <- rpart(TrainData$AIRLINE_DELAY ~ ., data=TrainData)

tree.model

predictions <- predict(tree.model,TestData)

tree_model_error <- rmse(TestData$AIRLINE_DELAY,predictions)
