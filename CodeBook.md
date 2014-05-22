Getting and Cleaning Data - Course Project Code Book
========================================================

A. Study Design
---------------

This document explains the content and the transformation performed to obtain the data set "tidyds.txt".

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


B. Variables in the produced tidy data set
------------------------------------------

The purpose of the project is to process the data above into a 'final' tidy data set of average values for each combination of subject and activity.

The data set provided for review is tab delimited and consists of 180 rows by 68 columns.

The 68 columns include the Subject number and Activity description as the first two columns, followed by 66 columns of sensor signals of averages for mean and standard deviations of various measurements, as listed below. The averages in the data set were built from the larger set of measurements noted in section A.

There are 66 columns of sensor data in the file created as columns with references to Mean or Std which were extracted from the 561 columns provided in the larger data set as per the project requirements.

The 68 columns are as follows:

- subject (a number 1-30, for each of the 30 Subjects)
- activity.desc (one of these 6 descriptions: "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")

3 through 68 are the measurements as follows:
- t.body.acc.mean.x
- t.body.acc.mean.y
- t.body.acc.mean.z
- t.body.acc.std.x
- t.body.acc.std.y
- t.body.acc.std.z
- t.gravity.acc.mean.x
- t.gravity.acc.mean.y
- t.gravity.acc.mean.z
- t.gravity.acc.std.x
- t.gravity.acc.std.y
- t.gravity.acc.std.z
- t.body.acc.jerk.mean.x
- t.body.acc.jerk.mean.y
- t.body.acc.jerk.mean.z
- t.body.acc.jerk.std.x
- t.body.acc.jerk.std.y
- t.body.acc.jerk.std.z    
- t.body.gyro.mean.x
- t.body.gyro.mean.y
- t.body.gyro.mean.z
- t.body.gyro.std.x
- t.body.gyro.std.y
- t.body.gyro.std.z
- t.body.gyro.jerk.mean.x
- t.body.gyro.jerk.mean.y
- t.body.gyro.jerk.mean.z
- t.body.gyro.jerk.std.x
- t.body.gyro.jerk.std.y
- t.body.gyro.jerk.std.z
- t.body.acc.mag.mean
- t.body.acc.mag.std
- t.gravity.acc.mag.mean
- t.gravity.acc.mag.std
- t.body.acc.jerk.mag.mean
- t.body.acc.jerk.mag.std
- t.body.gyro.mag.mean
- t.body.gyro.mag.std   
- t.body.gyro.jerk.mag.mean
- t.body.gyro.jerk.mag.std
- f.body.acc.mean.x
- f.body.acc.mean.y
- f.body.acc.mean.z
- f.body.acc.std.x
- f.body.acc.std.y
- f.body.acc.std.z
- f.body.acc.jerk.mean.x
- f.body.acc.jerk.mean.y
- f.body.acc.jerk.mean.z
- f.body.acc.jerk.std.x
- f.body.acc.jerk.std.y
- f.body.acc.jerk.std.z
- f.body.gyro.mean.x
- f.body.gyro.mean.y
- f.body.gyro.mean.z
- f.body.gyro.std.x
- f.body.gyro.std.y
- f.body.gyro.std.z
- f.body.acc.mag.mean
- f.body.acc.mag.std
- f.body.acc.jerk.mag.mean
- f.body.acc.jerk.mag.std
- f.body.gyro.mag.mean
- f.body.gyro.mag.std
- f.body.gyro.jerk.mag.mean
- f.body.gyro.jerk.mag.std 

Column names for columns 3-68 follow this convention:

- 'f' means Frequency domain signals via Fast Fourier Transformations
- 'body' means signals from the body, rather than from gravity
- 'gravity' means signals from gravity, rather than from the body
- 'gyro' means signals from the gyroscope
- 'acc' are signals from the accelerometer
- 'mag' is the magnitude of the signal
- 'jerk' means jerk signals
- 'mean' is the average
- 'std' is the standard deviation
- 'x' means in the x-axis
- 'y' means in the y-axis
- 'z' means in the z-axis

Note: Standardization of variable names was performed following google's style guide: all lower case and words separated by '.'.


C. Transformations
------------------

Activity is a mapping of values 1-6 to the "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying" list included above.

The numeric values in the 66 sensor columns are built using the 'mean' function on a larger set of data values, by Subject by Activity.

The original data set consists of 561 columns of data. This analysis is specifically on only data values of Mean and StandardDeviation (Std). This means the data was loaded as 561 columns but transformed via the script to 66 columns of Mean and Std data only, along with Subject and Activity for a total of 68 columns.

Column names for the measurements were constructed using the naming convention referred above.

The R script included performs the transformations described above to create the final data set. The code was created and executed to produce the file on a Windows 7 computer.
