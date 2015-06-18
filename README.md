# activityAnalysis
Human Activity Recognition Analysis

The run_analysis.R script performs the following operations in the specified sequence to prepare the data:
1.  Read the training and test data sets and put them in variables
2.  Read the variable names and extract suitable labels for columns
3.  Read the training and test activity and put them in variables
4.  Convert the activity information into factor with suitable labels
5.  Read subject data into variables
6.  Convert the subject data into a factor

After collecting the data, the following operations are performed to RESHAPE the data:
7.  Merge the training and test data sets.
8.  Label the columns appropriately using data from Step 2
9.  EXTRACT only those columns which contain either mean or standard deviation measurements.
10. Group the rows first by the subject and then by activity

This creates a tidy data set with all the observations in seperate rows and grouped properly.

Then, a new tidy data set is extracted from this data set which contains only the average of the rows for each subject and each activity
11. CREATE new data set based on the above conditions
12. WRITE the table into a file called "summary.txt"

