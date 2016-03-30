# Final Assingment of getting and cleanning data course.
# 
#rm(list=ls())
#setwd("/home/lucasam/src/datasciencecoursera/cleanning_data/assign_4")

#
# Downloading datasets, preparing the enviromment
#
library(dplyr)
library(plyr)
dataSetUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFileName <- "dataSet.zip"
#Download the dataset if necessary
if(!file.exists(zipFileName)){
  download.file(dataSetUrl,zipFileName)
}
#UNZIP the downloaded file regardless of it is already unziped
unzip(zipFileName,overwrite = TRUE)

#
# Starting up.
# Declaring some file names in variables
# 
trainningSubjectFile <-"UCI HAR Dataset/train/subject_train.txt"
trainningDataFile <-"UCI HAR Dataset/train/X_train.txt"
trainningActivitiesFile <-"UCI HAR Dataset/train/y_train.txt"

testDataFile <-"UCI HAR Dataset/test/X_test.txt"
testSubjectFile <- "UCI HAR Dataset/test/subject_test.txt"
testActivitiesFile <-"UCI HAR Dataset/test/y_test.txt"

activityLabelsFile="UCI HAR Dataset/activity_labels.txt"
featuresFile <-"UCI HAR Dataset/features.txt"
#
# Reading features information
#
features <- read.table(featuresFile,header = FALSE)
#
#
# Part 1. Merges the training and the test sets to create one data set.
#
#

# 1.1. Initiating trainning data frames
trainnigData <- read.table(trainningDataFile,header = FALSE,col.names=features[,2])
trainningActivies <- read.table(trainningActivitiesFile,header = FALSE,col.names=c("activities"))
trainningSubjects <- read.table(trainningSubjectFile,header = FALSE,col.names=c("subject"))
# 1.2 Initiating test data frames
testData<- read.table(testDataFile,header = FALSE,col.names=features[,2])
testActivies <- read.table(testActivitiesFile,header = FALSE,col.names=c("activities"))
testSubjects <- read.table(testSubjectFile,header = FALSE,col.names=c("subject"))

#1.3 Merging them all together
groupedData <- rbind(trainnigData,testData)
groupedActivities <- rbind(trainningActivies,testActivies)
groupedSubjects <- rbind(trainningSubjects,testSubjects)

#1.4 grouping datasets
dataSet <- cbind(groupedSubjects,groupedActivities,groupedData)

#
#
# Part 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
#

dataSet<-select(dataSet,matches("mean\\.|std\\.|subject|activities"))
#
# 2.2 Cleanning up the mess
#
rm("features","groupedSubjects","groupedActivities","groupedData","trainnigData","testData","trainningActivies","testActivies","trainningSubjects","testSubjects")


#
#
# Part 3. Uses descriptive activity names to name the activities in the data set
#
#

# 3.1 Read activity labels from a file
activitylabels<-read.table(activityLabelsFile,col.names = c("ActivityId", "activity"))
# 3.2 Merge the information basead on the "ids"
dataSet<-merge(dataSet,activitylabels, by.x="activities", by.y="ActivityId")
# 3.3 remove columns with the same meaning
dataSet<-select(dataSet, -activities )

#
#
# Part 4. Appropriately labels the data set with descriptive variable names.
#
#
# I am not quite sure about what does it means. 
# I believe that this was acomplished in the fist part because the columns was already loaded with the proper
# names
# read.table(trainningDataFile,header = FALSE,col.names=features[,2])
#
#

names(dataSet)


#
#
# Part 5. From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable for each activity and each subject.
#
#

meanDataSet <- ddply(dataSet,c("activity","subject"),numcolwise(mean))
