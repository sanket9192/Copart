require(xlsx)
'set working directory to load the database file'
setwd("C:/Users/Sanket Patel/Desktop/copart_challenge")
t=read.xlsx2("zip_code_database.xls", sheetName = "zip_code_database")
myinput="75252"
result = t[which(t$zip==myinput),]
output = paste(result$primary_city,result$state, sep=",")
output

#output variable prints City and State