**Getting and Cleaning Data Course Project**

Data Collection

**Part 1** - Merge the Test and Train data sets to create one data set

Read in the 8 tables with the untidy data. 

- General Files: 
**features.txt**: Names of each variable captured for every observation
**activity_labels.txt**: Description of the activity and a unique integer indetifier for each activity.

- Test Data Set: 
**X_test.txt**: Measurements collected for each observations
**subject_test.txt**: Integer identifying the subject 
**y_test.txt**: Integer identifying the activity

- Train Data Set: 
**X_train.txt**: Measurements collected for each observations
**subject_train.txt**: Integer identifying the subject
**y_train.txt**: Integer identifyinh the activity

Merge training & testing data sets and add labels from activityLabels and features tables.

**Part 2** - Extract only the measurements on the mean and standard deviation

Use the grep function to extract column names so that only mean & standard deviation are shown

**Part 3** - Name activities using descriptive activity names

Merge the activities from activityLabels.txt to give more descriptive names

**Part 4** - Change column names to descriptive variable names

Use gsub function to improve the descriptions of the column names. 

- ^t = Time

- ^f = Frequency

- Acc = Acceleration

- Mag = Magnitude

- BodyBody = Body

- Gyro = Gyroscope

**Part 5** - Create new tidy data set with the average of each variable for each activity and subject

Take average of each variable for each activity & subject from our tidy data set.