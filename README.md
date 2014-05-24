COURSERA: GETTING AND CLEANING DATA PROJECT
============================================

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## How it works and what it does

run_analysis.R that does the following:

* Reads the provided data
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
	- I have extracted the features that match the regex ".+mean|.+std"
	- This dataset is saved as meanssts.txt
* Uses descriptive activity names to name the activities in the data set
	- The names are the ones provided in features file, but the characters '(' and ')' were removed, and characters ',', '-' were replaced with a characters '.'.
* Appropriately labels the data set with descriptive activity names.
	- Uses the labels from the activity_labels file
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	- The dataset included only the measurments of the mean and standard deviation for each measurement, not the whole dataset. The instruction are unclear in thir regard.
	- The dataset is save in a file called tidydata.txt

The output datasets are stored `UCI HAR Dataset/out`.

## Running the script

- extract the data for the project into the working directory
- run the script like this:
```R
source('run_analysis.R')
```