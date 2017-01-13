# Getting and Cleaning Data course project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This script `run_analysis.R` performs the following steps to get the tidy necessary data from the data dump provided.




This repository contains the following files:

* `README.md`, this file, which gives a summary of overview of what's present
* `tidydata.txt`, which contains the tidy data.
* `CodeBook.md` which briefly describes what data transformations are done from the raw files.
* `run_analysis.R` the script that's used for cleaning the data set.








* It first goes through the activity_labels.txt and reads the labels provided.
* Next it goes through the features file and stores the indices and also the names of features of every measurement related to mean and std. 
* Next it cleans up the features wanted to be properply formatted.
* Next step it goes through the datasets of train and test individually and loads the subject, activity, and measurements file. In case of measurements, it only takes the desired characteristics using the stored indices of the wanted features
* We bind the columns of subject, activity and the new measurements separately for train and test.Then we bind the rows of both train and test to get the combined data
* Next we name the combined data with the names "Subject", "Activity" and already stored wanted features names
* Right now, the activity values are ranged from 1 to 6. We change it to the desired factor values such as WALKING, SITTING etc. 
* Final step is to aggregate the combined data according to subject and activity and provide the average for each measurement and write this into a file called `tidydata.txt`

