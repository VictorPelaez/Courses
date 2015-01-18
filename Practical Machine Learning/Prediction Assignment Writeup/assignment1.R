
pml_assign <- function() {
    
    library(caret); library(rattle);
    library(rpart);library(rpart.plot);
    library(randomForest);
    ##training<-read.csv("./trainingdata.csv")
    ##testing_FINAL<-read.csv("./testingdata.csv")
    
    setwd("H:/Mis Documentos/github/Practical Machine Learning/Prediction Assignment Writeup")
    data <- read.table("pml-training.csv",header=T,sep=",")
    data_test <- read.table("pml-testing.csv",header=T,sep=",")   
 
    inTrain  <- createDataPartition(y=data$classe,p=0.6,list=FALSE);
    training <- data[inTrain,]
    testing  <- data[-inTrain,]
    
    cls_list <- lapply(data,class)
    cls_numeric <-which(cls_list=='numeric')
    M <-abs(cor(data[,cls_numeric]))
    diag(M)<-0
    which(M>0.8,arr.ind=T)
    
    ## Preprocesing data set
    #cls_listTrain <- lapply(training,class)
    #cls_numericTrain <-which(cls_listTrain=='numeric')
    #PTraining<- training[,cls_numericTrain]  #processed data training set
    
    PTraining<- training[,-c(1:7)]  #processed data training set
    indZV<-nearZeroVar(PTraining, saveMetrics=TRUE)
    PTraining<-PTraining[,!indZV$nzv]
    
    columnNumbersToRemove<-vector()
    vectorIndex<-0
    for(i in 1:ncol(PTraining)){
        if((sum(is.na(PTraining[,i]))/nrow(PTraining))>=0.60){
            vectorIndex<-vectorIndex+1
            columnNumbersToRemove[vectorIndex]<-i
        }
    }
    PTraining<-PTraining[,-columnNumbersToRemove]

    
    set.seed(123)
    modelFit <- train(classe ~. , data=PTraining, method='rpart')
    fancyRpartPlot(modelFit$finalModel)
    
    PTesting<-testing[colnames(PTraining)]
    predictionsDT <-predict(modelFit,newdata=PTesting)
    confusionMatrix(predictionsDT, PTesting$classe)
    
    
    modelFit_RF <- randomForest(classe ~. , data=PTraining)
    predictionsRF <- predict(modelFit_RF, PTesting, type = "class")

    
    
    #testing_FINAL
    variables2<-colnames(PTraining[,-53])
    finalTesting<-data_test[variables2]
    
    finalPredictionsDT<-predict(modelFit,finalTesting)
    #return(pred.finalPredictionsDT)
    
    finalPredictionsRF<-predict(modelFit_RF,finalTesting)
    return(finalPredictionsRF)
    

}