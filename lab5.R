# Cook's Distance'example using mtcars
mtcars
head(mtcars)
str(mtcars)
model1 <- lm(mpg ~ cyl + wt , data = mtcars)
model1
plot(model1, pch = 18, col= 'red', which = c(4))
# we can use the cooks.distance() function to identify the Cook's distance to each observation
cooks.distance(model1)
CooksDistance <- cooks.distance(model1)
sort(round(CooksDistance, 5))


library(ISLR)
head(Hitters)
dim(Hitters)
is.na(Hitters) # check for the missing values.
#Now we will remove the NA (missing values) using the na.ommit function
HittersData <- na.omit(Hitters)
dim(HittersData) # checking the dimensions after removing the NAs.
glimpse(HittersData)
head(HittersData)
# Now we will implement a multivariate regression model using all the features in the dataset to 
# predict the salary of the Baseball player
SalaryPredictModel1 <- lm(Salary ~., data = HittersData)
summary(SalaryPredictModel1)
# Multiple R-squared: 0.5461. Adiusted R-squared: 0.5106

cooksD <- cooks.distance(SalaryPredictModel1)
influential <- cooksD[(cooksD > (3 * mean(cooksD, na.rm = TRUE)))]
influential
#We see that 18 players have a Cook's Distance greater than 3x the mean.
# Let's exclude these 18 players and rerun the model to see if we have a better fit in our regression model
names_of_influential <- names(influential) # checking the names of the influential/outlier playersnames_of_influential
outliers <- HittersData[names_of_influential,]
Hitters_Without_Outliers <- HittersData %>% anti_join(outliers)
#Model 2: without the outliers
SalaryPredictModel2 <- lm(Salary ~.,data = Hitters_Without_Outliers)
summary(SalaryPredictModel2)
#Multiple R-squared: 0.6721， Adjusted R-squared: 0.6445
# We have improved from an Adiusted R-Squared of 05106 to 0.6445 with the removal of only 18 observations

# Normality Tests...
# Normal Distribution
set.seed(10)
data1 <- rnorm(50)
set.seed(30)
data2 <- rnorm(50)
# Shapiro-Wilk Normality Test
# As the test returns a p-value less than 0.05, we reject the null hypothesis
# and conclude that the population data is not normally distributed.
shapiro.test(data1)
hist(data1,col='green')# the histogram shows that the curve is mildly left skewed in nature
shapiro.test(data2)
# As the test returns a p-value greater than 0.05, we accept the null hypothesis
# and conclude that the population data is normally distributed.
hist(data2, col='steelblue') # the histogram shows that the curve is normally distributed in nature


set.seed(0)
# Poisson Distribution
help("rpois")
#create dataset of 100 random values generated from a Poisson distribution
data <- rpois(n=100,lambda=3)
shapiro.test(data)
# The p-value of the test turns out to be 0.0003393.
# Since this value is less than 0.05, we have sufficient evidence
# to say that the sample data does not come from a population that is normally distributed.
# This result shouldn't be surprising since we generated the sample data using the rpois() function,
# rpois() generates random values from a Poisson distribution.
hist(data, col='yellow')# We can see that the distribution is right-skewed and doesn't have the typical “bell-shape”
# Histogram matches the results of the Shapiro-Wilk test and confirms that our sample data does not come from a normal distribution.



