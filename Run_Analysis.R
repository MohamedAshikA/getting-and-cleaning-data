#Author = Felipe Arteaga Data
#load Libraries
library(data.table)
library(plyr)
library(dplyr)


# Download files from the dataset, create a temporary file and rename the folder 
# from "UCI HAR Dataset" to "Dataset"
if(!file.exists("Dataset")){
        # Temporal File ".zip"
        temp_File <- tempfile()
        fileURL   <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL,destfile= temp_File)
        unzip(zipfile = temp_File, exdir = getwd())
        
        # Delete and rename the folder dataset
        unlink(temp_File)
        file.rename("UCI HAR Dataset","Dataset")
}

# --------Direction of training and test files, and Features---------------
# Data Features
file_Features_Training     <- file.path("Dataset", "train", "X_train.txt")
file_Features_Test         <- file.path("Dataset", "test", "X_test.txt")
# Activities
file_Activities_Training   <- file.path("Dataset", "train", "y_train.txt")
file_Activities_Test       <- file.path("Dataset", "test", "y_test.txt")
# Subjects
file_Subjects_Training      <- file.path("Dataset","train","subject_train.txt")
file_Subjects_Test          <- file.path("Dataset","test","subject_test.txt")

#------------------Read files "TXT"-----------------------------------
# Data Features
data_Features_Training   <- read.table(file_Features_Training)
data_Features_Test       <- read.table(file_Features_Test)
# Activities
data_Activities_Training <- read.table(file_Activities_Training)
data_Activities_Test     <- read.table(file_Activities_Test)
# Subjects
data_Subjects_Trainig     <- read.table(file_Subjects_Training)
data_Subjects_Test        <- read.table(file_Subjects_Test)

# Names features and activities
names_Fearutes   <- read.table(file.path("Dataset", "features.txt"))
names_Activities <- read.table(file.path("Dataset", "activity_labels.txt"))

#-------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# Merges Features
DataFeatures <- rbind(data_Features_Training, data_Features_Test)
# Merges Activities
merge_Activity    <- rbind(data_Activities_Training, data_Activities_Test)
# Merge Subjects
merge_Subjects    <- rbind(data_Subjects_Trainig, data_Subjects_Test)
# Rename
names(merge_Subjects) <- "Subject"
names(merge_Activity) <- "Activity"

# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement.
ind_Mean_Std <- grep("(mean|std)\\(\\)",names_Fearutes$V2)
DataFeatures  <- DataFeatures[,ind_Mean_Std]
names(DataFeatures) <- names_Fearutes$V2[ind_Mean_Std]

# 3. Uses descriptive activity names to name the activities in the data set
merge_Activity$Activity <- factor(merge_Activity$Activity, 
                                  labels = names_Activities$V2 )

# Marge all date
All_Data <- cbind(DataFeatures, merge_Subjects, merge_Activity)

# 4. Appropriately labels the data set with descriptive variable names
names(All_Data) <- make.names(names(All_Data))
names(All_Data) <- gsub("std..","Std",names(All_Data))
names(All_Data) <- gsub("mean..","Mean",names(All_Data))
names(All_Data) <- gsub("^t","Time",names(All_Data))
names(All_Data) <- gsub("^f","Frecuency",names(All_Data))
names(All_Data) <- gsub("\\.","",names(All_Data))
names(All_Data) <- gsub("BodyBody","Body",names(All_Data))
names(All_Data) <- gsub("Acc","Accelerometer",names(All_Data))
names(All_Data) <- gsub("Gyro","Gyroscope",names(All_Data))
names(All_Data) <- gsub("Mag","Magnitude",names(All_Data)) 

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

Dity_Data <- aggregate(. ~Subject + Activity, All_Data, mean)
Dity_Data <- Dity_Data[order(Dity_Data$Subject,Dity_Data$Activity),]

write.table(Dity_Data, file = "Tidy_Fata.txt",row.name=FALSE)

