#Loading test data
X_test<-read.table("X_test.txt",sep="")
y_test<-read.table("y_test.txt",sep="")
subject_test<-read.table("subject_test.txt",sep="")
test.data.set<-cbind(subject_test,X_test,y_test)

#Loading training data
X_train<-read.table("X_train.txt",sep="")
y_train<-read.ta0ble("y_train.txt",sep="")
subject_train<-read.table("subject_train.txt",sep="")
train.data.set<-cbind(subject_train,X_train,y_train)

#Loading features data
features<-read.table("features.txt",sep="",stringsAsFactor=FALSE)

#Merging train and test datasets
data.set<-rbind(test.data.set,train.data.set)

#Naming data.set columns
names(data.set)[2:562]<-features[,2]
names(data.set)[1]<-"subject"
names(data.set)[563]<-"activity"

#Getting mean and standard deviation
tidy.data.set<-data.set[grepl("mean\\(\\)|std\\(\\)|meanFreq", colnames(data.set)) ]

#Adding and naming columns
tidy.data.set<-cbind(data.set[,1],data.set[,563],tidy.data.set)
names(tidy.data.set)[1]<-"subject"
names(tidy.data.set)[2]<-"activity"

#Loading activity label file
act_labels<-read.table("activity_labels.txt",sep="",stringsAsFactor=FALSE)

#Labeling activity column
tidy.data.set$activity <- factor(tidy.data.set$activity,
                                 levels = act_labels$V1,
                                 labels = act_labels$V2)
library(reshape2)

#Reshaping final tidy dataset
tidy.melt<-melt(tidy.data.set,id=c("subject","activity"),measure.vars=names(tidy.data.set[,3:ncol(tidy.data.set)]))
final.tidy.data<-dcast(tidy.melt,subject+activity~variable,mean)

write.table(final.tidy.data,file="tidyDataSet.txt",sep=" ",col.names=TRUE,row.names=FALSE)