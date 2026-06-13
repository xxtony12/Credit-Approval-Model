# Consumer Credit Approval Risk Modeling
# Random Forest Classification Model in R

library(randomForest)
library(caTools)

credit <- read.csv("credit-approval_cleaned_csv.csv")
credit$class <- as.factor(credit$class)

set.seed(5623)

split <- sample.split(credit$class, SplitRatio = 0.7)
train <- subset(credit, split == TRUE)
test  <- subset(credit, split == FALSE)

target_idx <- which(names(credit) == "class")

tuned_params <- tuneRF(
  x = train[, -target_idx],
  y = train[, target_idx],
  stepFactor = 0.5,
  plot = TRUE,
  ntreeTry = 300,
  trace = TRUE,
  improve = 0.05
)

credit_rf <- randomForest(
  class ~ .,
  data = train,
  ntree = 300,
  mtry = 6,
  importance = TRUE
)

test_predictions <- predict(credit_rf, test)
confusion_matrix <- table(Predicted = test_predictions, Actual = test$class)

accuracy_rate <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

print(confusion_matrix)
print(paste("Out-of-sample accuracy:", round(accuracy_rate, 4)))

varImpPlot(credit_rf, sort = TRUE, n.var = 5, main = "Top Credit Approval Drivers")
partialPlot(credit_rf, train, debt, "approved", main = "Effect of Debt on Approval Probability")
