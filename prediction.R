
# Final training and predicting

set.seed(1111)

# Creating 10 folds for cross validation
folds <- createFolds( y = training$classe, k = 10, list = TRUE, returnTrain = TRUE )

# Training models:
# Training GBM model

fitGBM <- train( classe ~ ., data = training, method = "gbm", preProcess = "pca" )

# Training random forest
fitGBM <- train( classe ~ ., data = training, method = "rf", preProcess = "pca" )

# Training 