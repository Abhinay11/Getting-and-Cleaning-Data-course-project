# Transformation

The script `run_analysis.R` performs the following steps to get the tidy necessary data from the data dump provided.

* It first goes through the activity_labels.txt and reads the labels provided.
* Next it goes through the features file and stores the indices and also the names of features of every measurement related to mean and std. 
* Next it cleans up the features wanted to be properply formatted.
* Next step it goes through the datasets of train and test individually and loads the subject, activity, and measurements file. In case of measurements, it only takes the desired characteristics using the stored indices of the wanted features
* We bind the columns of subject, activity and the new measurements separately for train and test.Then we bind the rows of both train and test to get the combined data
* Next we name the combined data with the names "Subject", "Activity" and already stored wanted features names
* Right now, the activity values are ranged from 1 to 6. We change it to the desired factor values such as WALKING, SITTING etc. 
* Final step is to aggregate the combined data according to subject and activity and provide the average for each measurement and write this into a file called `tidydata.txt`

# Data

*The `tidydata.txt` contains all the needed measurements. The first row contains names of the the variables. The first two are subject and activity, and the next 79 are averages of the measurements of the combined data of train and test