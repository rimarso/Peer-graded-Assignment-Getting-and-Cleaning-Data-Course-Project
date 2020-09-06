## This is the README file for the COURSE PROJECT in GETTING AND CLEANING DATA COURSERA COURSE

- In first place, we have the "run_analysis.R" script that executes the process of tidying the datasets. 
    - This are the steps of that file:

1. We get the data from de the web. Then we unzip them. 

2. Then, we assign names to the datasets and the columns that we need.

3. We then append the files for an appropriate subject dataset, do the same for an activity dataset and then for the subject id dataset.

4. The next step is merging the datasets.

5. We then select with dplyr tools the variables that we need that contain the features that was asked.

6. We rename the variables in the preliminary dataset called "Datos".

7. Then we create a final dataset called "Database" that contain the average for each activity and each subject.

8. So the final dataset is contained in the file "Database.txt"

- We also have the file "CodeBook.md" that contain all the detailed variables of the "Database.txt" generated from the steps of the "run_analysis.R" script. 

