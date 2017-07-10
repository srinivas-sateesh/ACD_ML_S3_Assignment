rm(list=ls(all=TRUE))
setwd("D:/ACD_ML")

library(mlbench) #library with HouseVotes84 data set
library(klaR)
library(caret)
data(HouseVotes84)
sub<-sample(nrow(HouseVotes84),floor(nrow(HouseVotes84) * .9))
train <- HouseVotes84[sub,]
test <- HouseVotes84[-sub,]
xTrain <- train[,-1]
yTrain <- train$Class

xTest <- test[,-1]
yTest <- test$Class

model <- train(xTrain,yTrain,'nb',trcontrol = trainControl(method='cv',number=10))
confusion_matrix<-table(predict(model$finalModel,xTest)$class,yTest)
print(confusion_matrix)

