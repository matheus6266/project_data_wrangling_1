############################# SCRIPT PRINCIPAL ################################

#------------------------- Installing the packs -------------------------------

install.packages("tidyverse")

#------------------------- Loading the packs -----------------------------------

# Tydeverses contains the package dplyr 
# Dplyr contain some functions comuns to manipulate datasets

library("tidyverse")

#------------------------ Loading the data sets --------------------------------

products <- read.csv("products.csv")
sessions <- read.csv("sessions.csv")
transactions <- read.csv("transactions.csv")
users <- read.csv("users.csv")

#------------------------- Visualization ---------------------------------------

# Shows the inteire dataset in a new window
View(products)

# Shows the top 5 elements in a data set
head(sessions, n = 5)

# Shows the structure of the data set
str(transactions)

# Similar to function str
glimpse(users)

# Shows the dimension of the data set
dim(products)

# Shows the names of the variables in data set
names(sessions)

