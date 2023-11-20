library(gdata) 
#faster xls reader but requires perl!
# bronx1<-read.xls(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheet=1,perl="<SOMEWHERE>/perl/bin/perl.exe") 
# bronx1<-bronx1[which(bronx1$GROSS.SQUARE.FEET!="0" & bronx1$LAND.SQUARE.FEET!="0" & bronx1$SALE.PRICE!="$0"),]

#alternate
install.packages("xlsx")
library_location <- find.package("xlsx")
print(library_location)
library('xlsx')
# library("xlsx", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
bronx1<-read.xlsx("C:/Users/wuj18/Desktop/da/lab/rollingsales_bronx.xls",pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)
View(bronx1)
#
attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
SALE.PRICE<-sub("\\$","",SALE.PRICE) 
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE)) 
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET)) 
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET)) 
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE)) 
#check for missing values
sum(is.na(log(SALE.PRICE)))
sum(is.na(log(GROSS.SQUARE.FEET)))
#check for NaN and inf values
sum(!is.finite(log(SALE.PRICE)))
sum(!is.finite(log(GROSS.SQUARE.FEET)))
#log of zero is undefined so we need to remove zero values
sum(SALE.PRICE == 0)
sum(GROSS.SQUARE.FEET == 0)
# remove zeros
filtered <- bronx1[bronx1$SALE.PRICE != 0 & bronx1$GROSS.SQUARE.FEET != 0, ]
sum(filtered$SALE.PRICE == 0)
sum(filtered$GROSS.SQUARE.FEET == 0)
View(filtered)
m1<-lm(log(SALE.PRICE)~log(GROSS.SQUARE.FEET), data = filtered)
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

# Model 2
filtered <- filtered[filtered$LAND.SQUARE.FEET != 0, ]
m2<-lm(log(SALE.PRICE)~log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD), data = filtered)
summary(m2)
plot(resid(m2))
# Suppress intercept - using "0+ ..."
m2a<-lm(log(SALE.PRICE)~0+log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD), data = filtered)
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(SALE.PRICE)~0+log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD)+factor(BUILDING.CLASS.CATEGORY),data = filtered)
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(SALE.PRICE)~0+log(GROSS.SQUARE.FEET)+log(LAND.SQUARE.FEET)+factor(NEIGHBORHOOD)*factor(BUILDING.CLASS.CATEGORY),data = filtered)
summary(m4)
plot(resid(m4))
#
