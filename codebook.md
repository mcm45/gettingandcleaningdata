#Codebook

This codebook describes data in averages_tidy.txt dataset.

Data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis.R script does the following:
(1) reads in and merges text data,
(2) extracts mean and standard deviations of measurements,
(3) names activities,
(4) labels variabilites, 
(5) creates a tidy independent dataset 

##Variables in Data

There are 180 observations and 68 variables.

* subject - number of study participant (1 to 30)
* activity - 6 activity study participant performed (walking, walking upstairs, walking downstairs, sitting, standing, laying)
* measures - 66 smartphone accelerometer means and standard deviations on three axes (x,y,z) for 
    * raw data: tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, tBodyGyroJerk
    * transformed data: fBodyAcc, fBodyAccJerk, fBodyAccGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag
