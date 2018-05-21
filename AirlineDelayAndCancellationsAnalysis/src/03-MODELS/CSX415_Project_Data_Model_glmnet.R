Tr_x <- as.data.frame(TrainData[,1:(ncol(TrainData)-1)])
Tr_x <- model.matrix(~.,data=Tr_x)
Tr_y <- as.matrix(TrainData[,ncol(TrainData)])
glm_net.model <- cv.glmnet(Tr_x, Tr_y)

glm_net.model

Tst_x <- as.data.frame(TestData[,1:(ncol(TrainData)-1)])
Tst_x <- model.matrix(~.,data=Tst_x)
Tst_y <- as.matrix(TrainData[,ncol(TrainData)])
glm_predictions <- predict(glm_net.model,Tst_x)

glm_net_error <- rmse(TestData$DelayedOrCancelled, glm_predictions)

