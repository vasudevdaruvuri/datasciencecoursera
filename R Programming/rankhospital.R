setwd('F:/Analytics/Moocs/DS-Coursera/Exercise/R-Programming/rprog-data-ProgAssignment3-data')

rankhospital <- function(state, outcom, num = "best") { 
  
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  options( warn = -1 ) # Suppress Warnings
  #suppressWarnings(as.numeric)
  outcome[, 11] <- as.numeric(outcome[, 11])
  outcome[, 23] <- as.numeric(outcome[, 23])
  outcome[, 17] <- as.numeric(outcome[, 17])
  
  
  outcom <- tolower(outcom)

  if (!state %in% states ) {
    #print('Invalid State')
    stop('Invalid State')
  }
  
  if (outcom == 'heart attack') col <- 11
  else if (outcom == 'heart failure') col <- 17
  else if (outcom == 'pneumonia') col <- 23
  else stop('Invalid Outcome :',outcom)
  
  #outcome  <- outcome[outcome[,col] != 'Not Available',]
  state_ot <- outcome[outcome[,7] == state,c(2,7,col)]
  #print(tail(state_ot))
  state_ot <- state_ot[!is.na(state_ot[,3]),]
  state_or <- state_ot[order(state_ot[,3],state_ot[,1]),c(1,3)]
  
  srow <- nrow(state_or)
  rank <- data.frame(rank = 1:srow)
  state_rank <- cbind(state_or,rank)
  #print(tail(state_rank))
  
  if (num == 'best') num <- 1
  else if (num == 'worst') num <- srow
  else if (num > srow )  return(NA)
  
  return(state_rank[rank == num,1])
  
  ## Return hospital name in that state with the given rank ## 30-day death rate
}
