**I. References**

a.  
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones\>  
  
b. https://class.coursera.org/getdata-014/human\\\_grading

 

**II. Program purpose:** This R program (run\_analysis.R) is designed to pull
extensive and disparate data, in the form of measurements from subjects
performing various activities (see “Data Set Information”). Upon pulling this
disparate data (such as the various activities, features of measurement, and
actual measurements) the program arranges all of the data into a “Tidy Data
Set”. A Tidy Data Set is one that ascribes to 4 characteristics (1. Each
variable measured should be in one column; 2. Each different observation of that
variable should be in a different row; 3. There should be one table for each
“kind” of variable; 4. If you have multiple tables they should include a column
in the table that allows them to be linked).

 

**II. Data Set Information:**

The experiments have been carried out with a group of 30 volunteers within an
age bracket of 19-48 years. Each person performed six activities (WALKING,
WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. The experiments have been video-recorded to
label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training
data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and
50% overlap (128 readings/window). The sensor acceleration signal, which has
gravitational and body motion components, was separated using a Butterworth
low-pass filter into body acceleration and gravity. The gravitational force is
assumed to have only low frequency components, therefore a filter with 0.3 Hz
cutoff frequency was used. From each window, a vector of features was obtained
by calculating variables from the time and frequency domain.

 

**III. Attribute Information:**

For each record in the dataset it is provided:   
- Triaxial acceleration from the accelerometer (total acceleration) and the
estimated body acceleration.   
- Triaxial Angular velocity from the gyroscope.   
- A 561-feature vector with time and frequency domain variables.   
- Its activity label.   
- An identifier of the subject who carried out the experiment. 

 

**IV. Program Design:**

This program (file name: run\_analysis.R) meets the above-defined purpose by
performing 5 steps:

1. It merges the “training” and the “test” sets to create one data set.  
  
2. It extracts only the measurements on the “mean” and “standard deviation”  
for each measurement.  
  
3. Uses descriptive activity names to name the activities in the data set.  
  
4. Appropriately labels the data set with descriptive variable names.  
  
5. From the data set in step 4, creates a second, independent tidy data set  
with the average of each variable for each activity and each subject

 

**V. Program Synopsis** (refer to above steps in “Program Design”)

/////Part 1: merges the “training” and the “test” sets to create one data
set//////////////////////////////////

The following variables are used to pull the various “test” and “train” data

\-feature\_labels: the labels of the various measured features
(tBodyAcc-mean()-X, tGravityAcc-iqr()-X, etc) which are pulled from the file
“features.txt"

\-activityLabels: the activities which each subject (1-30) performed (Walking,
Walking\_Upstairs, Walking\_Downstairs, Sitting, Standing, Laying). These are
pulled from the file activity\_labels.txt.

\-subjectTest: read.table(file = "\~/Documents/My Documents/Data
Courses/Getting\_Cleaning Data/UCI HAR Dataset/test/subject\_test.txt")

\-activityTest: reads in the actual test datay\_test.txt")

\-XTest \<- read.table(file = "\~/Documents/My Documents/Data
Courses/Getting\_Cleaning Data/UCI HAR Dataset/test/X\_test.txt")

\-subjectTrain \<- read.table(file = "\~/Documents/My Documents/Data
Courses/Getting\_Cleaning Data/UCI HAR Dataset/train/subject\_train.txt")

\-activityTrain \<- read.table(file = "\~/Documents/My Documents/Data
Courses/Getting\_Cleaning Data/UCI HAR Dataset/train/y\_train.txt")

\-XTrain \<- read.table(file = "\~/Documents/My Documents/Data
Courses/Getting\_Cleaning Data/UCI HAR Dataset/train/X\_train.txt")

 

The following variables use the previously created variables (above) to combine
(via rbind) the rows of data from Test and Train together and name them
("Subject", "Activity")

\-subjectTestTrain \<-data.frame(rbind(subjectTest, subjectTrain))

\-activityTestTrain \<-data.frame(rbind(activityTest, activityTrain))

 

“combineTestTrain” is a data frame that will be all of the rows in X\_test,
X\_train

\-combineTestTrain \<-data.frame(rbind(XTest, XTrain))

 

“combineTestTrainnames” assigns the names (561 ea) from feature\_labels to the
column names of what will become the final data set. This list will be pared way
down after step 2 (below) to only about 81 names.

\-combineTestTrainnames(combineTestTrain)\<-
c(as.character(feature\_labels\$V2))

 

“combineSet” is a complete data frame that now combines the columns
subjectTestTrain (delineates "subject"), activityTestTrain (delineates
"activity") and combineTestTrain(which is all of the rows of X\_Test and
X\_Train together). "CombinedSet" is now the fully-combined set of both "test"
and "train"

\-CombinedSet\<-data.frame(cbind(subjectTestTrain, activityTestTrain,
combineTestTrain))

 

The following command uses "mapvalues()" to map the names of the activities (ie,
"WALKING", "STANDING") to corresponding number (ie 1-6).

\-CombinedSet[,2]\<- mapvalues(CombinedSet[,2], c(1:6), activity2, warn\_missing
= TRUE)

 

/////Part 2: extracts only the measurements on the “mean” and “standard
deviation” for each measurement////////

“tmp\_matrix" is a temporary matrix that will be used to search for column names
that contain either "Mean"

or "Std".

\-tmp\_matrix \<- as.matrix(CombinedSet)

 

This process uses "grep" function to search for the terms "mean", "std", "-mean"
and/or "-std" in the column names and assign this new vector to the variable
“tmp1”.

\-tmp1 \<- CombinedSet[, as.vector(grep("mean\|std\|-mean\|-std",
colnames(CombinedSet), value=TRUE))]

 

"CombinedDf" is the data frame, resulting from the above grep function, with
only the columns that contain the terms "mean", "std", "-mean” and/or "-std"

\-CombinedDf\<-as.data.frame(tmp1)

 

/////Part 3: Uses descriptive activity names to name the activities in the data
set/////////////////

 

The following command combines the columns that result from part 2.

\-FinalTidyDf\<-cbind(CombinedSet[, 1:2], CombinedDf)

 

Now, in order to make the column headings (variables) more “descriptive” the
following sequence uses “gsub” to substitute the entire word in for simple
letters or abbreviations (ie “frequency” is substituted for “f”, etc)

\-headingsDf\<-names(FinalTidyDf)

\-newHeadings1\<-gsub("tB", "timeB", headingsDf, fixed = TRUE)

\-newHeadings2\<-gsub("tG", "timeG", newHeadings1, fixed = TRUE)

\-newHeadings3\<-gsub("fB", "frequencyB", newHeadings2, fixed = TRUE)

\-newHeadings4\<-gsub("fB", "frequencyB", newHeadings3, fixed = TRUE)

\-newHeadings5\<-gsub("Gyro", "Gyroscope", newHeadings4, fixed = TRUE)

\-newHeadings6\<-gsub("Acc", "Accelerometer", newHeadings5, fixed = TRUE)

 

/////Part 4: Appropriately labels the data set with descriptive variable
names/////////////////

With the below step, the final tidy data set (FinalTidyDf) is now labeled with
completely descriptive headings

\-names(FinalTidyDf)\<-newHeadings6

 

/////Part 5: From the data in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each
subject/////////////////

Here, a new (mirror image) data frame is created so as not to disrupt
FinalTidyDf

\-FinalTidyDfMeans\<-FinalTidyDf

 

This next and final step uses the “dplyr” functionality to, first, group the
data frame by “subject” and activity” and then takes the mean of each
measurement by activity and by subject

\-FinalTidyDfMeans\<-group\_by(FinalTidyDfMeans, Subject, Activity) %\>%
summarise\_each(funs(mean))

 

This final command is actually not part of the 5 parts but is instead to allow
the proper upload of a text file (“Sorted.txt”) which can be submitted on the
assignment turn in.

\-write.table(X, "Sorted.txt", row.names = FALSE)

 

 

 

 

 

 

 

 

 
