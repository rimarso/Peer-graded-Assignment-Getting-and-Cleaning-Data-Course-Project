## Codebook

In this file we explain the modifications that are executed in the script "run_anaysis.R", and present the variables.

1. In first place we took the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. We then unzip it with unzip() and store it in the folder "UCI HAR Dataset".

3. We rename datasets and their columns for coherence and pragmatism:

    - The file "features.txt" has the list of all features and become "features" dataframe and put names to the columns: "n" and "functions". (561 rows and 2 columns)
    - The "activity_labels.txt" links the class labels with their activity name, and becomes "activities" and we assign column names: "code" and "activity". (6 rows and 2 columns)
    - The "subject_test.txt" identifies the subject who performed the activity for each window sample. Its range is from 1 to 30, and it becomes "subject_test" dataframe with "subject" column name. (2947 rows and 1 column)
    - The "subject_train.txt" in wich each row identifies the subject who performed the activity for each window sample and its range is from 1 to 30, becomes "subject_train" and the column was renamed "subject". (7352 rows and 1 column)
    - The "X_test.txt", "X_train", "y_test" and "y_train" data sets becomes the "x_test", "x_train", "y_test" and "y_train" dataframes respectively. The columns are renamed with the features names and codes were it corresponds.

4. The next step is merging the datasets that contains labels with the datasets with the subjects and features for the purpose of creating one dataset. 

5. We then extract and keep the measures of the mean and standard deviation from the merged dataset. 

6. we label the data with the descriptive activity name.

7. Finally, we extract and create a final dataset called "Database" that contain the means and standard deviations from the features of the activities. 



