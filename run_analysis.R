library(dplyr)

#loading the data in the test directory
x_test <- read.table("./test/x_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

#loading the data in the train directory
x_train <- read.table("./train/x_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#loading the featurelabels
features <- read.table("./features.txt")

#use the featurelabels as column names of x_test and x_train
colnames(x_test) <- features$V2
colnames(x_train) <- features$V2

#applying column names to y_test, y_train, subject_test and subject_train
colnames(y_test) <- "activity"
colnames(y_train) <- "activity"
colnames(subject_test) <- "subject_id"
colnames(subject_train) <- "subject_id"

#creating vector with activity descriptions
activity <- c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")

#substitution of activity numbers with descriptions for y_test
y_test <- as.data.frame(lapply(y_test, function(x) gsub("1",activity[1],x)))
y_test <- as.data.frame(lapply(y_test, function(x) gsub("2",activity[2],x)))
y_test <- as.data.frame(lapply(y_test, function(x) gsub("3",activity[3],x)))
y_test <- as.data.frame(lapply(y_test, function(x) gsub("4",activity[4],x)))
y_test <- as.data.frame(lapply(y_test, function(x) gsub("5",activity[5],x)))
y_test <- as.data.frame(lapply(y_test, function(x) gsub("6",activity[6],x)))

#substitution of activity numbers with descriptions for y_train
y_train <- as.data.frame(lapply(y_train, function(x) gsub("1",activity[1],x)))
y_train <- as.data.frame(lapply(y_train, function(x) gsub("2",activity[2],x)))
y_train <- as.data.frame(lapply(y_train, function(x) gsub("3",activity[3],x)))
y_train <- as.data.frame(lapply(y_train, function(x) gsub("4",activity[4],x)))
y_train <- as.data.frame(lapply(y_train, function(x) gsub("5",activity[5],x)))
y_train <- as.data.frame(lapply(y_train, function(x) gsub("6",activity[6],x)))

#search pattern (sp) for measurements containg mean and standard deviation
sp <- grep ("mean\\(|std\\(", features$V2)


#extract measurements on the mean and standard deviation and
#combine the 'test' data
test <- cbind(subject_test,y_test,x_test[sp])

#extract measurements on the mean and standard deviation and
#combine the 'train' data
train <- cbind(subject_train, y_train,x_train[sp])

#merging the 'test' and 'train' data
alldata <- rbind(test,train)


#create a new data frame, df, for the tidy data set
#using the featurelabels as column names
#loop through all the activities in the merged data set, alldata
#for every subject the mean is taken of each variable
#the average values will then be added to data frame df

df <- as.data.frame(matrix(nrow=0, ncol=66),stringsAsFactors = FALSE)
colnames(df)<-  as.character(features$V2[sp])
for (x in activity){
  a <- filter(alldata, activity==x)
  for (id in 1:30){
    b <- filter(a, subject_id==id)
    c <- apply(b[,-(1:2)],2,mean)
    df <- rbind(df,c,stringsAsFactors=FALSE)
    colnames(df)<- as.character(features$V2[sp])
    rownames(df)[nrow(df)] <- paste("subject ", id," ",x)
  }
}

write.table(df, "run_analysis_tidy_data.txt",sep=",",row.names = FALSE)




  



