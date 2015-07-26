Project code book
====
The data for this project is about wearable computing which is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


1. There are two data sets for each variable: test and train. We merge the training and the test sets to create one data set.
2. We extract only the measurements on the mean and standard deviation for each measurement. 
3. We use descriptive activity names to name the activities in the data set. They are:
   WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
4. We label the data set with descriptive variable names. 
5. From the data set in step 4, we create a second, independent tidy data set with the average of each variable for each activity and each subject. We save this data set in the file newdata.txt.
