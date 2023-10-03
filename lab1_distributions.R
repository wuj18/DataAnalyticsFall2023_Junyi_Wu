#Cumulative Density Function
plot(ecdf(EPI_data$EPI), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(EPI_data$EPI); qqline(EPI_data$EPI)
#Simulated data from t-distribution:
#x <- rt(250, df = 5)
#qqnorm(x); qqline(x)
#Make a Q-Q plot against the generating distribution by: 
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

plot(ecdf(EPI_data$DALY), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(EPI_data$DALY); qqline(EPI_data$DALY)
#Simulated data from t-distribution:
#x <- rt(250, df = 5)
#qqnorm(x); qqline(x)
#Make a Q-Q plot against the generating distribution by: 
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

EPI_data$DALY

tf <- is.na(EPI_data$DALY)
EPI_data$DALY <- EPI_data$DALY[!tf] 
boxplot(EPI_data$EPI, EPI_data$DALY)
EPI_data$DALY

help(distributions)
# try different ones.....
