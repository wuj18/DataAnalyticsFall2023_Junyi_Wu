# Conditional Inference Tree for Mileage
fit2M <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
summary(fit2M)
# plot tree
plot(fit2M, uniform=TRUE, main="CI Tree Tree for Mileage ")
plot(fit2M, main = "CI Tree for Mileage", type = "simple")
text(fit2M, use.n=TRUE, all=TRUE, cex=.8)

