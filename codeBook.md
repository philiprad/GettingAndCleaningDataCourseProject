The script run_analysis.R is used to clean up data extracted from the UCI HAR Dataset. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The analysis performs the following steps:
*Loads test data: X_test= 2947 observations with 561 variables, subject_test=2947 observations, y_test=2947 observations (activities)
*Creates test.data.set binding this 3 data sets
*Loads train data: X_train=7352 observations with 561 variable, subject_test=7352 observations, y_test=7352 observations (activities)
*Creates train.data.set binding this 3 data sets
*Loads features dataset: 561 observations with 2 variables
*Merges train and test datasets
*Names the columns: fist column=subject, second to 562nd=features and 563rd=activity
*Creates a tidy.data.set with subject,activity and the columns that have the mean and the standard deviation information
*Labels the activity: 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
*Creates a new tidy data set with the average of each variable for each activity and each subject
*Saves the tidy data in tidyDataSet.txt (180 observations with 81 variables)