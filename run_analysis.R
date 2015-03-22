# Load relevant libraries
library(plyr)
library(knitr)

# Getting the data into R

# Download the file and put the file in the data folder
setInternet2(TRUE)
if(!file.exists("./data")){dir.create("./data")}
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="./data/Dataset.zip")
  
  # Unzip file
  unzip(zipfile="./data/Dataset.zip",exdir="./data")
  
  # All files are in main folder UCI HAR Dataset
  path_rf <- file.path("./data" , "UCI HAR Dataset")
  files<-list.files(path_rf, recursive=TRUE)


# Create data frame by combining different files

  # Read data from different files into R
  dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
  dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
  dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
  dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
  dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
  dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

  # Merge the training and the test sets to create one data set
  dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
  dataActivity<- rbind(dataActivityTrain, dataActivityTest)
  dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

  # Assign Variable names
  names(dataSubject)<-c("subject")
  names(dataActivity)<- c("activity")
  dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
  names(dataFeatures)<- dataFeaturesNames$V2

  # Merge columns to get overall data frame
  dataCombine <- cbind(dataSubject, dataActivity)
  Data <- cbind(dataFeatures, dataCombine)

# Extract only the mean and standard deviation measurements for each measurement

  # Subset Name of Features by measurements on the mean and standard deviation
  subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
  
  # Subset the data frame
  selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
  Data<-subset(Data,select=selectedNames)

# Use descriptive activity names to name the activities in the data set

  # Read descriptive activity names from "activity_labels.txt"
  activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

  # Names the activities in the data set with the descriptive activities
  Data$activity<-factor(Data$activity);
  Data$activity<- factor(Data$activity,labels=as.character(activityLabels$V2))

# Appropriately label the data set with descriptive variable names
  names(Data)<-gsub("^t", "time", names(Data))
  names(Data)<-gsub("^f", "frequency", names(Data))
  names(Data)<-gsub("Acc", "Accelerometer", names(Data))
  names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
  names(Data)<-gsub("Mag", "Magnitude", names(Data))
  names(Data)<-gsub("BodyBody", "Body", names(Data))

# From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject

Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)