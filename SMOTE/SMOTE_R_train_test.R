library(DMwR)
#require(xgboost)
require(methods)

#setwd("D:\AA_YN\RH")
setwd("D:\jspjsp")
data_train = read.csv("lassoset4A_feature0.005.csv",header = F)
data_train$V1=factor(data_train$V1)
train_data_SMOTEdata <- SMOTE(V1~.,data_train,perc.over =100,perc.under=200)
jishu<-table(train_data_SMOTEdata$V1)


write.csv(train_data_SMOTEdata,file='SMOTE_set4_0.005.csv')



