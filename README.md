Tidy Dataset created from the Human Activity Recognition Using Smartphones Dataset

The file original_dataset_README.txt describes the files in this repository
that belong to the HARUS dataset.

These are the new files that have been added:

- run_analysis.R: an R script that creates a tidy dataset from the HARUS dataset
- tidydata.txt: the new tidy dataset generated by run_analysis.R
- CodeBook.md: a code book that serves as a reference for the data in tidydata.txt

Description of run_analysis.R
-----------------------------

run_analysis.R combines and transforms the HARUS test and train datasets using
the following steps:

1. It reads in these files:
    - features.txt
    - test/X_test.txt
    - test/y_test.txt
    - test/subject_test.txt
    - train/X_train.txt
    - train/y_train.txt
    - train/subject_train.txt

2. It combines the train and test datasets in a row-wise fashion.

3. It labels the dataset with descriptive labels:
    - "Activity" for the type of activity
    - "Subject" for the human subject's unique id
    - column names on the X dataset using the names given
      in features.txt

4. It replaces the activity codes with descriptive names.

5. It selects the std() and mean() columns (specifically any column that
   matches the pattern "-std\\(\\)" or "-mean\\(\\)").

6. It combines the X, y, and subject datasets.

7. It averages the observations for each variable by activity and subject
   so that the final tidy dataset has a single row for each unique
   activity and subject combination. The variables in each column of a row
   are the average of all observations recorded for that unique activity
   and subject combination.

8. It writes the data to the file tidydata.txt using the write.table
   function with row.names=FALSE.