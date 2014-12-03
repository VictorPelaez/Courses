corr <- function(directory, threshold=0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        dir<-getwd();

        Data_compl<-complete(directory);

        dir_new<-paste(dir,directory,sep='/');
        setwd(dir_new)
        tf=dir()
        
 	  
        criter<-Data_compl[,'nobs']>=threshold;
        id<-Data_compl[criter,'id']
        numfiles<-length(id);
        correlation=vector();
  
        if ( numfiles>0){      
           for (l in c(1:numfiles)){ 
              data <- read.table(tf[id[l]],header=T,sep=",")[ ,c('nitrate','sulfate')]
              var<-na.omit(data); 
              correlation<- c(correlation,cor(var[1],var[2]));
            }
        }

        setwd(dir)
        return(na.omit(correlation))

}