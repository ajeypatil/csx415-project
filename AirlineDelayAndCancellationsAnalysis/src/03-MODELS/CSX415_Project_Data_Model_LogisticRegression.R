
glm.model <- glm(TrainData$DelayedOrCancelled ~ ., data=TrainData, family = binomial)

#saveRDS(glm.model,file="lib/models/flights_glm_model.rds")

glm_predictions <- predict(glm.model,TestData)


