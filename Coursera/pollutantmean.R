pollutantmean <- function(directory, pollutant, id=1:332) {
 
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## source("pollutantmean.R")
        ## pollutantmean("specdata", "sulfate", 1:10)

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)

         dir<-getwd();
         dir_new<-paste(dir,directory,sep='/');
         setwd(dir_new)

         tf=dir()[id]
	   var_ac=vector();
         numfiles<-length(id);
         for (l in c(1:numfiles)){  
           data <- read.table(tf[l],header=T,sep=",")[ ,pollutant]
           var<-na.exclude(data); 
           var_ac<-c(var_ac,var)
         }
         
         setwd(dir)
         return(mean(var_ac))

}