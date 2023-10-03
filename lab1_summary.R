EPI_data <- read.csv("C://Users//wuj18//Desktop//group1//2010EPI_data.csv")
#EPI = as.numeric(EPI_data[, c(14)])
#EPI
EPI_data
names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data
EPI_data <- EPI_data[-1, ]
View(EPI_data)
#EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
#EPI_data
EPI_data[ , 14] <- apply(EPI_data[ , 14,drop=F], 2,          
                            function(x) as.numeric(as.character(x)))
EPI_data[ , 17] <- apply(EPI_data[ , 14,drop=F], 2,          
                         function(x) as.numeric(as.character(x)))

summary(EPI_data$EPI) 	# stats
fivenum(EPI_data$EPI,na.rm=TRUE)
help(stem)
stem(EPI_data$EPI)		 # stem and leaf plot
help(hist)
hist(EPI_data$EPI)
hist(EPI_data$EPI, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(EPI_data$EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
help(rug)
rug(EPI_data$EPI) 

