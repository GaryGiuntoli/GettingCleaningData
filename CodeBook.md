### CodeBook: GettingCleaningData
<p>
The project collects information from 3 sets of files, merges them, and finally saves results as a csv text file.
The R script file is named run_analysis.R.</p>

<p>Witin the assignment instructions, the data is collected from the accelerometers from the 
Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: </p>

<p>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones </p>

<p>The data for the project was retrieved from: </p>

<p>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </p>

## Data placement

The data from the zip file has the following layout: getdata-projectfiles-UCI HAR Dataset.zip\UCI HAR Dataset.  Copy the folders and the data from the folder UCI HAR Dataset, to a sub-folder
of your working directory named data.

This for example would be c:\your working folder\data.

## Dataset

# activity_labels.txt

<li>
<p>The activities are:</p>

<pre><code>1 walking
2 walkingupstairs
3 walkingdownstairs
4 sitting
5 standing
6 laying
</code></pre>
</li>

# features.txt

<p>There are 560 features in the test.  They are labeled in the manner shown below for the first few.  The R function was designed to only use those that had the characters mean or std in the name.  As a result, the actual count of features is 66</p>

<li>
<p>Sample features:</p>
<pre><code>1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
7 tBodyAcc-mad()-X
8 tBodyAcc-mad()-Y
9 tBodyAcc-mad()-Z
10 tBodyAcc-max()-X
11 tBodyAcc-max()-Y
12 tBodyAcc-max()-Z
</pre></code></li>

<p>To successfully run a SQLite statement, dashes and parenthesis were removed.  tBodyAcc-mean()-X
 was changed to tBodyAccmeanX
.</p>

# Data sets and labels

<li>
<p>Folder/File</p>
<pre><code>1 train/X_train.txt: Training set.
2 train/y_train.txt: Training labels.
3 test/X_test.txt: Test set.
4 test/y_test.txt: Test labels.
</pre></code>
</li>

<p></p>
<p>
The following file is available in both of the train and test data folders. Their descriptions are equivalent. 
<li>
train/subject_train.txt'
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
</li>
<p>The R script as a last step, creates the file final_data_averages.txt, which is placed in the ./data folder.

