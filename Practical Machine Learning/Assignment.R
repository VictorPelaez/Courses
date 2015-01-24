
 pml_assign <- function() {
    
    library(caret); library(rattle);
    library(rpart);library(rpart.plot);
    library(randomForest);
    
    data <- read.table("./pml-training.csv",header=T,sep=",")
    data_test <- read.table("./pml-testing.csv",header=T,sep=",")   
 
    inTrain  <- createDataPartition(y=data$classe,p=0.6,list=FALSE);
    training <- data[inTrain,]
    testing  <- data[-inTrain,]
    
    ## Check correlation in data and check features
    cls_list <- lapply(data,class)
    cls_numeric <-which(cls_list=='numeric')
    M <-abs(cor(data[,cls_numeric]))
    diag(M)<-0
    which(M>0.8,arr.ind=T)
    
    ## Preprocesing data set
    PTraining<- training[,-c(1:7)]  #processed data training set
    indZV<-nearZeroVar(PTraining, saveMetrics=TRUE)
    PTraining<-PTraining[,!indZV$nzv]
    
    columnNumbersToRemove<-vector() #Empty vector
    Indx<-0
    for(i in 1:ncol(PTraining)){
        if((sum(is.na(PTraining[,i]))/nrow(PTraining))>=0.60){
            Indx<-Indx+1
            columnNumbersToRemove[Indx]<-i
        }
    }
    PTraining<-PTraining[,-columnNumbersToRemove]

    
    ## Set a seed and train a model
    set.seed(123)
    # Decision tree
    modelFit <- train(classe ~. , data=PTraining, method='rpart')
    fancyRpartPlot(modelFit$finalModel)
    
    PTesting<-testing[colnames(PTraining)]
    predictionsDT <-predict(modelFit,newdata=PTesting)
    confusionMatrix(predictionsDT, PTesting$classe)
    
    # RandomForest
    modelFit_RF <- randomForest(classe ~. , data=PTraining)
    predictionsRF <- predict(modelFit_RF, PTesting, type = "class")

    
    ## Testing with testing_FINAL data
    variables2<-colnames(PTraining[,-53])
    finalTesting<-data_test[variables2]
    
    finalPredictionsDT<-predict(modelFit,finalTesting)
    
    finalPredictionsRF<-predict(modelFit_RF,finalTesting)
    return(finalPredictionsRF)
    

}