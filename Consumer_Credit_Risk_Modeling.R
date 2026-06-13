credit <- read.csv("~/Downloads/credit-approval_cleaned_csv.csv")
table(credit$class)
set.seed(5623)
str(credit)
credit$class <- as.factor(credit$class)
rf <- randomForest(credit[,-11], credit[,11])
rf
varImpPlot(rf, sort = T, n.var=5, main = "variable importance")
set.seed(5623)
split <- sample.split(credit, SplitRatio = 0.7)
train <- subset(credit, split== TRUE)
test <- subset(credit, split==FALSE)
rf2 <- randomForest(class~., train)
rf2
rf2$confusion
p <- predict(rf2, train)
tab <- table(p, train$class)
sum(diag(tab)/sum(tab))

tune <- tuneRF(train[,-11], train[,11], 
               stepFactor = .5, #at each iteration, mtry is inflated or deflated by this
               plot = TRUE,
               ntreeTry = 300,
               trace = TRUE,
               improve = 0.05)

RF3 <- randomForest(class~., data=train,
                       ntree = 300,
                       mtry = 6,
                       importance = TRUE,
                       proximity = TRUE)
RF3
p3 <- predict(RF3, test)
tab3 <- table(p3, test$class)
sum(diag(tab3))/sum(tab3)
partialPlot(RF3, train, age, "approved")
partialPlot(RF3, train, debt , "approved")








