
The script run_analysis.R performs the 5 procedures requested in the course project.

Files are read using read.table() funtion.
Data is merged with rbind() function.
Desired columns (mean and standard deviation measures) are taken from the whole dataset and named according to features.txt.
Activities are named from activity_labels.txt.
Column names are corrected.
ddply() from the plyr package is used to apply colMeans().
A new dataset with all the average measures is generated and called tidydata.txt.

Variables

xTrain, yTrain, xTest, yTest, subTrain and subTest contain the data from files.
X, Y and subjectdata merge previous datasets.
feat contains the correct names for X, which are applied to column names in Wantedcolumns vector (used to extract the desired data).
Workdata merges X, Y and subjectdata.
tidydata contains the means to be stored as .txt file. 
