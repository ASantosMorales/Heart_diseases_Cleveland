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

#************************************************************
# Sumary data

summary(data)

#************************************************************
# Correlation matriz (Pearson correlation coefficient)
correlation <- cor(data)

