setwd("~/Documents/My Documents/Data Courses/Getting_Cleaning Data")
library(plyr)
library(dplyr)
feature_labels <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/features.txt")
#pulls the features from "features.txt" for later use in cross-referencing
activityLabels <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/activity_labels.txt")
#pulls the features from "activity_labels.txt" for later use in cross-referencing

#The below read.table sequences pull all of the "test" data: the "subject" data (1-30), 
#the "activity" data (y_test, 1-6, "WALKING", "STANDING", etc) and actual test
#data (X_test) in preparation for combining with the "train" data.
subjectTest <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/test/y_test.txt")
XTest <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/test/X_test.txt")

#The below read.table sequences pull all of the "train" data: the "subject" data (1-30), 
#the "activity" data (y_train, 1-6, "WALKING", "STANDING", etc) and actual train
#data (X_train) in preparation for combining with the "test" data.
subjectTrain <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/train/y_train.txt")
XTrain <- read.table(file = "~/Documents/My Documents/Data Courses/Getting_Cleaning Data/UCI HAR Dataset/train/X_train.txt")

#rbind the columns from Test and Train together and name them ("Subject", "Activity")
subjectTestTrain <-data.frame(rbind(subjectTest, subjectTrain))
activityTestTrain <-data.frame(rbind(activityTest, activityTrain))

names(subjectTestTrain)<-c("Subject") #assigns column names of "Subject" and "Activity" to these 2 variables
names(activityTestTrain)<-c("Activity")

#combineTestTrain is a df that will be all of the rows in X_test, X_train
combineTestTrain <-data.frame(rbind(XTest, XTrain))
names(combineTestTrain)<- c(as.character(feature_labels$V2))
#assigns the names (561 ea) from feature_labels to the column names of combineTestTrain

CombinedSet<-data.frame(cbind(subjectTestTrain, activityTestTrain, combineTestTrain))
#combines the columns subjectTestTrain (delineates "subject"), activityTestTrain (delineates "activity") and combineTestTrain
#(which is all of the rows of X_Test and X_Train together)

activity2 <- as.vector(activityLabels$V2)

CombinedSet[,2]<- mapvalues(CombinedSet[,2], c(1:6), activity2, warn_missing = TRUE)
#use "mapvalues()" to map the names of the activities (ie, "WALKING", "STANDING") to corresponding
#number (ie 1-6).  "CombinedSet" is now the fully-combined set of both "test" and "train"

tmp_matrix <- as.matrix(CombinedSet) 
#tmp_matrix is a temporary matrix that will be used to search for column names that contain either "Mean"
#or "Std".

tmp1 <- CombinedSet[, as.vector(grep("mean|std|-mean|-std", colnames(CombinedSet), value=TRUE))]
#this process uses "grep" function to search for the terms "mean", "std", "-mean" and/or "-std" in the
#column names.

CombinedDf<-as.data.frame(tmp1)
#"CombinedDf" is a data frame with only the columns that contain the terms "mean", "std", "-mean"
#and/or "-std"

FinalTidyDf<-cbind(CombinedSet[, 1:2], CombinedDf) #FinalTidyDf combines "CombinedSet" (the original columns of "Subject"
#and "Activity") with "CombinedDf" which contains only the columns that contain the terms "mean", "std",
#"-mean" and/or "-std".

headingsDf<-names(FinalTidyDf) # "headingsDf" is assigned the headings from the FinalTidyDf
#the intent of this section is to provide "descriptive activity" names to name the activities in the 
#data set.
newHeadings1<-gsub("tB", "timeB", headingsDf, fixed = TRUE) #substitutes 'time' for 't'
newHeadings2<-gsub("tG", "timeG", newHeadings1, fixed = TRUE)
newHeadings3<-gsub("fB", "frequencyB", newHeadings2, fixed = TRUE)#substitutes 'frequency' for 'f'
newHeadings4<-gsub("fB", "frequencyB", newHeadings3, fixed = TRUE)
newHeadings5<-gsub("Gyro", "Gyroscope", newHeadings4, fixed = TRUE)#substitutes 'Gyroscope' for 'Gyro'
newHeadings6<-gsub("Acc", "Accelerometer", newHeadings5, fixed = TRUE)#substitutes 'Accelerometer' for 'Acc'
names(FinalTidyDf)<-newHeadings6 #assigns the new headings created above to FinalTidyDf

#the below steps create a 2nd independent tidy data set with the average of each variable for each activity
#and each subject.

FinalTidyDfMeans<-FinalTidyDf #FinalTidyDfMeans will become the 2nd independent tidy data set

FinalTidyDfMeans<-group_by(FinalTidyDfMeans, Subject, Activity) %>% summarise_each(funs(mean))
#'group_by' is a dplyr function which groups all variables by 'subject' and 'activity'
#'summarise_each' is also a dplyr function which acts on the function (funs) identified.  In this 
#case it calculates the means of each of the groups.

write.table(FinalTidyDfMeans, "Sorted.txt", row.names = FALSE) 
#this write.table function summarizes FinalTidyDfMeans so that it can be observed by the graders







