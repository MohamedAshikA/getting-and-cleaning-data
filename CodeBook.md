# Human Activity Recognition Using Smartphones Data Set
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) 
while carrying a waist-mounted smartphone with embedded inertial sensors.

## Description of the database
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Description Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerometer-XYZ and TimeGyroscope-XYZ. 
These time domain signals (Time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 
3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then
separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, 
TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrecuencyBodyAcc-XYZ, FrecuencyBodyAccJerk-XYZ, FrecuencyBodyGyro-XYZ,
FrecuencyBodyAccelerometerJerkMag, FrecuencyBodyGyroscopeMag, FrecuencyBodyGyroscopeJerkMag. 'Frecuency' to indicate frequency domain signals. 

These signals were used to estimate variables of the feature vector for each pattern:'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
<ul>
<li>TimeBodyAccelerometer(XYZ)</li>
<li>TimeGravityAccelerometer(XYZ)</li>
<li>TimeBodyAccJerk(XYZ)</li>
<li>TimeBodyGyroscope(XYZ)</li>
<li>TimeBodyGyroscopeJerk(XYZ)</li>
<li>TimeBodyAccMagnitude</li>
<li>TimeGravityAccMagnitude</li>
<li>TimeBodyAccelerometerJerkMagnitude</li>
<li>TimeBodyGyroscopeMagnitude</li>
<li>TimeBodyGyroscopeJerkMagnitude</li>
<li>FrecuencyBodyAccelerometer(XYZ)</li>
<li>FrecuencyBodyAccelerometerJerk(XYZ)</li>
<li>FrecuencyBodyGyroscope(XYZ)</li>
<li>FrecuencyBodyAccelerometerMagnitude</li>
<li>FrecuencyBodyAccelerometerJerkMagnitude</li>
<li>FrecuencyBodyGyroscopeMagnitude</li>
<li>FrecuencyBodyGyroscopeJerkMagnitude</li>
</ul>
The set of variables that were estimated from these signals are: 
<ul>
<li>Mean: Mean value</li>
<li>std : Standard deviation</li>
</ul>

## Labels
Database contains two labels that indicate the subject and the activity that the subject performs
- Subject  : indicates the subject, the total number of subjects is 30
- Activity : indicates the activity are 6 activities
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING 


## R script(Run Analysis) 
The script cleans and orders the database store in the <code>Dataset</code> folder, which contains the raw data.

- The database files are downloaded with the <code>download.file</code> function, a temporary file is created that stores the <code>.zip</code> file. 
"unzip" allows us to extract the information from the temperal file and rename the folder as <code>Dataset</code>
- The files <code>X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt, subject_test.txt, features.txt, 
activity_labels.txt</code> are read. Containing the data and labels of the characteristics.
- The train and test data are joined, and the variables are named, and the values of some data are changed.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- The names of the features are changed with the help of the <code>gsub</code> function, for better compression.
- The data is averaged and ordered with respect to the subject and activity, and are stored in <code>Tidy_Data.txt"</code>
- <code>Data.txt</code> contains the data before being averaged and sorted.
