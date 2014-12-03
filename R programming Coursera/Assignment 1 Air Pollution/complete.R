Ocomplete <- function(directory, id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        ## complete("specdata", 1:10)

        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        dir<-getwd();
        dir_new<-paste(dir,directory,sep='/');
        setwd(dir_new)

        tf=dir()[id]
	  nobs=vector();
        numfiles<-length(id);
	  

        for (l in c(1:numfiles)){  
           data <- read.table(tf[l],header=T,sep=",")[ ,c('nitrate','sulfate')]
           var<-na.omit(data); 
           nobs<- c(nobs,nrow(var));
         }

        d <- data.frame(id =id , nobs =nobs);

        setwd(dir)
        return(d)



}