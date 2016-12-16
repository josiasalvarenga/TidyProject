# Objective
This document describes the variables, the data, and any transformations or work that performed to clean up the source data and create 
the final tidy data based on R script.

## Source data
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Transformations / Work performed
Based on the instructions provided, the script extracts, downloads and unzips the dataset and then performs the following:
* Read tables (training, testing, features, activity labels
* Assign column names
* Merge the training and test sets and create new data set
* Extract only the measurements on the mean and standard deviation for each measurement
* Label the data set with descriptive variable names
* Create a second, independent tidy data set with the average of each variable, activity and subject
* Generate the final tidy data set in a TXT file.

## Variables
x_train - source training data from original file
y_train - source training data from original file
subject_train - source training data from original file
x_test - source test data from original file
y_test - source test data from original file
subject_test - source test data from original file
features - source features data from original file
activity_labels - source activity labels data from original file

merged_train - all source training data merged in a new data set
merged_test - all source test data merged in a new data set
merged_dataset - training and test data merged in a new data set

mean_and_std_deviation_set - mean and standard deviation taken from merged_dataset and stored in a new data set

activity_names_set - data set with descriptive variable names generated from the merge between mean_and_std_deviation_set and activity_labels

tidy_set - final data set with the tidy data transformed based on the instructions


## Final result
The final result of the data manipulation was stored in a txt file named tidy_set.txt
