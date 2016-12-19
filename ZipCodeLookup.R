require(xlsx)
#set working directory to load the database file
setwd("C:/Users/Sanket Patel/Desktop/copart_challenge")

#read the xls file and load it to the dataframe
t=read.xlsx2("zip_code_database.xls", sheetName = "zip_code_database")

#Assume the given input Zip code 
myinput="75252"

#Search the code from the zipcode column and save the data to a variable
result = t[which(t$zip==myinput),]

#Show the proper output as per the requirement
output = paste(result$primary_city,result$state, sep=",")
output

#output variable prints City and State
