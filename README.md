# Final project for the Getting and Cleaning Data course


### 1. This repo includes the following files:

File name | Description
--- | --- |
`run_analysis.R` | a script I created in order to process the initial dataset of the HAR (Human Activity Recognition) experiment and transform the date into a new tidy, summarized dataset;
`result.txt` | the resulting dataset I obtained after transforming the initial dataset by the run_analysis.R script; 
`CodeBook.md` | a code book that describes and explains the dataset;
`README.md` | this file.



### 2. How 'run_analysis.R' script works:

#### The script performs the following transformation on the initial dataset, which is required for this project:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.

#### Considering step-by-step data processing sequence, the code does the following:

1. We prepare descriptive labels for activities and features, i.e. load them
from the source dataset (files 'activity_labels.txt' and 'features.txt');
2. We load the test set data, that is - feature vectors (x_test.txt), 
activity IDs (y_test.txt), subject IDs (subject_test.txt) from the folder
named "test" into data frames and then merge them into a single data frame
using `cbind()` command.
3. We then load the train data similarly, using the corresponding files from the
"train" folder.
4. Now we combine both the test and the train sets into a single data frame
using `rbind()` command. Then we assign meaningful, descriptive field names
to all variables of this data frame, including the feature names that we've
previously loaded (see step 1).
5. We subset the data frame in order to reduce the amount of data, since we only
need the measurements on the mean and std of each variable. We use `grep()`
function and a regular expressing to select columns with "mean()" or "std()" suffixes
in their names.
6. Now, we join our table with the previously loaded table of descriptive activity
labels (using `merge()` command), so we can substitute numerical activity IDs
with the text labes. We also simplify the variable names, so they do not contain
any characters, that can cause difficulties upon further processing, storing
and loading the dataset, e.g. "()" and "-" symbols. This is done using `gsub()`
command.
7. Finally, we create a separate dataset to summarize our data and compute
averages for each variable for each combination of Activity and Subject (person).
This is done by applying `group_by()` and `summarize()` commands.
This summarized dataset is then stored into a text file by `write.table()` command.

NOTE: The code for the steps 6 & 7 utilizes the `dplyr` package, since its data
manipulation tools are very helpful for cleaning, rearranging and summarizing.


### 3. What's in the 'result.txt' dataset:
Please make sure you have read the `CodeBook.md` file for a complete explanation on the dataset.

Using R programming language, you can run the following command in order to load the data into a data frame: 

`read.table(resultFile, header = TRUE)`



### 4. Where to find the latest version of the data and the script:
All above-mentioned files can be downloaded from my GitHub repository:<br>
https://github.com/sergei74ap/getting-and-clieaning-data
