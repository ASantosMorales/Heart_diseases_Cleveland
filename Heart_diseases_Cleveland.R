# cat("\014") -----> To clear Console
# rm(list = ls(all = TRUE)) -----> To clear All

# Read data and labeling
data <- read.csv("/home/a_santos/Documents/Research/Heart_diseases_Cleveland/Heart_diseases_Cleveland.data", header=FALSE, sep=",", na.strings = '?')
names(data) <- c("Age", "Sex", "Cp", "Trestbps", "Chol", "Fbs", "Restecg",
                 "Thalach","Exang", "Oldpeak","Slope", "Ca", "Thal", "Num")

# According with the Dataset description, values > 0 in the num column are positive cases
# of heart diseases. So, I will do this column logical;
# 1 -> positive case of heart disease
# 0 -> negative case of heart disease
data$Num[data$Num > 1] <- 1


#*************************Sumary data***************************
summary(data)
# All data are in the same order of magnitude, so, it is not necessary to rescale data


#********************Dispersion diagrams************************
pairs(~ Age + Sex + Cp + Trestbps + Chol + Fbs + Restecg + Thalach + 
        Exang + Oldpeak + Slope + Ca + Thal + Num, data = data)
#There is no suggestion of a linear relation between two variables


#***************Pearson correlation coefficient*****************
correlation <- cor(data)
# Replace the "NA" data by zero
correlation <- replace(correlation, is.na(correlation), 0)
# Plot Pearson correlation coefficient matrix
library(corrplot)
corrplot(correlation, method= "number", type = "upper", diag = FALSE)
# This analysis supports that there is no a linear relation between two variables

#***************************Histograms**************************
hist(data$Age)
hist(data$Sex)
hist(data$Cp)
hist(data$Chol)
hist(data$Fbs)
hist(data$Restecg)
hist(data$Thalach)
hist(data$Exang)
hist(data$Oldpeak)
hist(data$Slope)
hist(data$Ca)
hist(data$Thal)
hist(data$Num)


#*****************Logistic regression*************************
logistic_model = lm(formula = data$Num ~ data$Age + data$Sex + data$Cp + data$Trestbps
                     + data$Chol + data$Fbs + data$Restecg + data$Thalach + data$Exang
                     + data$Oldpeak + data$Slope + data$Ca + data$Thal + data$Num,
                     data = data, family = binomial)
print(summary(logistic_model))
# NOT FINISHED YET
# NOW, I'M WORKING IN THIS PROJECT
