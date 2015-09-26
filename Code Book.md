 

 

Study Design:  
========================================  
This program (file name: run\_analysis.R) meets the above-defined purpose by
performing 5 steps:

1. It merges the “training” and the “test” sets to create one data set.  
  
2. It extracts only the measurements on the “mean” and “standard deviation”  
for each measurement.  
  
3. Uses descriptive activity names to name the activities in the data set.  
  
4. Appropriately labels the data set with descriptive variable names.  
  
5. From the data set in step 4, creates a second, independent tidy data set  
with the average of each variable for each activity and each subject

  
Original data provided:  
=========================================  
Abstract: Human Activity Recognition database built from the recordings of 30
subjects performing activities of daily living (ADL) while carrying a
waist-mounted smartphone with embedded inertial sensors.  
  
Data Set Characteristics: Multivariate, Time-Series  
  
Number of Instances: 10299  
  
Area: Computer  
  
Number of Attributes: 561  
  
Attributes:  
  
  
The dataset includes the following files:  
=========================================  
  
- 'README.txt'  
  
- 'features\_info.txt': Shows information about the variables used on the
feature vector.  
  
- 'features.txt': List of all features.  
  
- 'activity\_labels.txt': Links the class labels with their activity name.  
  
- 'train/X\_train.txt': Training set.  
  
- 'train/y\_train.txt': Training labels.  
  
- 'test/X\_test.txt': Test set.  
  
- 'test/y\_test.txt': Test labels.  
  
The following files are available for the train and test data. Their
descriptions are equivalent.  
  
- 'train/subject\_train.txt': Each row identifies the subject who performed the
activity for each window sample. Its range is from 1 to 30.  
  
- 'train/Inertial Signals/total\_acc\_x\_train.txt': The acceleration signal
from the smartphone accelerometer X axis in standard gravity units 'g'. Every
row shows a 128 element vector. The same description applies for the
'total\_acc\_x\_train.txt' and 'total\_acc\_z\_train.txt' files for the Y and Z
axis.  
  
- 'train/Inertial Signals/body\_acc\_x\_train.txt': The body acceleration signal
obtained by subtracting the gravity from the total acceleration.  
  
- 'train/Inertial Signals/body\_gyro\_x\_train.txt': The angular velocity vector
measured by the gyroscope for each window sample. The units are radians/second.

 

Variables:

a) Variables in “Sorted.txt” (Tidy data set)

============================================

timeBodyAccelerometer.mean…X,Y,Z: ('-XYZ' is used to denote 3-axial signals in
the X, Y and Z directions) The mean of the body acceleration signal for each
axis

 

timeBodyAccelerometer.std…X,Y,Z: The measurement of the standard deviation of
the body acceleration signal for each axis

 

timeGravityAccelerometer.mean…X, Y, Z: The measurement of the mean of the
gravity acceleration signals for each axis

 

timeGravityAccelerometer.std…X, Y, Z: The measurement of the standard deviation
of the gravity acceleration signals for each axis

 

timeBodyAccelerometerJerk.mean…X, Y, Z: The mean of the Jerk signals as measured
by the body linear acceleration

 

timeBodyAccelerometerJerk.std…X,Y,Z:The standard deviation of the Jerk signals
as measured by the body linear acceleration

 

timeBodyGyroscope.mean…X,Y,Z: The measurement of the mean of the gyroscope
signals for each axis

 

timeBodyGyroscope.std…X, Y, Z: The measurement of the standard deviation of the
gyroscope signals for each axis

 

timeBodyGyroscopeJerk.mean…X, Y, Z: The mean of the measurements of the Jerk
signals as measured by the gyroscope

 

timeBodyGyroscopeJerk.std…X, Y, Z: The standard deviation of the measurements of
the Jerk signals as measured by the gyroscope

 

timeBodyAccelerometerMag.mean..The measurement of the mean magnitude for the
body linear acceleration

 

timeBodyAccelerometerMag.std..The measurement of the standard deviation of the
magnitude for the body linear acceleration

 

timeGravityAccelerometerMag.mean..The measurement of the mean of the magnitude
of gravity acceleration signals for each axis

 

timeGravityAccelerometerMag.std..The measurement of the standard deviation of
the magnitude of gravity acceleration signals for each axis

 

timeBodyAccelerometerJerkMag.mean..The mean of the measurements of the magnitude
of Jerk signals as measured by the accelerometer

 

timeBodyAccelerometerJerkMag.std..The standard deviation of the measurements of
the magnitude of Jerk signals as measured by the accelerometer

 

timeBodyGyroscopeMag.mean..The mean of the measurement of magnitude as measured
by the gyroscope

 

timeBodyGyroscopeMag.std..The standard deviation of the measurement of magnitude
as measured by the gyroscope

 

timeBodyGyroscopeJerkMag.mean..The mean of the measurement of magnitude of Jerk
signals as measured by the gyroscope

 

timeBodyGyroscopeJerkMag.std..The standard deviation of the measurement of
magnitude of Jerk signals as measured by the gyroscope

 

frequencyBodyAccelerometer.mean…X, Y, Z ('-XYZ' is used to denote 3-axial
signals in the X, Y and Z directions) The mean of the frequency for all axis as
measured by the accelerometer.

 

frequencyBodyAccelerometer.std…X, Y, Z:The standard deviation of the frequency
for all axis as measured by the accelerometer

 

frequencyBodyAccelerometer.meanFreq…X, Y, Z:The actual mean frequency for all
axis as measured by the accelerometer.

 

frequencyBodyAccelerometerJerk.mean…X, Y, Z:The actual mean frequency for all
axis as measured by the accelerometer and Jerk signals.

 

frequencyBodyAccelerometerJerk.std…X, Y, Z:The actual standard deviation of
frequency for all axis as measured by the accelerometer and Jerk signals.

 

frequencyBodyAccelerometerJerk.meanFreq…X, Y, Z: The measurement of the mean
frequency of Jerk signals as measured by the accelerometer

 

frequencyBodyGyroscope.mean…X, Y, Z:The measurement of the mean frequency as
measured by the gyroscope

 

frequencyBodyGyroscope.std…X, Y, Z:The measurement of the standard deviation of
the frequency as measured by the gyroscope

 

frequencyBodyGyroscope.meanFreq…X, Y, Z: The measurement for the body angular
velocity of the mean frequency as measured by the gyroscope

 

frequencyBodyAccelerometerMag.mean..The magnitude of the mean frequency for the
body angular velocity

 

frequencyBodyAccelerometerMag.std..The magnitude of the standard deviation of
frequency for the body angular velocity

 

frequencyBodyAccelerometerMag.meanFreq..The mean frequency as measured by the
magnitude of accelerometer frequency

 

frequencyBodyBodyAccelerometerJerkMag.mean..The mean frequency as measured by
the magnitude of Jerk body signals

 

frequencyBodyBodyAccelerometerJerkMag.std..The standard deviation of the
frequency as measured by the magnitude of Jerk body signals

 

frequencyBodyBodyAccelerometerJerkMag.meanFreq..The mean frequency of the
magnitude of Jerk signals as measured by the accelerometer.

 

frequencyBodyBodyGyroscopeMag.mean..The mean of the magnitude of the frequency
measurement as measured by the gyroscope

 

frequencyBodyBodyGyroscopeMag.std..The standard deviation of the magnitude of
the frequency measurement as measured by the gyroscope

 

frequencyBodyBodyGyroscopeMag.meanFreq.. The mean frequency as measured by the
gyroscope magnitude measurement

 

frequencyBodyBodyGyroscopeJerkMag.mean..The mean of the magnitude of the
frequency as measured by the Jerk signals derived from the gyroscope

 

frequencyBodyBodyGyroscopeJerkMag.std..The standard deviation of the magnitude
of the frequency as measured by the Jerk signals derived from the gyroscope

 

frequencyBodyBodyGyroscopeJerkMag.meanFreq..the mean frequency of the Jerk
signal magnitude as measured by the gyroscope.

 
