One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Files included in this Repo**

- 'README.md'

- 'run_analysis.R': Script to create a tidy data set in R

- 'Codebook.md': Code Book explaining the variables, data, and transformations applied to clean up the data

- 'tidydata.md': The final tidy data set


**Steps Taken**

Getting the data into R

  - Download the file and put the file in the data folder
  
  - Unzip folder
  
Create data frame by combining different files

  - Read data from different files into R

Merge the training and the test sets to create one data set

Assign Variable names

Merge columns to get overall data frame

Extract only the mean and standard deviation measurements for each measurement

  - Subset Name of Features by measurements on the mean and standard deviation

  - Subset the data frame
  
Use descriptive activity names to name the activities in the data set
  
  - Read descriptive activity names from "activity_labels.txt"
  
  - Names the activities in the data set with the descriptive activities
  
Appropriately label the data set with descriptive variable names
  
Create a tidy data set 