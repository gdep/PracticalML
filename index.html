## Practical Machine Learning: Prediction Assignment Report

This report describes the analysis made for the course project of the Practical Machine Learning course on coursera. The analysis is divided in 3 steps:

1. Data cleaning
2. Data and model exploratory analysis
3. Final prediction and conclusion

# Data cleaning

First step, reading the data:
```R
training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")
```

After reading the data, it is readily apparent upon initial investigation that some columns have a lot of missing values.
Using the command below, the values are counted, and it is observed that columns either have all missing values or none:
```R
lst <- colnames(training[,-(1:2)])
count.na.training <- sapply(lst,FUN=function(x,training){sum(is.na(training[,x]))},training)
```

And also checking the testing data:
```
lst <- colnames(testing[,-(1:2)])
count.na.testing <- sapply(lst,FUN=function(x,testing){sum(is.na(testing[,x]))},testing)
```

As such, the next step is to remove the columns that contain missing values entirely, filtering 100 out of 160 total colums.
And since the testing dataset has more columns with all missing values, it is used as base to filter the training set:
```R
boolTest <- colSums(is.na(testing)) == 0
testing <- testing[, boolTest]
training <- training[, boolTest]
```

The first 7 columns are just identifiers (ID, name etc.) so they can also be removed, as they won't add to the analysis.
As an addendum, the seventh could be something relevant ("num_window"), as in some sort of time window where each exercise set is performed, but without some sort of documentation and upon further analysis (albeit shallow) it does not seem to hold much valuable information:
```R
training <- training[,-c(1:7)]
testing <- testing[,-c(1:7)]
```

# Data and model exploratory analysis

After the initial data cleaning, the next step is to evaluate how a few models perform on the data, before attempting some sort of feature engineering.

```R
set.seed(111)
```

For this, it was used a holdout method, splitting the training data into 2 chunks, and using one to train, and one to evaluate:

```R
inTrain <- createDataPartition( y = training$classe, p = 0.6, list = FALSE )
training60part <- training[inTrain,]
testing60part <- training[-inTrain,]
```

Initially, fitting a stochastic gradient boosting (GBM) model with default parameters:
```R
fitGBM <- train( classe ~ . , data = training60part, method = "gbm" )
```
Predicting with the GBM:
```R
predGBM <- predict( fitGBM, testing60part )
```
The confusion matrix shows a ~96% accuracy, which seems pretty good for the initial run
```R
confusionMatrix( predGBM, testing60part$classe )
```

Now fitting a random forest with default parameters to see which method performs better:
```R
fitRF <- train( classe ~ . , data = training60part, method = "rf")
predRF <- predict( fitRF, testing60part )
confusionMatrix( predRF, testing60part$classe )
```
The random forest achieves 98,75% accuracy


# Final prediction and conclusion

Considering the already good performance of the random forest model, it seemed reasonable to not do any further exploratory analysis, and skip to a more robust estimation of the out-of-sample error.
As such, the next step is a 5-fold x 2 cross-validation using a random forest to narrow down the prediction of the out-of-sample error:

Setting a seed for reproducibility:
```R
set.seed(1111)
```

Setting up the cross validation options:
```R
`fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 2)`
```
Fitting the model and predicting:
```R
fitRF <- train( classe ~ ., data = training60part, method = "rf", trControl = fitControl )
fitRF$pred
```

The random forest with 5x2 cross validation indicates around 98,5% accuracy, so at this point it seems reasonable to estimate the out-of-sample error to be at around 1,5%


