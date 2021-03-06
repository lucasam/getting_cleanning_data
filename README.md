Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data Course Project (Coursera)

Description
-----------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The goal is to accomplish the final project of the course.

To be clear will be reproduced here the Instructions of the project



> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 
> 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
>
>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
>
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
>
>Here are the data for the project:
>
>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
>
>You should create one R script called run_analysis.R that does the following.
>
>1. Merges the training and the test sets to create one data set.
>2. Extracts only the measurements on the mean and standard deviation for each measurement.
>3. Uses descriptive activity names to name the activities in the data set
>4. Appropriately labels the data set with descriptive variable names.
>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The file run_analysis.R is available on this repository and fully commented.

How to Run
----------
* download the file run_analysis.R or clone this repo 
* open a R console and set the working directory as you wish
* run run_analysis.R script 
* YOU DO NOT NEED TO DOWNLOAD ANY ADDITIONAL DATA. THE SCRIPT WILL DOWNLOAD IT FOR YOU

What it will produce
--------------------------------

* run_analysis.R will produce 2 data frames
  * dataSet - Data Set containning the tidy data from the "Human Activity Recognition Using Smartphones Data Set "
  * meanDataSet - Data Set containning the means of the tidy data above grouped by subject and activity
  * write a file called result.txt on your working dir

Other Instructions
--------------------
The information you will need about the datasets are described in the Cookbook.md