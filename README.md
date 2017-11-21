# README: Description of the skript

In the first step the run_analysis.R skript loads activities and feature's label names. 

Activity names:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

Features names (there are 561 features; in the following is a glimpse of the first 6):

1 tBodyAcc-mean()-X

2 tBodyAcc-mean()-Y

3 tBodyAcc-mean()-Z

4 tBodyAcc-std()-X

5 tBodyAcc-std()-Y

6 tBodyAcc-std()-Z

Next the test data is imported together with respective subjects and activity data.
Each row in the data set identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Then the same procedure is performed for the training data set. 

After the training and test data set (incl. labels, activities and subjects) are imported the two data sets are merged.

In the second step the run_analysis.R skript extracts only the measurements (features) on the mean and standard deviation for each measurement.

In the last step the skript creates an independent tidy data set with the average of each variable for each activity and each subject. This data set is then written into a text file in the working directory.










# tidydata
# tidydata
