x <- as.Date("1970-02-03")

p <- as.POSIXct(x)

names(unclass(p))

m <- Sys.time()
m$sec
