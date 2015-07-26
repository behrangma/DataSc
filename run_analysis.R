setwd("C:/Users/Behrang/Dropbox/Behrang/Work/Courses/Data Sc/3- Getting and Cleaning Data/Quizzes/Project/UCI HAR Dataset")

#1.Merges the training and the test sets to create one data set.

X_train <- read.table("train/X_train.txt")
X_test  <- read.table("test/X_test.txt")
X	  <- rbind(X_train,X_test)

y_train <- read.table("train/y_train.txt")
y_test  <- read.table("test/y_test.txt")
y	  <- rbind(y_train,y_test)

subject_train <- read.table("train/subject_train.txt")
subject_test  <- read.table("test/subject_test.txt")
subjects	  <- rbind(subject_train,subject_test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
index	   <- grep("-mean\\(\\)|-std\\(\\)",features[, 2])
X 	   <- X[,index]
names(X) <- features[index,2]

#3.Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
y[,1]      <- activities[y[,1], 2]

#4.Appropriately labels the data set with descriptive activity names.

names(y)	   <- "activities"
names(subjects) <- "subjects"

#5.Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

unique_subjects <- unique(subjects)
N_unique_subjects	    <- dim(unique_subjects)[1]
N_activities	    <- dim(activities)[1]

newdata <- matrix(0,N_unique_subjects*N_activities,2+dim(X)[2])
size_newdata <- dim(newdata)[2]

counter <- 1
for(i in 1:N_unique_subjects){
	for(j in 1:N_activities){
		selected <- X[(y[,1] == activities[j,2]) & (subjects[,1] == unique_subjects[i,1]),]
		newdata[counter,1] <- unique_subjects[i,1]
		newdata[counter,2] <- activities[j,1]
		newdata[counter,3:size_newdata] <- colMeans(selected)
		counter <- counter + 1
	}
}

colnames(newdata, do.NULL = FALSE)
colnames(newdata) <- c("subject","activity",names(X))
write.table(newdata,"newdata.txt")

