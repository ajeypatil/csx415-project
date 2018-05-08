glm_net.model = train(TrainData$AIRLINE ~ .,
                          data=TrainData, method='glmnet',metric='ROC',
                          trControl=trainControl(method='cv',number=2))

glm_net.model

predictions_classes <- predict(glm_net.model$finalModel,TestData)

glm_net_model_error <- (predictions_classes != TestData$AIRLINE)

glm_net_confusionMatrix <- confusionMatrix(predictions_classes, TestData$AIRLINE)
