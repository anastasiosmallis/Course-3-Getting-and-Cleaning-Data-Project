## This R file was created for the Project of 
## Course 3 - Getting and Cleaning Data 
## Coursera - Johns Hopkins Bloomberg
## School of Public Health
## by Anastasios Mallis May 2015

#### Reading the data ####
## Downloading the zipfile in the working directory
link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file_location <- getwd()
download.file(link, paste(file_location,"/dataset.zip",sep=""))

# remove link and file location to save memory
rm(link);rm(file_location)

# Unzip the file
library("utils")
unzip("dataset.zip")

# read test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- cbind(subject_test, Y_test, X_test)
rm(subject_test);rm(Y_test)

# read train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- cbind(subject_train, Y_train, X_train)
rm(subject_train);rm(X_test)

# read features
features <- read.table("UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
features <- c("Subject", "Activity Label", features)

# use features as column names
colnames(X_test) <- features
colnames(X_train) <- features

#### Merge Data ####
X_train_and_test <- rbind(X_train,X_test)

# remove the individual datasets to save memory
rm(X_test);rm(X_train)

#### only keep data of means and standard deviations #### 
X_train_and_test<- X_train_and_test[,grepl("mean()", features, fixed = T)|
                                      grepl("std()", features, fixed = T)|
                                      grepl("Activity Label", features, fixed = T)|
                                      grepl("Subject", features, fixed = T)]

# remove features to save memory
rm(features)

# replace numbers with names of activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

X_act_labels <- c(rep(".",length(X_train_and_test)))

for (i in 1:length(X_train_and_test[,1])){
  X_act_labels[i] <- activity_labels[X_train_and_test[i,1],2]
}

X_train_and_test <- X_train_and_test[,-2]
X_train_and_test <- cbind(X_act_labels, X_train_and_test)

head(X_train_and_test[,1])
