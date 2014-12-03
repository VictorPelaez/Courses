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

         rm(list = setdiff(ls(), lsf.str()))

         tf="001.csv";
         ## initial <- read.table(tf, nrows = 100)
         ## classes <- sapply(initial, class)
	   ## tabAll <- read.table(tf,colClasses = classes)
         print(pollutant)
	   data <- read.table(tf,header=T,sep=",")[ ,pollutant]

         ## ncol <- max(count.fields(tf, sep = ","));
         ## data_var<-str(data);
         ## var<-data$nitrate;
         q<-na.exclude (data) 
         mean(q)


	   ## data2<-read.table(tf,col.names = paste0("sulfate", seq_len(ncol)))
         ## var=data_var$pollutant;
         ## which (is.na(x)) # Which one is NA?
         ## read.csv(file = "result1", sep = " ")[ ,c('col1', 'col2')]


