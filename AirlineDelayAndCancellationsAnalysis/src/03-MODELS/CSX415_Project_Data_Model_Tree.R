tree.model <- rpart(TrainData$DelayedOrCancelled ~ ., data=TrainData,
            control=rpart.control(minsplit=2, minbucket=1, cp=0.00001))

tr_predictions <- predict(tree.model,TestData)

saveRDS(tree.model,file="flights_tree_model.rds")


