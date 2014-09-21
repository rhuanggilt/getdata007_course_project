library(plyr)

## Step 1: exact column name of each feature
features <- read.table("./UCI HAR Dataset/features.txt", sep=" ", col.names=c("ColumnIndex", "ColumnName"),header=F, fill=FALSE, strip.white=TRUE)
colName <- features[,2]

## Step 2: get the activity label
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", sep=" ", col.names=c("ActivityID", "Activity"),header=F, fill=FALSE, strip.white=TRUE)


## Step 3: process test set
## Step 3.1: first get subject id from test data set
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="\t", col.names=c("SubjectID"), fill=FALSE, strip.white=TRUE)

## Step 3.2: merge activity id with label to get descriptive activty
test_activity_id <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="\t", col.names=c("ActivityID"), fill=FALSE, strip.white=TRUE)
test_activity_desc <- join(test_activity_id, activity_label,type="left", by = "ActivityID")

## Step 3.3: load test set measures
test_measure <- read.table(file="./UCI HAR Dataset/test/x_test.txt", header=F, sep = "", strip.white=TRUE, numerals = "no.loss", dec = ".")
colnames(test_measure) <- colName

## Step 3.4: filter columns to only mean and std
test1 <- test_measure[ , grepl( "mean()|std()" , names( test_measure ) ) ]
test2 <- test1[ , -grep( "meanFreq()" , names( test1 ) ) ]

## Step 3.5: final data set for test
test_set <- cbind(test_subject,test_activity_desc,test2)

## Step 4: processing training set

## Step 4.1: first get subject id from train data set
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="\t", col.names=c("SubjectID"), fill=FALSE, strip.white=TRUE)

## Step 4.2: merge activity id with label to get descriptive activty
train_activity_id <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="\t", col.names=c("ActivityID"), fill=FALSE, strip.white=TRUE)
train_activity_desc <- join(train_activity_id, activity_label,type="left", by = "ActivityID")

## Step 4.3: load train set measures
train_measure <- read.table(file="./UCI HAR Dataset/train/x_train.txt", header=F, sep = "", strip.white=TRUE, numerals = "no.loss", dec = ".")
colnames(train_measure) <- colName

## Step 4.4: filter columns to only mean and std
train1 <- train_measure[ , grepl( "mean()|std()" , names( train_measure ) ) ]
train2 <- train1[ , -grep( "meanFreq()" , names( train1 ) ) ]

## Step 4.5: final data set for train
train_set <- cbind(train_subject,train_activity_desc,train2)

## Step 5: merge train and test sets together, remove ActivityID
final_tidy <- merge(test_set[,-2], train_set[,-2], all = TRUE)

output <- aggregate(x = final_tidy[, 3:ncol(final_tidy)], by = list(ID = final_tidy$SubjectID,final_tidy$Activity), FUN = "mean", na.rm = T)

## Step 6: rename column name to make it more human-readable

names(output)[1] <- "SubjectID"
names(output)[2] <- "Activity"

colnames(output) <- sub("-mean(.).", "-Mean", colnames(output))
colnames(output) <- sub("-std(.).", "-Standard Deviation", colnames(output))
colnames(output) <- sub("^f", "Fast Fourier Transform-", colnames(output))
colnames(output) <- sub("BodyAcc", "Body Acceleration Signals", colnames(output))
colnames(output) <- sub("GravityAcc", "Gravity Acceleration Signals", colnames(output))
colnames(output) <- sub("Gyro", "-Gyroscope", colnames(output))
colnames(output) <- sub("Jerk", "-Jerk Singal", colnames(output))
colnames(output) <- sub("Mag", "-using Euclidean norm", colnames(output))

## Step 7: finally, export the final output to tidy.txt
write.table(output,file="./tidy.txt",row.name=FALSE)


