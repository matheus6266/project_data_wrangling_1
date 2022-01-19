



for (i in 1:nrow(transactions_teste)) {
  
  index_teste <- transactions_teste$productId[i] == products$productId
  transactions_teste$priceProduct[i] <- products$price[index_teste]
  
}
