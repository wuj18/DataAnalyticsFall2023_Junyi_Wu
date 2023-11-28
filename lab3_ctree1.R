require(rpart)
swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(swiss_rpart) # try some different plot options
text(swiss_rpart) # try some different text options

require(party)

treeSwiss<-ctree(Species ~ ., data=iris)
plot(treeSwiss)

cf <- cforest(Species ~ ., data=iris, controls=cforest_control(mtry=2, mincriterion=0))

treeFert<-ctree(Fertility ~ Agriculture + Education + Catholic, data = swiss)

cforest(Fertility ~ Agriculture + Education + Catholic, data = swiss, controls=cforest_control(mtry=2, mincriterion=0))
# look at help info, vary parameters.

library(tree)
tr <- tree(Species ~ ., data=iris)
tr
tr$frame
plot(tr)
text(tr)
#find "prettier" ways to plot the tree

install.packages("ggdendro")
library(ggdendro)
dendro_data <- dendro_data(tr)

# Plot using ggplot2
install.packages("ggplot2")
library(ggplot2)
ggplot(dendro_data$segments) +
  geom_segment(aes(x=x, y=y, xend=xend, yend=yend)) +
  geom_text(data=dendro_data$labels, aes(x=x, y=y, label=label), vjust=-0.5)
