
#Step 0. Read the text files into R.
      #Read in the features file
      features <- read.table(file="./features.txt")
      
      #Read in the test data
      test.sub <- read.table(file="./test/subject_test.txt")
      names(test.sub) <- "subjectIdentifier"
      
      test.X <- read.table(file="./test/X_test.txt")
      names(test.X) <- make.names(features[,2], unique=TRUE)
      
      test.y <- read.table(file="./test/y_test.txt")
      names(test.y) <- "activity"
      
      #Read in the training data
      train.sub <- read.table(file="./train/subject_train.txt")
      names(train.sub) <- "subjectIdentifier"
      
      train.X <- read.table(file="./train/X_train.txt")
      names(train.X) <- make.names(features[,2], unique=TRUE)
      
      train.y <- read.table(file="./train/y_train.txt")
      names(train.y) <- "activity"

      #Select the indices of the features that have mean() and std() in the name
      mean.and.stdDev.features = features[grepl("\\-mean\\(\\)|\\-std\\(\\)",features[,2], perl=TRUE),1]

#Step 1. Merges the training and the test sets to create one data set.
#Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
oneDataSet <- rbind(data.frame(test.sub
                          ,test.X[,mean.and.stdDev.features] #only merge in the mean and std features
                          ,test.y)
                    ,data.frame(train.sub
                           ,train.X[,mean.and.stdDev.features] #only merge in the mean and std features
                           ,train.y))

#Read in the activity label file
activity.labels <- read.table(file="./activity_labels.txt")

#Step3. Uses descriptive activity names to name the activities in the data set
oneDataSet$activity <- activity.labels[oneDataSet$activity,2]

#Step4. Appropriately labels the data set with descriptive variable names. 
names(oneDataSet)[names(oneDataSet) == 'V2'] <- 'activityDescription'
names(oneDataSet)[names(oneDataSet) == 'tBodyAcc.mean...X'] <- 'timeDomainBodyAccelerometerMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAcc.mean...Y'] <- 'timeDomainBodyAccelerometerMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAcc.mean...Z'] <- 'timeDomainBodyAccelerometerMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAcc.std...X'] <- 'timeDomainBodyAccelerometerStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAcc.std...Y'] <- 'timeDomainBodyAccelerometerStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAcc.std...Z'] <- 'timeDomainBodyAccelerometerStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'tGravityAcc.mean...X'] <- 'timeDomainGravityAccelerometerMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'tGravityAcc.mean...Y'] <- 'timeDomainGravityAccelerometerMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'tGravityAcc.mean...Z'] <- 'timeDomainGravityAccelerometerMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'tGravityAcc.std...X'] <- 'timeDomainGravityAccelerometerStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'tGravityAcc.std...Y'] <- 'timeDomainGravityAccelerometerStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'tGravityAcc.std...Z'] <- 'timeDomainGravityAccelerometerStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerk.mean...X'] <- 'timeDomainBodyAccelerometerJerkMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerk.mean...Y'] <- 'timeDomainBodyAccelerometerJerkMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerk.mean...Z'] <- 'timeDomainBodyAccelerometerJerkMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerk.std...X'] <- 'timeDomainBodyAccelerometerJerkStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerk.std...Y'] <- 'timeDomainBodyAccelerometerJerkStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerk.std...Z'] <- 'timeDomainBodyAccelerometerJerkStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyro.mean...X'] <- 'timeDomainBodyGyroscopeMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyro.mean...Y'] <- 'timeDomainBodyGyroscopeMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyro.mean...Z'] <- 'timeDomainBodyGyroscopeMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyro.std...X'] <- 'timeDomainBodyGyroscopeStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyro.std...Y'] <- 'timeDomainBodyGyroscopeStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyro.std...Z'] <- 'timeDomainBodyGyroscopeStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerk.mean...X'] <- 'timeDomainBodyGyroscopeJerkMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerk.mean...Y'] <- 'timeDomainBodyGyroscopeJerkMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerk.mean...Z'] <- 'timeDomainBodyGyroscopeJerkMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerk.std...X'] <- 'timeDomainBodyGyroscopeJerkStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerk.std...Y'] <- 'timeDomainBodyGyroscopeJerkStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerk.std...Z'] <- 'timeDomainBodyGyroscopeJerkStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccMag.mean..'] <- 'timeDomainBodyAccelerometerMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccMag.std..'] <- 'timeDomainBodyAccelerometerMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tGravityAccMag.mean..'] <- 'timeDomainGravityAccelerometerMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tGravityAccMag.std..'] <- 'timeDomainGravityAccelerometerStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerkMag.mean..'] <- 'timeDomainBodyAccelerometerStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyAccJerkMag.std..'] <- 'timeDomainBodyAccelerometerStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroMag.mean..'] <- 'timeDomainBodyGyroscopeMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroMag.std..'] <- 'timeDomainBodyGyroscopeStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerkMag.mean..'] <- 'timeDomainBodyGyroscopeMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'tBodyGyroJerkMag.std..'] <- 'timeDomainBodyGyroscopeStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyAcc.mean...X'] <- 'freqDomainBodyAccelerometerMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAcc.mean...Y'] <- 'freqDomainBodyAccelerometerMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAcc.mean...Z'] <- 'freqDomainBodyAccelerometerMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAcc.std...X'] <- 'freqDomainBodyAccelerometerStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAcc.std...Y'] <- 'freqDomainBodyAccelerometerStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAcc.std...Z'] <- 'freqDomainBodyAccelerometerStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccJerk.mean...X'] <- 'freqDomainBodyAccelerometerMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccJerk.mean...Y'] <- 'freqDomainBodyAccelerometerMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccJerk.mean...Z'] <- 'freqDomainBodyAccelerometerMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccJerk.std...X'] <- 'freqDomainBodyAccelerometerStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccJerk.std...Y'] <- 'freqDomainBodyAccelerometerStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccJerk.std...Z'] <- 'freqDomainBodyAccelerometerStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyGyro.mean...X'] <- 'freqDomainBodyGyroscopeMeanXAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyGyro.mean...Y'] <- 'freqDomainBodyGyroscopeMeanYAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyGyro.mean...Z'] <- 'freqDomainBodyGyroscopeMeanZAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyGyro.std...X'] <- 'freqDomainBodyGyroscopeStdXAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyGyro.std...Y'] <- 'freqDomainBodyGyroscopeStdYAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyGyro.std...Z'] <- 'freqDomainBodyGyroscopeStdZAxis'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccMag.mean..'] <- 'freqDomainBodyAccelerometerMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyAccMag.std..'] <- 'freqDomainBodyAccelerometerStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyBodyAccJerkMag.mean..'] <- 'freqDomainBodyAccelerometerJerkMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyBodyAccJerkMag.std..'] <- 'freqDomainBodyAccelerometerJerkStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyBodyGyroMag.mean..'] <- 'freqDomainBodyGyroscopeMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyBodyGyroMag.std..'] <- 'freqDomainBodyGyroscopeStdMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyBodyGyroJerkMag.mean..'] <- 'freqDomainBodyGyroscopeJerkMeanMagnitude'
names(oneDataSet)[names(oneDataSet) == 'fBodyBodyGyroJerkMag.std..'] <- 'freqDomainBodyGyroscopeJerkStdMagnitude'

library(tidyr)
library(dplyr)

tidy <- tbl_df(oneDataSet)
gatherTidy <- gather(tidy, measurement, value, -subjectIdentifier,-activity)

#Step4(con't). Appropriately labels the data set with descriptive variable names.
groupTidy <- group_by(gathertidy,subjectIdentifier,activity,measurement)


#Step5. From the data set in step 4, creates a second, independent tidy data set
#       with the average of each variable for each activity and each subject.
summaryTidy <- summarize(groupTidy, value=mean(value))

summaryTidy
