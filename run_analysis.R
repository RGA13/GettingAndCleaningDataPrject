##################################################################################################
#  STEP 0: If Dataset file not present, downlowad and unzip Dataset
##################################################################################################
if(!file.exists("data.zip")) {
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl, "data.zip")
  unzip("data.zip")
}


##################################################################################################
#  STEP 1: Merge the training and the test sets to create one data set
##################################################################################################

# Set working directory and read files
setwd("./UCI HAR Dataset")
library(data.table)
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")
features <- read.table("features.txt", stringsAsFactors=FALSE)

# Combine train and test data frames and set variable names using content of features.txt
har <- rbind(train, test)
colnames(har) <- features[,2]

##################################################################################################
#  STEP 2: Extract only the measurements on the mean and standard deviation for each measurement 
##################################################################################################

# Create new data frame (harext) only with variable names referring to mean and standard deviation
# As per the features info ducument, I just include -mean() and -std() columns as being "only the measurements on the mean and standard deviation for each measurement"
colnames(har)
harext <- har[ , grep("mean\\(\\)|std\\(\\)", names(har))]
colnames(harext)

##################################################################################################
#  STEP 3: Use descriptive activity names to name the activities in the data set
##################################################################################################

# Read and combine training and test subject files
subtrain <- read.table("./train/subject_train.txt")
subtest <- read.table("./test/subject_test.txt")
subcomb <- rbind(subtrain, subtest)

# Read and combine training and test labels 
ytrain <- read.table("./train/y_train.txt")
ytest <- read.table("./test/y_test.txt")
ycomb <- rbind(ytrain, ytest)

# Add two new columns to data frame harext with Subjects and Activity Codes
harext$subject <- subcomb[,1]
harext$activity.code <- ycomb[,1]
colnames(harext)

# Read activity labels
activity_labels <- read.table("activity_labels.txt")

# Add new column to data frame harext with Activity Description 
harext$activity.desc <- activity_labels[harext[,"activity.code"], 2]

##################################################################################################
#  STEP 4: Appropriately label the data set with descriptive variable names following google's 
#  style guide: all lower case and words separated by '.'
##################################################################################################

# Clean and Standardize Variable names 
colnames(harext)
v1 <- make.names(colnames(harext), unique=TRUE, allow_=FALSE)
v2 <- sub(pattern="BodyBody", replacement="Body", v1)
v3 <- sub(pattern="\\.\\.\\.", replacement="\\.", v2)
v4 <- sub(pattern="\\.\\.", replacement="\\.", v3)
v5 <- gsub(pattern="([A-W])", replacement="\\.\\1", v4)
v6 <- tolower(v5)
v7 <- sub(pattern="mean\\.$", replacement="mean", v6)
v8 <- sub(pattern="std\\.$", replacement="std", v7)
v8
colnames(harext) <- v8

##########################################################################################################################
#  STEP 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
##########################################################################################################################

meacols <- colnames(harext)[1:66]
library(reshape2)
harextMelt <- melt(harext, id=c("subject","activity.desc"), measure.vars=meacols)
tidyds <- dcast(harextMelt, subject + activity.desc ~ variable, mean)

write.table(tidyds, file="../tidyds.txt", )
