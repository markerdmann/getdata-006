
# read the tables
features = read.table("features.txt")
X_test = read.table("test/X_test.txt")
y_test = read.table("test/y_test.txt")
subject_test = read.table("test/subject_test.txt")
X_train = read.table("train/X_train.txt")
y_train = read.table("train/y_train.txt")
subject_train = read.table("train/subject_train.txt")

# combine the train and test data
X_all = rbind(X_train, X_test)
y_all = rbind(y_train, y_test)
subject_all = rbind(subject_train, subject_test)

# label the data set with descriptive variable names
names(X_all) = features$V2
names(y_all) = c("Activity")
names(subject_all) = c("Subject")

# use descriptive activity names to name the activities in the data set
levels = c(1, 2, 3, 4, 5, 6)
labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
y_all[,"Activity"] = sapply(y_all$Activity, factor, levels=levels, labels=labels)

# create a vector of the std and mean column names
stdcolumns = which(grepl("-std\\(\\)", features$V2))
meancolumns = which(grepl("-mean\\(\\)", features$V2))
measure.columns = append(meancolumns, stdcolumns)
# sort after appending to retain the original ordering of the columns
measure.columns = sort(measure.columns)
# get the names of the columns so that we can pass them to the melt function below
measure.column.names = features[measure.columns, 2]

# combine the X, y, and subject data frames
all_data = cbind(X_all, y_all, subject_all)

# melt the data
dataMelt = melt(all_data, id=c("Subject", "Activity"), measure.vars=measure.column.names)

# get the averages
averages = ddply(dataMelt, .(Subject, Activity, variable), summarize, mean=mean(value))

# cast the molten data frame into our final output data frame
output = dcast(averages, Subject+Activity~variable, value.var="mean")

# write the output
write.table(output, file="tidydata.txt", row.name=FALSE)
