glm_net.model = train(TrainData$AIRLINE_DELAY ~ .,
                          data=TrainData, method='glmnet',metric='ROC',
                          trControl=trainControl(method='cv',number=2))

glm_net.model

predictions <- predict(glm_net.model,TestData)

glm_net_model_error <- rmse(TestData$AIRLINE_DELAY,predictions)
