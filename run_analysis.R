## Data was download and placed in the same folder as this R program

# Assignment Item 1. Merges the training and the test sets to create one data set.
# Merge training and test sets of X
# f1 and f2 are not used except in this step
f1 <- read.table("./data/train/X_train.txt")
f2 <- read.table("./data/test/X_test.txt")
X_data <- rbind(f1, f2)

# Used in Assignment 3
f1 <- read.table("./data/train/Y_train.txt")
f2 <- read.table("./data/test/Y_test.txt")
y_data <- rbind(f1, f2)

# Used in Assignment 4
f1 <- read.table("./data/train/subject_train.txt")
f2 <- read.table("./data/test/subject_test.txt")
subject_data <- rbind(f1, f2)

# End of Assignment Item 1

# Assignment Item 2. Extracts only the measurements on the mean and standard deviation for each measurement
# Step 1 read in data column names from text file
data_column_names <-read.table("./data/features.txt")

# Step 2 identify colmns labeled mean or std
# index_columns = column number as provided by the file - features.txt
# the \\ needed for parenthesis, fining text that has mean() or std() in it, excluding columns like <294 fBodyAcc-meanFreq()-X>
index_columns  <- grep("-mean\\(\\)|-std\\(\\)", ignore.case = TRUE, data_column_names[, 2])

# limit data reviewed to columns with avg or std as names
X_data <- X_data[,index_columns]
names(X_data) <- data_column_names[index_columns, 2]
names(X_data) <- gsub("\\(|\\)|\\-", "", names(X_data))
    
# End Assignment Item 2. 


# Assignment Item 3. Uses descriptive activity names to name the activities in the data set
# Step 1 Merge training and test sets of Y
#f1 <- read.table("./data/train/Y_train.txt")
#f2 <- read.table("./data/test/Y_test.txt")
#y_data <- rbind(f1, f2)

#Step 2 - Get labels
activity_labels <- read.table("./data/activity_labels.txt")
#Step 2 - match column 1 of y_data to column 2 of activity_labels
y_data[,1] = activity_labels[y_data[,1], 2]

#STEP 3 - Change column name
names(y_data) <- "activity"

# End Assignment Item 3. Uses descriptive activity names to name the activities in the data set


# Assignment Item 4.  Appropriately labels the data set with descriptive variable names. 

names(subject_data) <- "subject"
final_data <- cbind(subject_data, y_data, X_data)

# End Assignment Item 4


# Assignment Item 5.  From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject

library(sqldf)

# Build Column Names
# Don't know how to use column names in sql query when there are special characters, sunc as - ( )
# Don't include columns subject & activity, for building the query
data_column_names2 <- names(final_data[, 3:length(final_data)])
numCols <-  length(data_column_names2)

# Start query
query <- "select subject, activity  "
# add in column names
for (i in 1:numCols) {
    query <- paste(query, ", avg(", data_column_names2[i], ") ", data_column_names2[i])
}
# finsh query with from & group
query <- paste(query, " from final_data group by subject, activity")

write.table(sqldf(query), "./data/final_data_averages.txt", row.names = FALSE)


# End Assignment Item 5.  

