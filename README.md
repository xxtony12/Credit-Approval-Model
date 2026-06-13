# Credit Approval Risk Modeling | R, Random Forest

Developed a credit approval classification model in R using Random Forest to analyze consumer application outcomes and identify key approval drivers.

The project includes train/test validation, model tuning, confusion matrix evaluation, variable importance analysis, and partial dependence analysis for credit-related features such as debt.

## Tools Used
- R
- randomForest
- caTools
- Classification Modeling
- Credit Risk Analytics
- Model Evaluation

## Business Objective
Support credit underwriting analysis by identifying variables associated with approval outcomes and evaluating model performance on unseen application data.

## Model Performance
- Out-of-sample accuracy: 86.1%
- Train/test split: 70/30
- Model: Random Forest classification
- Test set size: 208 records
- Correct predictions: 179 out of 208
- Top model drivers: Prior Default, Credit Score, Income, Years Employed, and Debt
  
## Key Features
- Train/test split
- Random Forest classification
- Hyperparameter tuning with tuneRF
- Confusion matrix evaluation
- Variable importance plot
- Partial dependence analysis
