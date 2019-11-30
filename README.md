# Classifying US Kickstarter Projects

To download the data:
````
# Raw dataset
install.packages("readr");
library(readr);
raw_data <- read_csv(url("https://raw.githubusercontent.com/segevm/Classifying-US-Kickstarter-Projects/master/datasets/ks-projects-201801.csv"));

# Cleaned dataset
cleaned_data <- readRDS(gzcon(url("https://raw.githubusercontent.com/segevm/Classifying-US-Kickstarter-Projects/master/datasets/cleaned_data.rds")));

````

