###################### INCLUDING VARIABLES IN DATASET ##########################

#--------------------- INCLUDING VARIABLES WITHOUT MUTATE ----------------------

# CREATING THE COMMISSION THROUGH SAMPLE WITHOUT MATUTE

commission_index <- 5:50
commission_useres <- sample((commission_index/100), size = 5,replace = FALSE)
users$commission <- commission_useres

#--------------------- CREATING PRICE AND COMISSION COLUMNS --------------------

# CREATING A NEW DATA SET

transactions_sellings <- transactions


# FOR : CREATING A COLUM FOR PRICE PRODUCT
  
  for (i in 1:nrow(transactions_sellings)) {
  
  # CREATING THE COLUM PRICE PRODUCT
  index_price_product <- transactions_sellings$productId[i] == products$productId
  transactions_sellings$priceProduct[i] <- products$price[index_price_product]  

  } 

# FOR : CREATINGA A COLUM FOR COMISSION 

for (i in 1:nrow(transactions_sellings)) {
  
  index_users <- transactions_sellings$userId[i] == users$userId
  sum_index_comission <- sum(index_comission)
  
  if(sum_index_comission == 0 | is.na(sum_index_comission)){
    
    transactions_sellings$userCommission[i] <- NA
    
  }else{
    
    transactions_sellings$userCommission[i] <- users$commission[index_comission]
    
  }
  
  
}


#------------ CREATING A COLUM WITH THE TOTAL SELLINGS AND COMISSION TOTAL------

transactions_sellings$totalSellings <- transactions_sellings$quantity*transactions_sellings$priceProduct


#--------------------------- CREATING SELLINGS FOR USERS ----------------------

for (i in 1:nrow(users)){
  
  index_selling_product <- users$userId[i] == transactions_sellings$userId

  users$totalSellings[i] <- sum(
                              transactions_sellings$totalSellings[index_selling_product],
                              na.rm = TRUE)

}

#--------------------- CREATING A COLUMN WITH TOTAL COMISSION -----------------

users$totalComission <- users$commission * users$totalSellings


# -------------------------- CREATING A NEW DATA SET---------------------------

# CREATING A DATA SET OF CALC'S

summarise_transactions <- transactions_sellings %>% summarise(
                                              sumTransactions = n(),
                                              sumTotalSellings = sum(totalSellings),
                                              sumTotalProducts = sum(quantity),
                                              maxPriceProduct = max(priceProduct),
                                              minPriceProduct = min(priceProduct),
                                              meanSellings = mean(totalSellings)
                                              )

#----------------------- CREATING SELLINGS FOR YEAR ---------------------------

# CREATING A NEW COLUMN : YEAR

data <- transactions_sellings$transactionDate
data <- as.Date(data)
year <- as.numeric(format(data, "%Y"))

transactions_sellings$transactionYear <- year

# CHANGING THE ORDER OF THE COLUMNS

transactions_sellings <- transactions_sellings[, c(1,2,8,3,4,5,6,7)]

# TAKING THE YEARS WITH NO DUPLICATES

yearSolo <- transactions_sellings$transactionYear[!duplicated(year)]

# MAKING THE COUNT BY YEAR

sellingByYear <- data.frame(yearSolo)

for (i in 1:nrow(sellingByYear)){
  
  index_selling_by_year <- sellingByYear$yearSolo[i] == transactions_sellings$transactionYear
  sellingByYear$Amount[i] <- sum(transactions_sellings$totalSellings[index_selling_by_year])
}

