### CodeBook: GettingCleaningData

The project collects information from 3 sets of files, merges them, and finally saves results as a csv text file.
The R script file is named run_analysis.R.


In Assignment Part 1 - run_analysis.R
3 sets of files are read and merged.   The tables created are used in specified steps of the process.


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

