library(reshape2)
require("data.table")

dataFolder  = 'UCI HAR Dataset'
testFolder  = file.path(dataFolder, 'test')
trainFolder = file.path(dataFolder, 'train')
outFolder   = file.path(dataFolder, 'out')

if (!file.exists(outFolder)) dir.create(outFolder)

getCleanFeatures <- function () {
  features <- read.table(file.path(dataFolder, 'features.txt'))$V2
  features <- gsub('[()]', '', features)
  features <- gsub('[,-.]', '.', features)
  features <- tolower(features)
}

subjectTrain <- read.table(file.path(trainFolder, 'subject_train.txt'))
subjectTest  <- read.table(file.path(testFolder,  'subject_test.txt'))

features <- getCleanFeatures()
what <- as.list(rep_len(double(), length(features)))

XTrain <- scan(file=file.path(trainFolder, 'X_train.txt'), what=what)
XTest <- scan(file=file.path(testFolder, 'X_test.txt'), what=what)
names(XTest) <- features
names(XTrain) <- features

yTrain <- read.table(file.path(trainFolder, 'y_train.txt'))
yTest  <- read.table(file.path(testFolder,  'y_test.txt'))

activityLabels <- read.table(file.path(dataFolder, 'activity_labels.txt'), stringsAsFactors=F)
activityLabels <- unique(activityLabels[,2])

# * Merges the training and the test sets to create one data set.
dataTrain <- cbind(subjectTrain, yTrain, XTrain)
dataTest <- cbind(subjectTest, yTest, XTest)
data <- rbind(dataTrain, dataTest)

# data <- dataTest # FIXME remove

colNames <- c('subject', 'activity', features)
colnames(data) <- colNames


# * Extracts only the measurements on the mean and standard deviation for each measurement. 
includedCols <- grep(".+mean|.+std", colNames)
includedCols <- c(1:2, includedCols)
meansts <- data[, includedCols]
write.table(meansts, row.names=F, col.names=T, file=file.path(outFolder, 'meansstds.txt'))
# 
# * Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# It is unclear from the instructoin if this shoulb be about the meansts dataset, or the full dataset
tidy <- aggregate(meansts, by=list(meansts$subject, meansts$activity), mean)
# remove extra columns added by aggregate
tidy <- tidy[, -c(1,2)]

# * Uses descriptive activity names to name the activities in the data set
tidy$activity <- factor(tidy$activity, labels=activityLabels)
write.table(tidy, row.names=F, col.names=T, file=file.path(outFolder, 'tidydata.txt'))


