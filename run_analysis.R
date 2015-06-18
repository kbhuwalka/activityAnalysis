## This script assumes that the data set folder is the working directory

########################################
#Reading everything into variables
########################################

##Read all the data into the environment
test <- read.table("test/X_test.txt")
train <- read.table("train/X_train.txt")

#Reading the column names in from features.txt
cols <- read.delim("features.txt", header = FALSE)
colNames <- as.character(cols[, 1]) #Creates a character vector of all column names

#Reading the activity into the environment
testActivity <- read.table("test/Y_test.txt")
trainActivity <- read.table("train/Y_train.txt")

#Converting activity into a factor vector for main table
colActivity <- rbind(testActivity, trainActivity)
colActivity <- as.factor(colActivity[,1])
levels(colActivity) <- read.table("activity_labels.txt")[,2]

#Reading subject data into variables
testSubject <- read.table("test/subject_test.txt")
trainSubject <- read.table("train/subject_train.txt")

#Converting subject data into a factor vector
colSubject <- rbind(testSubject, trainSubject)
colSubject <- as.factor(colSubject[,1])


#######################################################
#Merging the training and test data set into one table
#######################################################

main <- rbind(test, train)

########################################
#Label the colums appropriately
########################################

names(main) <- colNames

##################################################################
#Extracting the measurements on the means and standard deviations
#Obtain 66 colums from 561 colums
##################################################################

main <- select( main, contains("mean()"), contains("std()") )

##########################################################
#Adding the activity and subject colums to the main table
##########################################################

main <- mutate(main, subject = colSubject, activity = colActivity)
#Group the rows by subject and then activity
main <- group_by(main, subject, activity)

########################################
#Creating a table with average of each variable 
#for each activity and for each subject
#This gives me a table with 68 columns
#66 colums + 2 for activity and subject
#and 180 rows for (30 subjects * 6 Activities)
########################################

summaryTable <- summarise_each(main, "mean")
write.table(summaryTable, "summary.txt", sep = "\t")