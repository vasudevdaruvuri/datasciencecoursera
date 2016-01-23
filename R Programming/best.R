setwd('F:/Analytics/Moocs/DS-Coursera/Exercise/R-Programming/rprog-data-ProgAssignment3-data')


best <- function(state,outcom){
  
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  #head(outcome)
  
  #ncol(outcome)
  #nrow(outcome)
  #names(outcome)
  outcome[, 11] <- as.numeric(outcome[, 11])
  outcome[, 23] <- as.numeric(outcome[, 23])
  outcome[, 17] <- as.numeric(outcome[, 17])
  #hist(outcome[, 11])
  
  states <- unique(outcome[,7])
  
  outcom <- tolower(outcom)
  if (!state %in% states ) {
    #print('Invalid State')
    stop('Invalid State')
  }
  
  if (outcom == 'heart attack') col <- 11
  else if (outcom == 'heart failure') col <- 17
  else if (outcom == 'pneumonia') col <- 23
  else stop('Invalid Outcome :',outcom)
  
  
  state_ot <- outcome[outcome[,7] == state,c(2,7,col)]
  state_ot <- state_ot[!is.na(state_ot[,3]),]
  state_ot[order(state_ot[,3],state_ot[,1]),c(1)][1]
}
