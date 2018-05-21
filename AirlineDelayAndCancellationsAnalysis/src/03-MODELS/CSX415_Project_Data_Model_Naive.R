
#nb.model = naiveBayes(TrainData$DelayedOrCancelled ~ .,data=TrainData)
nb.model = naive_bayes(TrainData$DelayedOrCancelled ~ .,data=TrainData)

saveRDS(nb.model,file="lib/models/flights_naivebayes_model.rds")

nb_predictions <- predict(nb.model,TestData)
