# Summarized HAR (Human Activity Recognition) Using Smartphones Dataset

## The experiment
The enclosed dataset represents the summarized outcome of an experiment
that have been carried out with a group of 30 volunteers wearing 
a smartphone (Samsung Galaxy S II) on the waist.

Each person performed six activities (walking, walking upstairs, 
walking downstairs, sitting, standing, laying) wearing a smartphone. 
Using embedded accelerometer and gyroscope of the smartphone, a set of
variables has been captured at a constant rate of 50Hz:

* 3-axial linear acceleration;
* 3-axial angular velocity.

The experiments have been video-recorded to label the data manually. 
The sensor signals (accelerometer and gyroscope) were pre-processed 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). 

The sensor acceleration signal, which has gravitational and body motion 
components, was separated using a low-pass filter into body acceleration 
and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables 
from the time and frequency domain. 

## The initial dataset of the experiment
The initial dataset contained the following information for each measurement:

* 3-axial acceleration from the accelerometer (total acceleration) 
and the estimated body acceleration;
* 3-axial angular velocity from the gyroscope;
* a 561-feature vector with time and frequency domain variables; 
* an identifier of the subject who carried out this particular session 
of the experiment; 
* a category of the activity (a label which was assigned manually) 
performed by the subject in this particular session.

The dataset has been randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data.

## Data transformation for the assignment
The following transformation then has been performed on the initial dataset,
according to the instructions:

1. the training and the test sets were merged into a single dataset;
2. only the measurements on the mean and standard deviation were extracted 
for each measurement, thus the amount of data was reduced to 66 time and 
frequency domain variables (out of total 561-feature vector); 
3. an independent, tidy dataset was created which contains the average 
of each variable for each activity and each subject (the initial data were
grouped by the activity & subject fields, and the mean values were computed).

## The resulting dataset for the assignment
The resulting dataset is a single text file named `result.txt`, which is 
a table that can be loaded into a data frame using the following R command: 
`read.table(resultFile, header = TRUE)`

Each row of the table contains one observation, and each column is a variable. 
The dataset follows the principles of *tidy data*, arranged into the wide 
format table, in accordance to the article by Hadley Wickham 
(https://www.jstatsoft.org/article/view/v059i10).

### The variables are:
**01 - Activity:** varchar(18). Lists the type of the experimental activity,
i.e. one of the following values: "WALKING", "WALKING_UPSTAIRS", 
"WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

**02 - Subject:** integer. Lists the identifier of the person who carried 
out the experiment, i.e. a number in range from 1 to 30.

**03-68 - the averages** (computed for the particular activity and the particular
subject) of every variable representing a mean or a standard deviation (std) 
of measurements in the initial dataset.
These variables are of type numeric (double), normalized and bounded within [-1,1].

      03 - tBodyAcc.mean.X
      04 - tBodyAcc.mean.Y
      05 - tBodyAcc.mean.Z
      06 - tBodyAcc.std.X
      07 - tBodyAcc.std.Y
      08 - tBodyAcc.std.Z
      09 - tGravityAcc.mean.X
      10 - tGravityAcc.mean.Y
      11 - tGravityAcc.mean.Z
      12 - tGravityAcc.std.X
      13 - tGravityAcc.std.Y
      14 - tGravityAcc.std.Z
      15 - tBodyAccJerk.mean.X
      16 - tBodyAccJerk.mean.Y
      17 - tBodyAccJerk.mean.Z
      18 - tBodyAccJerk.std.X
      19 - tBodyAccJerk.std.Y
      20 - tBodyAccJerk.std.Z
      21 - tBodyGyro.mean.X
      22 - tBodyGyro.mean.Y
      23 - tBodyGyro.mean.Z
      24 - tBodyGyro.std.X
      25 - tBodyGyro.std.Y
      26 - tBodyGyro.std.Z
      27 - tBodyGyroJerk.mean.X
      28 - tBodyGyroJerk.mean.Y
      29 - tBodyGyroJerk.mean.Z
      30 - tBodyGyroJerk.std.X
      31 - tBodyGyroJerk.std.Y
      32 - tBodyGyroJerk.std.Z
      33 - tBodyAccMag.mean
      34 - tBodyAccMag.std
      35 - tGravityAccMag.mean
      36 - tGravityAccMag.std
      37 - tBodyAccJerkMag.mean
      38 - tBodyAccJerkMag.std
      39 - tBodyGyroMag.mean
      40 - tBodyGyroMag.std
      41 - tBodyGyroJerkMag.mean
      42 - tBodyGyroJerkMag.std
      43 - fBodyAcc.mean.X
      44 - fBodyAcc.mean.Y
      45 - fBodyAcc.mean.Z
      46 - fBodyAcc.std.X
      47 - fBodyAcc.std.Y
      48 - fBodyAcc.std.Z
      49 - fBodyAccJerk.mean.X
      50 - fBodyAccJerk.mean.Y
      51 - fBodyAccJerk.mean.Z
      52 - fBodyAccJerk.std.X
      53 - fBodyAccJerk.std.Y
      54 - fBodyAccJerk.std.Z
      55 - fBodyGyro.mean.X
      56 - fBodyGyro.mean.Y
      57 - fBodyGyro.mean.Z
      58 - fBodyGyro.std.X
      59 - fBodyGyro.std.Y
      60 - fBodyGyro.std.Z
      61 - fBodyAccMag.mean
      62 - fBodyAccMag.std
      63 - fBodyBodyAccJerkMag.mean
      64 - fBodyBodyAccJerkMag.std
      65 - fBodyBodyGyroMag.mean
      66 - fBodyBodyGyroMag.std
      67 - fBodyBodyGyroJerkMag.mean
      68 - fBodyBodyGyroJerkMag.std

### Feature Selection and Meainig
The features selected for this database come from the accelerometer 
and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured 
at a constant rate of 50 Hz, then filtered to remove noise. 
The acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

From each signal, a pair of variables were estimated: 

- mean: Mean value;
- std: Standard deviation.


## For more information about the initial dataset: 
Contact activityrecognition@smartlab.ws

### License for the initial dataset:
Use of this dataset in publications must be acknowledged by referencing 
the following publication: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The dataset is distributed AS-IS and no responsibility implied or explicit 
can be addressed to the authors or their institutions for its use or misuse. 
Any commercial use is prohibited.
