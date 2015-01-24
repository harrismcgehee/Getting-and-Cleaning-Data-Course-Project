# Getting-and-Cleaning-Data-Course-Project

The run_analysis.R script will create a tidy data set of the Human Activity Recognition Using Smartphones Dataset
Version 1.0 found at:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It will also create a second, independent tidy data set that creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script assumes that you have downloaded and extracted the zip file and placed the run_analysis.R script into the UCI HAR Dataset folder. It then assumes that you set the working directory to the folder where the script is located.
The script requires the tidyr and dplyr packages and all their dependcies to be installed in your R environment. It will load the packages, but it will not install them on your behalf. They can be downloaded from:       
  http://cran.r-project.org/web/packages/tidyr/
  http://cran.r-project.org/web/packages/dplyr/

The script 
0. Imports the dataset into R.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



Codebook:
subjectIdentifier:
    Unique identifier variable for each of the 30 subjects who carried out the experiment.
      (1-30)
      
activity:
    Activity that the subject performed while wearing a smartphone (Samsung Galaxy S II) on their waist
      (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

measurement:
The signals from the accelerometer or gyroscope of the phone on the subject's waist. 
All measurements are either a mean or standard deviation of signals collected and calculated as described below. The means have Mean in the column name and standard deviations have Std in the column name.
Then, the measurements were normalized and bounded within [-1,1], and therefore represent unit-less values. 

These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
'timeDomainBodyAccelerometerMeanXAxis'
'timeDomainBodyAccelerometerMeanYAxis'
'timeDomainBodyAccelerometerMeanZAxis'
'timeDomainBodyAccelerometerStdXAxis'
'timeDomainBodyAccelerometerStdYAxis'
'timeDomainBodyAccelerometerStdZAxis'
'timeDomainGravityAccelerometerMeanXAxis'
'timeDomainGravityAccelerometerMeanYAxis'
'timeDomainGravityAccelerometerMeanZAxis'
'timeDomainGravityAccelerometerStdXAxis'
'timeDomainGravityAccelerometerStdYAxis'
'timeDomainGravityAccelerometerStdZAxis'
'timeDomainBodyGyroscopeMeanXAxis'
'timeDomainBodyGyroscopeMeanYAxis'
'timeDomainBodyGyroscopeMeanZAxis'
'timeDomainBodyGyroscopeStdXAxis'
'timeDomainBodyGyroscopeStdYAxis'
'timeDomainBodyGyroscopeStdZAxis'


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. 
  'timeDomainBodyAccelerometerJerkMeanXAxis'
  'timeDomainBodyAccelerometerJerkMeanYAxis'
  'timeDomainBodyAccelerometerJerkMeanZAxis'
  'timeDomainBodyAccelerometerJerkStdXAxis'
  'timeDomainBodyAccelerometerJerkStdYAxis'
  'timeDomainBodyAccelerometerJerkStdZAxis'
  'timeDomainBodyGyroscopeJerkMeanXAxis'
  'timeDomainBodyGyroscopeJerkMeanYAxis'
  'timeDomainBodyGyroscopeJerkMeanZAxis'
  'timeDomainBodyGyroscopeJerkStdXAxis'
  'timeDomainBodyGyroscopeJerkStdYAxis'
  'timeDomainBodyGyroscopeJerkStdZAxis'

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 
  'timeDomainBodyAccelerometerMeanMagnitude'
  'timeDomainBodyAccelerometerMeanMagnitude'
  'timeDomainGravityAccelerometerMeanMagnitude'
  'timeDomainGravityAccelerometerStdMagnitude'
  'timeDomainBodyAccelerometerStdMagnitude'
  'timeDomainBodyAccelerometerStdMagnitude'
  'timeDomainBodyGyroscopeMeanMagnitude'
  'timeDomainBodyGyroscopeStdMagnitude'
  'timeDomainBodyGyroscopeMeanMagnitude'
  'timeDomainBodyGyroscopeStdMagnitude'    
    

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
  'freqDomainBodyAccelerometerMeanXAxis'
  'freqDomainBodyAccelerometerMeanYAxis'
  'freqDomainBodyAccelerometerMeanZAxis'
  'freqDomainBodyAccelerometerStdXAxis'
  'freqDomainBodyAccelerometerStdYAxis'
  'freqDomainBodyAccelerometerStdZAxis'
  'freqDomainBodyAccelerometerMeanXAxis'
  'freqDomainBodyAccelerometerMeanYAxis'
  'freqDomainBodyAccelerometerMeanZAxis'
  'freqDomainBodyAccelerometerStdXAxis'
  'freqDomainBodyAccelerometerStdYAxis'
  'freqDomainBodyAccelerometerStdZAxis'
  
  'freqDomainBodyGyroscopeMeanXAxis'
  'freqDomainBodyGyroscopeMeanYAxis'
  'freqDomainBodyGyroscopeMeanZAxis'
  'freqDomainBodyGyroscopeStdXAxis'
  'freqDomainBodyGyroscopeStdYAxis'
  'freqDomainBodyGyroscopeStdZAxis'
  
  'freqDomainBodyAccelerometerMeanMagnitude'
  'freqDomainBodyAccelerometerStdMagnitude'
  ‘freqDomainBodyGyroscopeMeanMagnitude'
  'freqDomainBodyGyroscopeStdMagnitude'
  
  'freqDomainBodyAccelerometerJerkMeanMagnitude'
  'freqDomainBodyAccelerometerJerkStdMagnitude'
  'freqDomainBodyGyroscopeJerkMeanMagnitude'
  ‘freqDomainBodyGyroscopeJerkStdMagnitude'


value:
  The mean of the measurement described in the measurement column for each subject and activity.
  (0,1)
