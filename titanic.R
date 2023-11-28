library(dplyr)
Titanic <- as.data.frame(Titanic)

library(rpart)
rpart_model <- rpart(Survived ~ ., data = Titanic)

plot(rpart_model)
text(rpart_model, use.n = TRUE)

library(party)
ctree_model <- ctree(Survived ~ ., data = Titanic)
plot(ctree_model)


Titanic$Sex <- as.numeric(factor(Titanic$Sex))
Titanic$Age <- as.numeric(factor(Titanic$Age))
Titanic$Survived <- as.numeric(factor(Titanic$Survived))
Titanic$Class <- as.numeric(factor(Titanic$Class))
Titanic$Freq <- as.numeric(Titanic$Freq)

Titanic <- scale(Titanic)


dist_matrix <- dist(Titanic) 
hclust_model <- hclust(dist_matrix)
plot(hclust_model)
