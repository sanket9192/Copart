# The core process in this assignment is to find the distance between two zip codes based on the langitudes and latitudes provided in the Dataset.
# Each row in The Dataset contains the information of Zipcodes in terms of City, States, Longitudes and Latitudes(Approximately).
# Using longitudes and latitudes we can calculate the approx distance between to zip codes using the Haversine formula (hf)
# FInd the minimum distance or the nearest facility from the customer zip code will be the given result.
# Have not considerd and inclusion exclusion rule because of the time constraint.
# Also it is made for one customer but can be done using vector of the cutomer IDs and postan code provided.

require(xlsx)
#'set working directory to load the database file'
setwd("C:/Users/Sanket Patel/Desktop/copart_challenge")

#read the xls file and load it to the dataframe
t=read.xlsx2("zip_code_database.xls", sheetName = "zip_code_database")

# Function that Calculates the geodesic distance between two points specified by radian latitude/longitude using the
# Haversine formula (hf)
gcd.hf <- function(long1, lat1, long2, lat2) {
  R <- 6371 # Earth mean radius [km]
  delta.long <- (long2 - long1)
  delta.lat <- (lat2 - lat1)
  a <- sin(delta.lat/2)^2 + cos(lat1) * cos(lat2) * sin(delta.long/2)^2
  c <- 2 * asin(min(1,sqrt(a)))
  d = R * c
  return(d) # Distance in km
}


#Assume that copart Facility is present at following location
# Took the sample of Approximate 100 rows from the dataset and considered as the COpart Facility location
set.seed(2)
Number = sample(1:nrow(t),nrow(t)/420)
copartLocationData = t[Number,]

#Assume that Customer 1 give this location. Took out the langitude and latitude to pass to the function.
myLocation="90210"
result = t[which(t$zip==myLocation),]
myLat=paste(result$latitude)
myLong=paste(result$longitude)

#Apply the function of calculating the distance from the longitude and latitude on the each copart facility data.
distance = mapply(gcd.hf,as.numeric(myLong),as.numeric(myLat),as.numeric(copartLocationData$longitude),as.numeric(copartLocationData$latitude));

#Append the result to the data.
copartLocationData$distance <- distance

#Find the minimum distance so that the suggestion can be made to the customer.
copartLocationData[which.min(copartLocationData$distance),c(2,3,6)]

# can be done on multiple customers to find the minimum distance of for all the customers and giving suggestions to them.
