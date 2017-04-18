############################### Linear Regression Starter Script ############################

# Uses the lm() linear regressions modeling and ggplot to calculate & visualize correlation

# Begin by loading the data set and then choosing 2 or 3 variables to plug into the model

# Project Name:
# Data source:
# Correlation Variables:

############################################################################################

# begin by setting the working directory for the files
setwd("C:/Users/*********/Documents/R")

#Load the packages and libraries, or d/l any using install.packages("???")
library(dplyr)
library(magrittr)
library(tidyr)
library(readr)
library(stringr)
library(ggplot2)
library(gridExtra)
library(DescTools)
library(RDCOMClient)  # For importing specific cells of Excel files
library(gdata)  # for importing Excel files
library(GGally)
library(scales)
library(caret)

# Begin by loading in the dataset using the appropriate method, uncomment chosen method

#data1 <- file.choose() # Allows for manual selection from folder location, paired with below
  #data <- read_csv(data1)  # 
#data1 <- read_csv("file_name.csv") #loads in the CSV to a tibble, easier to work with
#data1 <- read.csv("file_name.csv")
#data1 <- read.csv("file_name.tsv", sep = "\t", header = TRUE)
#data1 <- read.xls("file_name.xlsx")
#data1 <- XLGetRange(sheet = "sheet1", range = "A1:B21", header = TRUE) #only used when Excel workbook is open

#View dataset
View(data1)

# View summary info on the dataset that was loaded in
names(data1)
head(data1)
str(data1)
summary(data1)

#For modeling, you will want to create a training and test data set
set.seed(1)      # setting the seed will allow you to adjust the random dataset in training, or keep the same data by changing seed #
in_train = createDataPartition(y = data1$var_1, p = 0.75, list = FALSE)    # Puts 75% of observations in the training dataset
head(in_train)    # row indices of observations in the training dataset

train = data1[in_train, ]
test = data1[-in_train, ]

dim(train)
dim(test)

#create the model...
