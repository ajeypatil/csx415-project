
glm.model <- glm(TrainData$DelayedOrCancelled ~ AIRLINE + MONTH + DISTANCE, data=TrainData, family = binomial)


glm_predictions <- predict(glm.model,TestData)


