rankhospital <- function(state, outcome, num = "best") {

 ## Read outcome data
 outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
 data_state<-outcome_data[, 'State'];
 num_state<-data_state==state
 names_hospital<-outcome_data[num_state,2];
 didvalue<-0;
 if (num=="best"){
     num=1;}

 ## Check that state and outcome are valid
 if (sum(num_state)==0){
    ## message("Error in best(", state,",", outcome,") : invalid state"); 
    stop("invalid state", call. = TRUE, domain = NULL)
 }
 
 if (outcome=="heart attack"){
     message("1");
     outcome_data[, 11]<- as.numeric(outcome_data[, 11]);
     x=na.omit(outcome_data[num_state,11]);
     postotal_min=which(x %in% sort(x)[1:num]) 
     pos<-postotal_min[num]
     didvalue<-1;}  
 
 if (outcome=="heart failure"){
     message("1");
     outcome_data[, 17]<- as.numeric(outcome_data[, 17])
     x=na.omit(outcome_data[num_state,17])
     mask=is.na(outcome_data[num_state,17])
     postotal_min=which(x %in% sort(x)[1:num]) 
     pos<-postotal_min[num]
     didvalue<-1;}  
 
 if (outcome=="pneumonia"){
     message("1");
     outcome_data[, 23]<- as.numeric(outcome_data[, 23]);
     x=na.omit(outcome_data[num_state,23]);
     postotal_min=which(x %in% sort(x)[1:num]) 
     pos<-postotal_min[num]
     didvalue<-1;}  


  if(didvalue==0){
    stop("invalid outcome", call. = TRUE, domain = NULL); }

 ## Return hospital name in that state with the given rank 30-day death rate
 y=names_hospital[mask]
 return(y[pos])
}