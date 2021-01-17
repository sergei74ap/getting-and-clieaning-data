library(dplyr)
rm(list = ls())
dataDir <- "./data"
featFile <- paste(dataDir, "features.txt", sep ="/")
actFile <- paste(dataDir, "activity_labels.txt", sep = "/")
trainDir <- paste(dataDir, "train", sep = "/")
x_trainFile <- paste(trainDir, "X_train.txt", sep = "/")
y_trainFile <- paste(trainDir, "y_train.txt", sep = "/")
subj_trainFile <- paste(trainDir, "subject_train.txt", sep = "/")
testDir <- paste(dataDir, "test", sep = "/")
x_testFile <- paste(testDir, "X_test.txt", sep = "/")
y_testFile <- paste(testDir, "y_test.txt", sep = "/")
subj_testFile <- paste(testDir, "subject_test.txt", sep = "/")
resultFile <- paste(dataDir, "result.txt", sep = "/")

# read descriptive labels for activities & features from the source dataset
actNames <- read.table(actFile, header = FALSE)
names(actNames) <- c("ActId", "ActName")
featNames <- read.table(featFile, header = FALSE)
names(featNames) <- c("FeatureId", "FeatureName")

# load the test set
dfx_test <- read.table(x_testFile, header = FALSE)
dfy_test <- read.table(y_testFile, header = FALSE)
dfs_test <- read.table(subj_testFile, header = FALSE)
# merge the activity IDs, subject IDs, and features into one table (test set)
df_test <- cbind(dfy_test, dfs_test, dfx_test)
rm(dfy_test, dfs_test, dfx_test)

# load the training set
dfx_train <- read.table(x_trainFile, header = FALSE)
dfy_train <- read.table(y_trainFile, header = FALSE)
dfs_train <- read.table(subj_trainFile, header = FALSE)
# merge the subject IDs, activity IDs and features into one table (training set)
df_train <- cbind(dfy_train, dfs_train, dfx_train)
rm(dfy_train, dfs_train, dfx_train)

# merge both sets and assign descriptive names to all variables (Step_1, Step_4)
df_all <- rbind(df_train, df_test)
names(df_all) <- c("Activity", "Subject", featNames$FeatureName)
rm(df_test, df_train, featNames)

# select necessary columns, i.e. averages and std.deviations (Step_2)
df_all <- df_all[, c(1, 2, grep("mean\\(\\)|std\\(\\)", 
                                names(df_all), 
                                ignore.case = FALSE, 
                                value = FALSE))]

# substitute activity IDs with descriptive labels (Step_3)
# and simplify the measured variables' names (Step_4)
myData <- 
    as_tibble(df_all) %>%
    merge(actNames, by.x = "Activity", by.y = "ActId") %>%
    select(c(last_col(), 2, 3:last_col(1))) %>%
    rename(Activity = ActName) %>%
    rename_with(~ gsub("()", "", .x, fixed = TRUE))
rm(df_all, actNames)

# compute averages and create an independent dataset (Step_5)
myStats <- 
    myData %>% 
    group_by(Activity, Subject) %>% 
    summarize(across(everything(), mean))
write.table(myStats, file = resultFile, row.names = FALSE)
rm(myData, myStats)

# make sure the result output has been correctly written and can be loaded
newData <- read.table(resultFile, header = TRUE)
head(newData)
str(newData)
dim(newData)
unique(newData$Activity)
unique(newData$Subject)
