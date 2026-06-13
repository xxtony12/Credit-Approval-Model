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

## Confusion Matrix
| Predicted / Actual | Denied (0) | Approved (1) |
|---|---:|---:|
| Denied (0) | 101 | 15 |
| Approved (1) | 14 | 78 |

## Key Model Drivers
The Random Forest model identified Prior Default, Credit Score, Income, Years Employed, and Debt as the strongest predictors of credit approval outcomes.

<img width="890" height="540" alt="output" src="https://github.com/user-attachments/assets/431f527f-d982-4343-9073-2cea98e37d06" />


## Debt Partial Dependence
The partial dependence plot shows how the model’s predicted approval probability changes as applicant debt levels vary.

<img width="839" height="540" alt="output(1)" src="https://github.com/user-attachments/assets/0bf4eeed-3065-4426-9345-b2c7d82b0a55" />


## Model Tuning
Hyperparameter tuning was performed using `tuneRF` to compare OOB error across different `mtry` values.

[Rplot.pdf](https://github.com/user-attachments/files/28906291/Rplot.pdf)

## Key Features
- Train/test split
- Random Forest classification
- Hyperparameter tuning with `tuneRF`
- Confusion matrix evaluation
- Variable importance plot
- Partial dependence analysis
