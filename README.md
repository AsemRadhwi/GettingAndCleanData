**General Information**
This repo contains the code to clean and tidy the data obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Running the script**
1. Create a folder, and download this script.
2. Download the archived dataset and extract to newly folder created in the previous step. The UCI HAR Dataset folder is extracted, and it has all the files in the required structure.
3. Run Rscript run_analysis.R
4. Two datasets should get created in the current directory as tidy_dataset.txt, and tidy_dataset_avgs.txt
5. Code book for the tidy dataset is available in the repo.

**Script Output**
Sample of the output from script is below:
```
[1] "Loading libraries: plyr, reshape2"
[1] "Loading the data labels and get the required labels"
[1] "Loading the training data"
[1] "Loading the testing data"
[1] "Subsetting to only the mean and standard deviation columns"
[1] "Merging all the data types for the training data"
[1] "Merging all the data types for the testing data"
[1] "Merge the training and testing data into one dataset"
[1] "Add an activity name for each record"
[1] "Create the tidy dataset, and save it locally"
[1] "Create the other dataset for the averages, and save it locally"
```