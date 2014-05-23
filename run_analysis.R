# Loading required libraries
print('Loading libraries: plyr, reshape2')
library(plyr)
library(reshape2)

# Loading the data labels, and extracting the required labels with mean and std
print('Loading the data labels and get the required labels')
labels.meas <- read.table('../UCI HAR Dataset/features.txt',col.names=c("MeasureID", "MeasureName"))
labels.meas_req <- grep(".*mean\\(\\)|.*std\\(\\)", labels.meas$MeasureName)

# Loading the activity labels
labels.act <- read.table('../UCI HAR Dataset/activity_labels.txt', col.names=c("ActivityID", "ActivityName"))

# Load the training data: subject, X, and Y
print('Loading the training data')
train_subj <- read.table('../UCI HAR Dataset/train/subject_train.txt', col.names="SubjectID")
train_x <- read.table('../UCI HAR Dataset/train/X_train.txt',col.names=labels.meas$MeasureName)
train_y <- read.table('../UCI HAR Dataset/train/y_train.txt',col.names="ActivityID")

# Load the testing data: subject, X, and Y
print('Loading the testing data')
test_subj <- read.table('../UCI HAR Dataset/test/subject_test.txt', col.names="SubjectID")
test_x <- read.table('../UCI HAR Dataset/test/X_test.txt',col.names=labels.meas$MeasureName)
test_y <- read.table('../UCI HAR Dataset/test/y_test.txt',col.names="ActivityID")

# Subset to only the required columns
print('Subsetting to only the mean and standard deviation columns')
train_x <- train_x[,labels.meas_req]
test_x <- test_x[,labels.meas_req]

# Merge all the data types for the training data
print('Merging all the data types for the training data')
train_data <- cbind(train_subj, train_x, train_y)

# Merge all the data types for the testing data
print('Merging all the data types for the testing data')
test_data <- cbind(test_subj, test_x, test_y)

# Merge the training and testing data into one dataset
print('Merge the training and testing data into one dataset')
data <- rbind(train_data, test_data)

# Add an activity name for each record
print('Add an activity name for each record')
data <- join(data,labels.act,by='ActivityID')

# Create the tidy dataset, and save it locally
print('Create the tidy dataset, and save it locally')
write.csv(data, 'tidy_dataset.txt')

# Create the other dataset for the averages, and save it locally
print('Create the other dataset for the averages, and save it locally')
melt_cols <- c("SubjectID", "ActivityID", "ActivityName")
meas_cols <- setdiff(colnames(data),melt_cols)
data.melt <- melt(data, id= melt_cols, measure.vars= meas_cols)
data.avgs <- dcast(data.melt, ActivityName + SubjectID ~ variable, mean) 
write.csv(data.avgs, 'tidy_dataset_avgs.txt')