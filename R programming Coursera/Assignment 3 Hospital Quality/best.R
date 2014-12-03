best <- function(state, outcome) {

## Read outcome data
 outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
 data_state<-outcome_data[, 'State'];
 num_state<-data_state==state
 names_hospital<-outcome_data[num_state,2];
 didvalue<-0;

## Check that state and outcome are valid
 if (sum(num_state)==0){
    ## message("Error in best(", state,",", outcome,") : invalid state"); 
    stop("invalid state", call. = TRUE, domain = NULL)
 }
 sum(num_state)

 ## "heart attack", "heart failure", or "pneumonia".

 if (outcome=="heart attack"){
    message("1");
    outcome_data[, 11]<- as.numeric(outcome_data[, 11]);
    pos<-which(outcome_data[num_state,11]==min(na.omit(outcome_data[num_state,11])));
    ##pos<-which.min(outcome_data[num_state,11]);
    didvalue<-1;}          
           
 if(outcome=="heart failure"){
    message("2");
    outcome_data[, 17]<- as.numeric(outcome_data[, 17]);
    pos<-which(outcome_data[num_state,17]==min(na.omit(outcome_data[num_state,17])));
    didvalue<-1;}  

 if(outcome=="pneumonia"){
    message("3");
    outcome_data[, 23]<- as.numeric(outcome_data[, 23]);
    pos<-which(outcome_data[num_state,23]==min(na.omit(outcome_data[num_state,23])));
    didvalue<-1;}  

  if(didvalue==0){
  ##Error in best("NY", "hert attack") : invalid outcome
    stop("invalid outcome", call. = TRUE, domain = NULL); }

 
 ## Return hospital name in that state with lowest 30-day death rate
 return(names_hospital[pos])


}