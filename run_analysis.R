## Load and reshape data for analysis; then print a calculated dataset

## Tidy Part 1
# Get feature names and subset to only those features of mean or std measures
feature.name <- read.table("UCI HAR Dataset/features.txt")
desired <- grep("std|mean",feature.name$V2)

## Tidy Part 2
# Get the train and test feature sets and subset only the desired features
train <- read.table("UCI HAR Dataset/train/X_train.txt")
desired.train <- train[,desired]
test <- read.table("UCI HAR Dataset/test/X_test.txt")
desired.test <- test[,desired]

## Tidy Part 3
# Combine the two datasets into 1
combined <- rbind(desired.train,desired.test)

## Tidy Part 4
# Attach column names to features
colnames(combined) <- feature.name[desired, 2]
combined

# Tidy Part 5
# Read and combine the train and test activity codes
train.acti <- read.table("UCI HAR Dataset/train/y_train.txt")
test.acti <- read.table("UCI HAR Dataset/test/y_test.txt")
total.acti <- rbind(train.acti,test.acti)

# Tidy Part 6
# Get activity labels and attach to activity codes
acti.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
total.acti$activity <- factor(total.acti$V1, levels = acti.labels$V1, labels = acti.labels$V2)

# Tidy Part 7
# Get and combine the train and test subject ids
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
total.subjects <- rbind(train.subjects, test.subjects)

# Tidy Part 8
# Combine and name subjects and activity names
subjects.and.activities <- cbind(total.subjects, total.acti$activity)
colnames(subjects.and.activities) <- c("subject.id", "activity")

# Tidy Part 9
# Combine with measures of interest for finished desired data frame
activity.frame <- cbind(subjects.and.activities, combined)

# Compute New Result
# From the set produced for analysis, compute and report means of 
# all measures, grouped by subject_id and by activity.
result.frame <- aggregate(activity.frame[,3:81], by = list(activity.frame$subject.id, activity.frame$activity), FUN = mean)
colnames(result.frame)[1:2] <- c("subject.id", "activity")
write.table(result.frame, file="mean_measures.txt", row.names = FALSE)