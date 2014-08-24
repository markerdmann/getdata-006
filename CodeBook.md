This file describes the data in tidydata.txt. The data has been derived from
the Human Activity Recognition Using Smartphones Dataset, and part of this 
codebook is borrowed from features_info.txt.

In tidydata.txt, all variables represent the average value for each unique
combination of subject and activity.

Columns
-------

Subject

    This is the unique identifier of the human subject who was wearing the smartphone.


Activity
    
    This is the name of the activity that the subject performed. It can have one of
    these six values:

        Walking
        Walking Upstairs
        Walking Downstairs
        Sitting
        Standing
        Laying

The remaining columns are derived from the HARUS dataset and are described below in a
modified excerpt from the HARUS features_info.txt file. The following transformations
were performed on the HARUS dataset:

- only the mean() and std() columns for each signal were retained
- the tidy data set only has one row for each unique Subject and Activity combination
- the value for each signal variable in a Subject-Activity row is the average
  of all observations for that unique Subject-Activity combination in the HARUS dataset


From features_info.txt
----------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

The column names in tidydata.txt all follow the same format. The name of the signal,
the type of variable estimated from the signal (mean or std), and, if applicable,
the X, Y, or Z axis are concatenated using hyphens. For example, the mean
of the body linear acceleration in the X axis has the column name:

    tBodyAcc-mean()-X

and the standard deviation of the Fast Fourier Transform of the magnitude of the
three-dimensional linear body acceleration has the column name:

    fBodyAccMag