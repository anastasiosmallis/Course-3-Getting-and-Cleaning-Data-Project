# Course-3-Getting-and-Cleaning-Data-Project

###### The script in the repository named run_analysis.R works as follows.

1. Downloads the zip file containing all the data from the given link and stores it into the the working directory.
2. Unzips the zip file.
3. Reads the data as tables for both the test and train samples.
4. Also stores into tables into vectors the subject number of each observation and the code of the activity of each observation.
5. Binds the above data into two tables one for test and one for train data, now with the info for activity code and subject code for each observation.
6. Puts names for the columns in these dataframes.
7. Merges the training and the test sets to create one data set.
8. Extracts only the measurements on the mean and standard deviation for each measurement.
9. Replaces the activity codes with the activity names.
10. Creates a summary table using the ddply() function of the "plyr" library that shows the average value for each of the variables for each subject and activity.
11. Saves the summary table, created in the previous step, as a text file in the working directory with the name "summary_table.txt".