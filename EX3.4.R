# Loading Packages 

library(data.table)
library(lubridate)
library(tidyverse)
library(esquisse)
library(plyr)
library(ggplot2)
library(cowplot)
library(naniar) #for NA exploration
library(sp) #spatial data
library(ggmap) #for map
library(osmdata) #openstreetmap
library(reshape2)

# EX 3.4 ------------

# Loading Data

Laptop_Sales_Data <- fread("DATA/LaptopSales_red.csv")

summary(Laptop_Sales_Data)

str(Laptop_Sales_Data)

gg_miss_var(Laptop_Sales_Data, show_pct = TRUE)

## a.Price Question ------------------

### i.

Retail_Price_and_Dates <- Laptop_Sales_Data[,.(Retail.Price,Date)][,Date:=mdy_hm(Date)]

str(Retail_Price_and_Dates)

Retail_Price_and_Dates <- na.omit(Retail_Price_and_Dates)

#### Histogram of the Retail Price of Computer In 2018

hist(Retail_Price_and_Dates$Retail.Price, main = "Histogram of the Retail Price of Computer In 2018", xlab = "Price", ylab = "Frequency", col = "#1c6155")

# Actual price
Max_Date_Retail <- max(Retail_Price_and_Dates$Date)

Actual_Price <- Retail_Price_and_Dates[Date %in% Max_Date_Retail, ]

Actual_Price

### ii.

Retail_Price_and_Dates_Month <- Retail_Price_and_Dates[, mean(Retail.Price), by = floor_date(Date,unit = "month")]
Retail_Price_and_Dates_Week <- Retail_Price_and_Dates[, mean(Retail.Price), by = floor_date(Date,unit = "week")]
Retail_Price_and_Dates_Day <- Retail_Price_and_Dates[, mean(Retail.Price), by = floor_date(Date,unit = "day")]

# Retail Price By Month
ggplot(Retail_Price_and_Dates_Month) +
 aes(x = floor_date, weight = V1) +
 geom_bar(fill = "#1c6155") +
 labs(x = "Month", 
 y = "Mean Price", title = "Retail Price of Computer", subtitle = "Aggregated By Month", caption = "LaptopSalesRed.csv") +
 theme_light()

# Retail Price By Week
ggplot(Retail_Price_and_Dates_Week) +
  aes(x = floor_date, weight = V1) +
  geom_bar(fill = "#1c6155") +
  labs(x = "Week", 
       y = "Mean Price", title = "Retail Price of Computer", subtitle = "Aggregated By Week", caption = "LaptopSalesRed.csv") +
  theme_light()

# Retail Price By Day
ggplot(Retail_Price_and_Dates_Day) +
  aes(x = floor_date, weight = V1) +
  geom_bar(fill = "#1c6155") +
  labs(x = "Day", 
       y = "Mean Price", title = "Retail Price of Computer", subtitle = "Aggregated By Day", caption = "LaptopSalesRed.csv") +
  theme_light()

### iii.



### iv.

## b.Location Questions ---------------

### i.

### ii.

### iii.

### iv.

## c.Revenue Questions ----------------

### i.

### ii.

## d.Configuration Questions ----------

### i.

### ii. 






