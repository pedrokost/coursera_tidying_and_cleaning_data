coursera_tidying_and_cleaning_data
==================================

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
	- I have extracted the features that match the regex ".+mean|.+std"
* Uses descriptive activity names to name the activities in the data set
	- the names are the ones provided in features file, but the characters '(' and ')' were removed, and characters ',', '-' were replaced with a characters '.'.
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	- The dataset included only the measurments of the mean and standard deviation for each measurement, not the whole dataset. The instruction are unclear in thir regard.
Good luck!