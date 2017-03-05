
library(dplyr)
refine<-read.csv('refine_original.csv')
refine_df<-tbl_df(refine)
View(refine_df)
glimpse(refine_df)


library(stringr)
product_code_name<-str_split_fixed(refine_df$Product.code...number, "-", 2)
refine_df['Product.code']<-product_code_name[,1]
refine_df['product_number']<-product_code_name[,2]
refine_df$prodcut_category[refine_df$Product.code=='x']<-'Laptop'
refine_df$prodcut_category[refine_df$Product.code=='p']<-'Smartphone'
refine_df$prodcut_category[refine_df$Product.code=='v']<-'TV'
refine_df$prodcut_category[refine_df$Product.code=='q']<-'Tablet'

p = Smartphone
v = TV
x = Laptop
q = Tablet