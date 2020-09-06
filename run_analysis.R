#######################################################################################################################################
######################################################run_analysis script##############################################################
#######################################################################################################################################

###Loading the tidyverse library for manipulating data
library(tidyverse)
library(knitr) 
library(rmarkdown)
library(dataMaid)#With this library i can make a codebook

###Getting the data
nombrearchivo <- "Coursera_DS3_Final.zip"

###Checkin if file exists
if (!file.exists(nombrearchivo)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, nombrearchivo)
}  

###Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
    unzip(nombrearchivo) 
}

###Reading and assigning the data sets

## List of all features
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions")) 

## Links the class labels with their activity name.
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity")) 

## Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject") 

## Test set
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)

## Test labels
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

## Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

## Train set
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)

## Train labels
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

### Merging the data sets

## Merging the files for an appropriate subject dataset
DatSub <- rbind(x_train, x_test)

## Merging the files for an appropriate activity dataset
DatAct <- rbind(y_train, y_test)


## Merging the files for an appropriate subject id dataset
Subject <- rbind(subject_train, subject_test)

## Merged data of all the relevant datasets
MergData <- cbind(Subject, DatAct, DatSub)

## Keeping only the information that was asked for... mean and standard deviation
Datos <- MergData %>% select(subject, code, contains("mean"), contains("std"))

### Appropriately labels the data set with descriptive variable names

Datos$code <- activities[Datos$code, 2] 

###Labeling variables (features) with appropriate, convenient and understandable names 
names(Datos)[2] = "activity"
names(Datos)<-gsub("Acc", "Accelerometer", names(Datos))
names(Datos)<-gsub("Gyro", "Gyroscope", names(Datos))
names(Datos)<-gsub("BodyBody", "Body", names(Datos))
names(Datos)<-gsub("Mag", "Magnitude", names(Datos))
names(Datos)<-gsub("^t", "Time", names(Datos))
names(Datos)<-gsub("^f", "Frequency", names(Datos))
names(Datos)<-gsub("tBody", "TimeBody", names(Datos))
names(Datos)<-gsub("-mean()", "Mean", names(Datos), ignore.case = TRUE)
names(Datos)<-gsub("-std()", "STD", names(Datos), ignore.case = TRUE)
names(Datos)<-gsub("-freq()", "Frequency", names(Datos), ignore.case = TRUE)
names(Datos)<-gsub("angle", "Angle", names(Datos))
names(Datos)<-gsub("gravity", "Gravity", names(Datos))

###Creating our final database

Database <- Datos %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))

write.table(Database, "Database.txt", row.name=FALSE)

View(Database)

##Generating a codebook
#makeCodebook(Database)
