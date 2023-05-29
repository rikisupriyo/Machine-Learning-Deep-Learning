#Simple Linear Regression

dataset = read.csv('Salary_Data.csv')

library(caTools)
set.seed(123)

#split the data
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#Fitting Simple Linear Regression to Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_Set)

#Prediction
y_pred = predict(regressor, newdata = testing_set)

#Visualization
library(ggplot2)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color='red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color='blue') +
  ggtitle('Salary vs. Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary') 

ggplot() +
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             color='red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color='blue') +
  ggtitle('Salary vs. Experience (Testing Set)') +
  xlab('Years of Experience') +
  ylab('Salary') 