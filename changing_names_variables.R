##################### CHANGING THE NAME OF VARIABLES ##########################

#------------------- CHANGING THE NAME OF THE VARIABLES -----------------------

# FRIST FORM: USING A AUXILIARY VECTOR
# AND THE FUNCTION names

# CHANGING THE DATA SET "user"

new_names_users <- c("userId", "user", "gender", 
                     "registered", "cancelled")

names(users) <- new_names_users

# SECOND FORM: USING THE FUNCTION RENAME


# CHANGING THE DATA SER "products"

products <- rename(products,
                   productId = "ProductID",
                   product = "Product",
                   price = "Price")

# CHANGING THE DATA SET "products"


transactions <- rename(transactions,
                   transactionId = "TransactionID",
                   transactionDate = "TransactionDate",
                   userId = "UserID",
                   productId = "ProductID",
                   quantity = "Quantity")

# CHANGING THE DATA SET "sessions"
# USING THE OPERATOR %>%

sessions <- sessions %>% rename(sessionId = 1,
                                sessionDate = 2,
                                userId = 3)
