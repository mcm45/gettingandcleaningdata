#Getting and Cleaning Data Final Project

#Run a script that:

#1. Merges the training and the test sets to create one data set.

#read in data
setwd("~/Coursera/")
if (!file.exists("final")){
  dir.create("final")
}
xtrain <- read.table("./final/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./final/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./final/UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./final/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./final/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./final/UCI HAR Dataset/test/subject_test.txt")

#merge test and traing datasets
xdata <- rbind2(xtrain, xtest)
ydata <- rbind2(ytrain, ytest)
subject <- rbind2(subject_train, subject_test)

#2. Extracts only the measurements on the mean and standard deviation 
#for each measurement.

features <- read.table("./final/UCI HAR Dataset/features.txt") #read in features
meansd <- grep("-(mean|std)\\(\\)", features[, 2]) #mean or sd from features
xdata <- xdata[, meansd] #subset 
names(xdata) <- features[meansd, 2] #apply feature names to columns

#3. Uses descriptive activity names to name the activities in the data set.

activity_labels <- read.table("./final/UCI HAR Dataset/activity_labels.txt") #read in activities
ydata[,1] <- activity_labels[ydata[,1],2] #name activities in ydata
names(ydata) <- "activity" #name column activity

#4. Appropriately labels the data set with descriptive variable names.

names(subject) <- "subject" #name column in subject dataset
cdata <- cbind(xdata, ydata, subject) #combine datasets

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

#install.packages("plyr")
library(plyr)
#split data, apply colMeans to cols 1-66, return results in average data frame
average <- ddply(cdata, .(subject, activity), function(x) colMeans(x[1:66])) 
View(average) #look at data set
write.table(average, "./final/average_tidy.txt", row.names=FALSE) #write new data set

