dir1 <- getwd()
setwd(dir1)
setwd("./UCI HAR Dataset")


#get activity labels
activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])


#get features and filter by the ones we want and tidy the names of features wanted
features <- as.character((read.table("features.txt"))$V2)
featuresWanted <- grep(".*mean.*|.*std.*", features)
featuresWantednames <- grep(".*mean.*|.*std.*", features,value=TRUE)
featuresWantednames<-gsub("^t", "Time", featuresWantednames)
featuresWantednames<-gsub("^f", "Frequency", featuresWantednames)
featuresWantednames<-gsub("Acc", "Accelerometer", featuresWantednames)
featuresWantednames<-gsub("Gyro", "Gyroscope", featuresWantednames)
featuresWantednames<-gsub("Mag", "Magnitude", featuresWantednames)
featuresWantednames<-gsub("BodyBody", "Body", featuresWantednames)
featuresWantednames<-gsub("mean()", "Mean", featuresWantednames)
featuresWantednames<-gsub("std()", "Std", featuresWantednames)

#Read train and test data and combine them

setwd(dir1)
setwd("./UCI HAR Dataset/train")

X_train <- read.table("X_train.txt")[featuresWanted]
y_train <- read.table("Y_train.txt")
subject_train <- read.table("subject_train.txt")
train <- cbind(subject_train, y_train, X_train)

setwd(dir1)
setwd("./UCI HAR Dataset/test")




X_test <- read.table("X_test.txt")[featuresWanted]
y_test <- read.table("Y_test.txt")
subject_test <- read.table("subject_test.txt")
test <- cbind(subject_test, y_test, X_test)
combineddata <- rbind(test,train)

#name the combined data
names(combineddata) <- c("Subject","Activity",featuresWantednames)
combineddata$Activity <- factor(combineddata$Activity,levels = activity_labels[,1],labels=activity_labels[,2])

#aggregate the combined data by subject and activity, and presenting the mean.
combineddata <- aggregate(. ~Subject + Activity, combineddata, mean)
setwd(dir1)
setwd("./UCI HAR Dataset")
#write the csv files as tidydata
write.table(combineddata, './tidydata.txt',row.names=FALSE)
setwd(dir1)





