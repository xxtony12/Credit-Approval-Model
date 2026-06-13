# =====================================================================
# CONSUMER CREDIT RISK: APPLICATION UNDERWRITING OPTIMIZATION
# =====================================================================
# Load mandatory enterprise dependencies
library(randomForest)
library(caTools)

# Import cleaned historical credit application records
credit <- read.csv("~/Downloads/credit-approval_cleaned_csv.csv")
credit$class <- as.factor(credit$class)

# Establish reproducible environment seed
set.seed(5623)

#Explicitly target the classification vector for stratified splitting
split <- sample.split(credit$class, SplitRatio = 0.7)
train <- subset(credit, split == TRUE)
test  <- subset(credit, split == FALSE)

# Isolate target indices (Assuming column 11 holds the label)
target_idx <- 11

# Run hyperparameter tuning grid search across mtry values
print("--- Initializing Automated mtry Hyperparameter Grid Search ---")
tuned_params <- tuneRF(
  x = train[, -target_idx], 
  y = train[, target_idx], 
  stepFactor = 0.5, 
  plot = TRUE,
  ntreeTry = 300,
  trace = TRUE,
  improve = 0.05
)

# Train finalized production model using optimal tuned parameters
optimized_rf <- randomForest(
  class ~ ., 
  data = train,
  ntree = 300,
  mtry = 6,
  importance = TRUE,
  proximity = TRUE
)

# Evaluate performance metrics against unseen validation data
test_predictions <- predict(optimized_rf, test)
confusion_matrix <- table(Predicted = test_predictions, Actual = test$class)

print("--- Out-of-Sample Performance Metrics ---")
print(confusion_matrix)
accuracy_rate <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Final Out-of-Sample Validation Accuracy:", round(accuracy_rate, 4)))

# Visualizing Credit Attribute Drivers via Risk Profiles
varImpPlot(optimized_rf, sort = TRUE, n.var = 5, main = "Top 5 Credit Risk Drivers")
partialPlot(optimized_rf, train, debt, "approved", main = "LTV & Debt Volatility Margin Response")
