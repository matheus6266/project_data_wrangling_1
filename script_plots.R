################################## CHARTS #####################################

#------------------------- CREATING COLUMNS CHART ------------------------------


# TOTAL SELLINGS BY USER


xUser <- users$user
yTotalSelling <- users$totalSellings

ggplot() +
  geom_col(aes(x = xUser, y = yTotalSelling ), fill = "orange") +
  labs(x = "User",
       y = "Total Sellings",
       title = "Total Sellings by User")

#  TOTAL SELLINGS BY YEAR

xYear <- sellingByYear$yearSolo
yAmount <- sellingByYear$Amount

ggplot()+
  geom_col(aes(x = xYear, y = yAmount), fill = "grey") +
  labs(x = "Year",
       y = "Amount",
       title = "Total Sellings by Year")
