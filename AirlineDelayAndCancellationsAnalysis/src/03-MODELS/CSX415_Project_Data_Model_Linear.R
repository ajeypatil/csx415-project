
glm.model <- glm(TrainData$DelayedOrCancelled ~ ., data=TrainData, family = binomial)

glm.model$xlevels[["AIRLINE"]] <- union(glm.model$xlevels[["AIRLINE"]], levels(TestData$AIRLINE))
glm.model$xlevels[["ORIGIN_AIRPORT"]] <- union(glm.model$xlevels[["ORIGIN_AIRPORT"]], levels(TestData$ORIGIN_AIRPORT))
glm.model$xlevels[["DESTINATION_AIRPORT"]] <- union(glm.model$xlevels[["DESTINATION_AIRPORT"]], levels(TestData$DESTINATION_AIRPORT))


glm_predictions <- predict(glm.model,TestData)

saveRDS(glm.model,file="flights_glm_model.rds")

