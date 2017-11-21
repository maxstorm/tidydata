library(readr)
library(dplyr)
library(tidyr)

# 1: Merge the training and the test sets to create one data set.

# 1.1 Import activity names
activity <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
names(activity) <- c("ActivityID", "Activity Name")

# 1.2 Import label names
labels <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
labels <- labels[,2]

# 1.3 Import test data
test <- read_table("UCI HAR Dataset/test/X_test.txt",
                     col_names = FALSE)
testActivity <- read_table("UCI HAR Dataset/test/y_test.txt", 
                           col_names = FALSE)
testsubject <- read_table("UCI HAR Dataset/test/subject_test.txt",
                      col_names = FALSE)

# 1.4 Rename column names for test data
names(testsubject) <- "Subject"
names(testActivity) <- "ActivityID"
names(test) <- labels

# 1.5 Merge activity data, test data and subject data
testData <- cbind(testsubject, testActivity, test)
testData2 <- left_join(activity, testData)

# 1.6 Import training data
train <- read_table("UCI HAR Dataset/train/X_train.txt", 
                   col_names = FALSE)
trainActivity <- read_table("UCI HAR Dataset/train/y_train.txt", 
                           col_names = FALSE)
trainsubject <- read_table("UCI HAR Dataset/train/subject_train.txt",
                          col_names = FALSE)

# 1.7 Rename column names for training data
names(trainActivity) <- "ActivityID"
names(trainsubject) <- "Subject"
names(train) <- labels

#1.8 Merge activity data, training data and subject data
trainData <- cbind(trainsubject, trainActivity, train)
trainData2 <- left_join(activity, trainData)

#1.9 Merge the training and the test sets to create one data set.
data <- rbind(trainData2, testData2)

# 2 Extract only the measurements on the mean and standard deviation for each measurement.
col <- grep("mean()|std()", names(data))
data2 <- data[, c(1:3, col)]
data3 <- gather(data2, "features", "time",4:82, convert = TRUE)

# 3 Create independent tidy data set with the average of each variable for each activity and each subject.
finalData <- data3 %>% group_by(`Activity Name`, Subject, features) %>% summarise(avg = mean(time))
write.table(finalData, file = "CourseProject_Week1.txt", row.names = FALSE)
