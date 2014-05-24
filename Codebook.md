COURSERA: GETTING AND CLEANING DATA PROJECT
============================================

## Codebook

### meanstds.txt

The space delimited file contains the colums 'subject' 'activity' and then all the columns from the original dataset that have the word 'mean' or 'std' in the name. The names have been cleared: parenthesis removed, made lowercase, and charactedrs ',-' replaced with a '.'.

* 'subject': [number] indicating the subject identifier
* 'activity': [number] indicating the activity identifier. Refer to the file `activity_labels.txt` for the meaning of these identifiers.

For the description of the remaining columns, please refer to the description of the original dataset available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### tidydata.txt

The space delimited file contains the average of each variable about the mean or standard deviation for each activity and each subject.

The columns are:

* 'subject': [number] indicating the subject identifier
* 'activity': [string] labelling the activity. Refer to the file `activity_labels.txt` for the complete list of possible activity labels
* '...': [number] the remaining columns include the averages of the of each variable about the mean or standard deviation of a variable. For the description of these columns, please refer to the description of the original dataset available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
