
# Adding some libraries

library(caret)
library(xgboost)
library(gbm)
library(randomForest)

# Now, splitting the data and doing some initial model evaluation

set.seed(111)
# Using 2-fold (holdout) cross validation, mainly for simplicity and faster execution, but also because both samples are large
# having around 10k data points.
inTrain <- createDataPartition( y = training$classe, p = 0.5, list = FALSE )

training60part <- training[inTrain,]
testing60part <- training[-inTrain,]

# Fitting a stochastic gradient boosting (GBM) model to see initially how good is the accuracy without too much pre-processing.
fitGBM <- train( classe ~ . , data = training60part, method = "gbm" )

# Predicting with the GBM
predGBM <- predict( fitGBM, testing60part )

# The confusion matrix shows a ~96% accuracy, which seems pretty good for the initial run
confusionMatrix( predGBM, testing60part$classe )



# Now fitting a random forest to see which method performs better, already using the PCA pre-processing
fitRF <- train( classe ~ . , data = training60part, method = "rf")
predRF <- predict( fitRF, testing60part )
# The random forest achieves 98,25% accuracy
confusionMatrix( predRF, testing60part$classe )



# Final test for model selection, fitting an extreme gradient boost (XGB)
fitXGB <- train( classe ~ ., data = training60part, method = "xgbtree")
preRF <- predict( fitXGB, testing60part )
# The XGB achieves ~99% accuracy, but does also consume a lot of time.
confusionMatrix(predXGB, testing60part$classe )




