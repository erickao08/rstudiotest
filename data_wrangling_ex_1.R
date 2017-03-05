#read profile
library(dplyr)
refine<-read.csv('refine_original.csv')
refine_df<-tbl_df(refine)
View(refine_df)
structure(refine_df)

#clean up the brand names

refine_df$company[refine_df$company %in% c('Phillips','phillips','phillipS','fillips','phlips','phllips','phillps')]<-'philips'
refine_df$company[refine_df$company %in% c('ak zo','AKZO','Akzo','akz0')]<-'akzo'
refine_df$company[refine_df$company %in% c('Van Houten','van Houten','Van Houten')]<-'van houten'
refine_df$company[refine_df$company %in% c('Unilever','unilver')]<-'unilever'

#seperate the code and name 
library(stringr)
product_code_name<-str_split_fixed(refine_df$Product.code...number,"-", 2)
refine_df['Product.code']<-product_code_name[,1]
refine_df['product_number']<-product_code_name[,2]

#add categories
refine_df$prodcut_category[refine_df$Product.code=='x']<-'Laptop'
refine_df$prodcut_category[refine_df$Product.code=='p']<-'Smartphone'
refine_df$prodcut_category[refine_df$Product.code=='v']<-'TV'
refine_df$prodcut_category[refine_df$Product.code=='q']<-'Tablet' 

#Add full address for geocoding
refine_df$full_address = paste (refine_df$address,refine_df$city,refine_df$country, sep = ", ", collapse = NULL)

#Add company column
refine_df$company_philips[refine_df$company=='philips']<-1
refine_df$company_philips[refine_df$company!='philips']<-0
refine_df$company_akzo[refine_df$company=='akzo']<-1
refine_df$company_akzo[refine_df$company!='akzo']<-0
refine_df$company_van_houten[refine_df$company=='van houten']<-1
refine_df$company_van_houten[refine_df$company!='van houten']<-0
refine_df$company_unilever[refine_df$company=='unilever']<-1
refine_df$company_unilever[refine_df$company!='unilever']<-0

#Add product column
refine_df$product_smartphone[refine_df$Product.code=='p']<-1
refine_df$product_smartphone[refine_df$Product.code!='p']<-0
refine_df$product_tv[refine_df$Product.code=='v']<-1
refine_df$product_tv[refine_df$Product.code!='v']<-0
refine_df$product_laptop[refine_df$Product.code=='x']<-1
refine_df$product_laptop[refine_df$Product.code!='x']<-0
refine_df$product_tablet[refine_df$Product.code=='q']<-1
refine_df$product_tablet[refine_df$Product.code!='q']<-0

