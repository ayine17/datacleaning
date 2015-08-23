require("dplyr")
require("plyr")


#Merges the training and the test sets to create one data set.
#Uses descriptive activity names to name the activities in the data set

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("~/rprog_data_ProgAssignment3-data/Cleaning Data/UCI HAR Dataset")

train_subject <- read.table("train/subject_train.txt", header= FALSE)
test_subject <- read.table("test/subject_test.txt", header= FALSE)

train_X <- read.table("train/X_train.txt", header= FALSE)
test_X <- read.table("test/X_test.txt", header= FALSE)

train_y <- read.table("train/y_train.txt", header= FALSE)
test_y <- read.table("test/y_test.txt", header= FALSE)

combineX <- rbind(train_X,test_X)
combineX <- rbind(train_y,test_y)
activity_labels<-read.table("activity_labels.txt", header=FALSE)
activity <- merge(activity_labels,combineY)
subject <- rbind(train_subject,test_subject)
features <- read.table("features.txt",header= FALSE) 
colnames(combineX)<- tolower(features$V2)
colnames(activity) <-c("activity_labels","activitys")
colnames(subject) <- "subject"
#combin_features <- combineX[grepl("mean\\(\\)|std\\(\\)",names(combineX))]

#allcombined <- cbind(activity[2],subject,combin_features)

#Extracts only the measurements on the mean and standard deviation for each measurement. 

combin_features <- combineX[grepl("mean\\(\\)|std\\(\\)",names(combineX))]

  <- cbind(activity[2],subject,combin_features)

#Appropriately labels the data set with descriptive variable names. 

rename_allcombined<-gsub("Gyro", "gyroscope", names(allcombineddata))
rename_allcombined<-gsub("BodyBody", "body", rename_allcombined,ignore.case = TRUE)
rename_allcombined<-gsub("Mag", "magnitude", rename_allcombined,ignore.case = TRUE)
rename_allcombined<-gsub("^fbody", "freqbody", rename_allcombined,ignore.case = TRUE)
rename_allcombined<-gsub("tBody", "timebody", rename_allcombined,ignore.case = TRUE)
rename_allcombined<- gsub("-", "", rename_allcombined, ignore.case = TRUE)
rename_allcombined<- gsub("\\()", "", rename_allcombined, ignore.case = TRUE)

rename_allcombined<- gsub("\\)", "",
                rename_allcombined, ignore.case = TRUE)
rename_allcombined<- gsub("\\(", "",
                rename_allcombined, ignore.case = TRUE)

rename_allcombined<- gsub("^angleX,gravityMean", "gravityMeanangleX",rename_allcombined, ignore.case = TRUE)
rename_allcombined<- gsub("angleY,gravityMean", "gravityMeanangleY",
                          rename_allcombined, ignore.case = TRUE)
rename_allcombined<- gsub("angleZ,gravityMean", "gravityMeanangleZ",
                rename_allcombined, ignore.case = TRUE)
rename_allcombined<-gsub("Acc", "Accelerometer", rename_allcombined)

colnames(allcombineddata) <- rename_allcombined



#From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.

tidy_data<-aggregate(. ~subject + activitys, allcombineddata, mean)
tidy_data<-arrange(tidy_data, subject, activitys)

write.table(tidy_data, file = "tidydata.txt",row.name=FALSE)
