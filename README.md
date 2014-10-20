### Introduction: GettingCleaningData

This repository is for the Coursera Course.  The project was to collect 
information from 3 sets of files, merge them, and finally to create results as a csv text file.
The R file is named run_analysis.R.

### Steps in the assignment

Data to be used was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
As a zip file, copy the files and folders starting from UCI HAR Dataset.  This would include the 4 files, and be the folders named test and train, 
and they should be copied to a sub-folder in your R working directory, named data.

The assignment is broken down into the following 5 sections.

1.  Data files from the training and the test sets are merged to create one data set.
2.  Only data columns of mean and standard deviation are to be used 
3.  A file is imported with the actual text description of the activites, and applied
4.  Descriptive variable names are applied as necessary
5.  A tidy data set with the average of each column is written out as a csv text file

The R code is broken down by Assignment number, then various steps are labeled.

<!-- -->

### Notes

In Assignment Part 1 - run_analysis.R
3 sets of files are read and merged.  It is indicated which section in R they are used.


In Assignment Part 2 - run_analysis.R
The file with the column names is read in
	data_column_names <-read.table("./data/features.txt")

The column numbers that have the text "mean" or "std" are selected with the following
	index_columns  <- grep("-mean\\(\\)|-std\\(\\)", ignore.case = TRUE, data_column_names[, 2])

X_data as first established in Assignment 1, it is over written with the following, just to have the columns 
that have the text "mean" or "std"
	X_data <- X_data[,index_columns]
	
Column names are added
names(X_data) <- data_column_names[index_columns, 2]

Because of using SQLite in assignment 4, could not figure out how to accept column names
with special characters, such as "-", "(" and ")".  So they were removed with the following
	names(X_data) <- gsub("\\(|\\)|\\-", "", names(X_data))
    

In Assignment Part 3 - run_analysis.R
The file ./data/activity_labels.txt was read to label the Y_data table.


In Assignment Part 4 - run_analysis.R
Combined the data from the 3 tables, using
	final_data <- cbind(subject_data, y_data, X_data)
	
	
In Assignment Part 5 - run_analysis.R
Constructed the query statement to use with SQLite
The column names created in Assignment part 2 and stored in data_column_names, are read and the query is created.
This shows only 1 of the 60+ columns, as the average to be calculated avg( tBodyAccmeanX ); and the following is the 
name the result column should have.

	select subject, activity   , avg( tBodyAccmeanX )  tBodyAccmeanX from final_data group by subject, activity
	
The results are stored in a text file, ./data/final_data_averages.txt
