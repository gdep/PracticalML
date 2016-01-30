
# First step, reading the data
training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")

# Some data cleaning ...
# It is pretty apparent that some columns have a lot of missing values ...
# Using the command below, the values are counted, and it is observed that columns either have all missing values or none.
lst <- colnames(training[,-(1:2)])
count.na.training <- sapply(lst,FUN=function(x,training){sum(is.na(training[,x]))},training)

# And also checking the testing data
lst <- colnames(testing[,-(1:2)])
count.na.testing <- sapply(lst,FUN=function(x,testing){sum(is.na(testing[,x]))},testing)

# So we remove the columns that contain missing values, filtering 100 out of 160.
# And since the testing dataset has more columns with all missing values, with use it as base to filter the training set.
boolTest <- colSums(is.na(testing)) == 0
testing <- testing[, boolTest]
training <- training[, boolTest]

# Also removing the first 7 columns, which are just identifiers (ID, name etc.)
# The seventh could be something relevant ("num_window"), as in some sort of time window where each exercise set
# is performed, but without some sort of documentation and upon further analysis (albeit shallow) it does not seem
# to hold much information.
training <- training[,-c(1:7)]
testing <- testing[,-c(1:7)]


