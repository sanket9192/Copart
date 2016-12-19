require(xlsx)
'set working directory to load the database file'
setwd("C:/Users/Sanket Patel/Desktop/copart_challenge")
t=read.xlsx2("zip_code_database.xls", sheetName = "zip_code_database")

# Calculates the geodesic distance between two points specified by radian latitude/longitude using the
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
#Assume that copart is present at following location
set.seed(2)
Number = sample(1:nrow(t),nrow(t)/420)
copartLocationData = t[Number,]

#Customer 1 location
myLocation="90210"
result = t[which(t$zip==myLocation),]
myLat=paste(result$latitude)
myLong=paste(result$longitude)

distance = mapply(gcd.hf,as.numeric(myLong),as.numeric(myLat),as.numeric(copartLocationData$longitude),as.numeric(copartLocationData$latitude));
copartLocationData$distance <- distance
#gcd.hf(as.numeric(myLong),as.numeric(myLat),as.numeric(copartLong),as.numeric(copartLat))

copartLocationData[which.min(copartLocationData$distance),c(2,3,6)]

