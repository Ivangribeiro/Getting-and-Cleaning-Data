# JHU - Getting and Cleaning Data Course Project
# Ivan Gonçalves Ribeiro

#loading packages
library(plyr)

# Reading files
feat <- read.table("features.txt", header=FALSE)
actlabels <- read.table('./activity_labels.txt',header=FALSE)
subTrain <- read.table('./train/subject_train.txt',header=FALSE)
xTrain <- read.table('./train/x_train.txt',header=FALSE)
yTrain <- read.table('./train/y_train.txt',header=FALSE)
subTest <- read.table('./test/subject_test.txt',header=FALSE)
xTest <- read.table('./test/x_test.txt',header=FALSE)
yTest <- read.table('./test/y_test.txt',header=FALSE)

## 1. Merge the training and the test sets to create one data set.

X <- rbind(xTrain, xTest)
Y <- rbind(yTrain, yTest)
subjectdata <- rbind(subTrain, subTest)

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# Geting mean and std columns
Wantedcolumns <- grep("-(mean|std)\\(\\)", feat[, 2])

# subseting X
X <- X [, Wantedcolumns]

# Naming Columns in X
names(X) <- feat[Wantedcolumns, 2]

## 3. Use descriptive activity names to name the activities in the data set

# Naming Activities
Y[, 1] <- actlabels[Y[, 1], 2]
names(Y) <- "activity"

## 4. Appropriately label the data set with descriptive activity names. 

# correct column name
names(subjectdata) <- "subject"

# Merging all data
Workdata <- cbind(X, Y, subjectdata)

# Rearranging Workdata
Workdata <- Workdata[c(68,67,1:66)]

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

#Getting means
tidydata <- ddply(Workdata, .(subject, activity), function(x) colMeans(x[, 3:68]))

#Writing File
write.table(tidydata, "tidydata.txt", row.name=FALSE)
