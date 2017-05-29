# coursera-getting-and-cleaning-data

Readme file for the script run_analysis.R.

This script was created for the course project of the Coursera course 'Getting and Cleaning Data'.

The data used can be downloaded via:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The working directory from which the script needs to be run is /UCI HAR Dataset.

In the script the dplyr package will be used. Therefor this package will be loaded at the start of the script.

First the data in the test directory will be loaded.
the x data containing the measurements are assigned to x_test
the y data containing the activities are assigned to y_test
the subject ids are assigned to subject_test

In the same way the data in the train directory will be loaded.
the x data containing the measurements are assigned to x_train
the y data containing the activities are assigned to y_train
the subject ids are assigned to subject_train

The list of variables used is in the file 'features.txt'. These featurelabels will be loaded and used as column names for x_test and x_train.
For y_test and y_train 'activity' will be used as the column name.
For subject_test and subject_train 'subject_id' will be used as the column name.

Next a vector is created containing the activity descriptions.
Subsequently the activty numbers in y_test and y_train will be substituted with activity descriptions.

For the extraction of the measurments on the mean and standard deviation a search pattern is created.
Using this search pattern all the featurelabels containing mean() (for the means) or std() (for the standard deviations) can be selected.

First the mean and standard deviation measurements will be extracted from x_test and combined with the subject ids and activities in a data set 'test'
Then the mean and standard deviation measurements will be extracted from x_train and combined with the subject ids and activities in a data set 'train'
After that both will be merged into one dataset, alldata.

The merged data set will be used to create the tidy data set.
For this a new empty data frame (df) is created using the featurelabels as column names.

The new data set needs to have the average of each variable for each activity and each subject.
So first there will be a loop through all the activities in the merged data set.
For each activity there will then be a loop through all subjects.
The average will than be taken of all the measurements of an activity for each subject and added to data frame, df.

The resulting 






