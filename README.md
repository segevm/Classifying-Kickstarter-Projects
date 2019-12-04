# Classifying US Kickstarter Projects

Project goal: To predict whether or not a Kickstarter project will be successful, and to determine which variables are most significant in determining a project’s success

To download the data:
````
# Raw dataset
install.packages("readr");
library(readr);
raw_data <- read_csv(url("https://raw.githubusercontent.com/segevm/Classifying-US-Kickstarter-Projects/master/datasets/ks-projects-201801.csv"));

# Cleaned dataset
cleaned_data <- readRDS(gzcon(url("https://raw.githubusercontent.com/segevm/Classifying-US-Kickstarter-Projects/master/datasets/cleaned_data.rds")));

````

Methods used:

* Logistic regression
* Neural networks
* K-nearest neighbors
* K-means clustering