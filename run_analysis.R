## This script extracts, downloads and unzips the dataset provided to the
## project and then performs the following:
##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for
## each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

## Extracting and downloading source data

if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/SourceDataSet.zip")

## Unzipping SourceDataSet.zip to /data directory

unzip(zipfile = "./data/SourceDataSet.zip", exdir = "./data")

## Reading tables (training, testing, features, activity labels)

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
features <- read.table('./data/UCI HAR Dataset/features.txt')
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Assigning column names

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activity_labels) <- c('activityId','activityType')

## Mergeing the training and the test sets to create one data set

merged_train <- cbind(y_train, subject_train, x_train)
merged_test <- cbind(y_test, subject_test, x_test)
merged_dataset <- rbind(merged_train, merged_test)

## Extracting only the measurements on the mean and standard deviation for
## each measurement.

column_names <- colnames(merged_dataset)
mean_and_std_deviation <- (grepl("activityId" , column_names) | 
                        grepl("subjectId" , column_names) | 
                        grepl("mean.." , column_names) | 
                        grepl("std.." , column_names))
mean_and_std_deviation_set <- merged_dataset [mean_and_std_deviation == TRUE]

## Labeling the data set with descriptive variable names

activity_names_set <- merge(mean_and_std_deviation_set, activity_labels,
                        by='activityId',
                        all.x=TRUE)

## Creating a second, independent tidy data set with the average of each
## variable for each activity and each subject

tidy_set <- aggregate(. ~subjectId + activityId, activity_names_set, mean)
tidy_set <- tidy_set[order(tidy_set$subjectId, tidy_set$activityId),]

## Generating the final tidy data set in txt file

write.table(tidy_set, "tidy_set.txt", row.name = FALSE)
