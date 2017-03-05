#read profile
library(dplyr)
refine<-read.csv('refine_original.csv')
refine_df<-tbl_df(refine)
View(refine_df)
glimpse(refine_df)

#seperate the code and name 
library(stringr)
product_code_name<-str_split_fixed(refine_df$Product.code...number, "-", 2)
refine_df['Product.code']<-product_code_name[,1]
refine_df['product_number']<-product_code_name[,2]

#add categories
refine_df$prodcut_category[refine_df$Product.code=='x']<-'Laptop'
refine_df$prodcut_category[refine_df$Product.code=='p']<-'Smartphone'
refine_df$prodcut_category[refine_df$Product.code=='v']<-'TV'
refine_df$prodcut_category[refine_df$Product.code=='q']<-'Tablet' 

#Add full address for geocoding
refine_df$full_address = paste (refine_df$address,refine_df$city,refine_df$country, sep = ", ", collapse = NULL)



