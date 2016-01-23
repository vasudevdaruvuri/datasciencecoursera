setwd('F:/Analytics/Moocs/DS-Coursera/Exercise/R-Programming/rprog-data-ProgAssignment3-data')

rankall <- function(outcom, numb = "best") { 
  
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  options( warn = -1 ) # Suppress Warnings
  #suppressWarnings(as.numeric)
  outcome[, 11] <- as.numeric(outcome[, 11])
  outcome[, 23] <- as.numeric(outcome[, 23])
  outcome[, 17] <- as.numeric(outcome[, 17])
  
  states <- unique(outcome[,7])
  
  outcom <- tolower(outcom)


  if (outcom == 'heart attack') col <- 11
  else if (outcom == 'heart failure') col <- 17
  else if (outcom == 'pneumonia') col <- 23
  else stop('Invalid Outcome :',outcom)
  
  #outcome  <- outcome[outcome[,col] != 'Not Available',]
  ranked.states <- data.frame()
  #states <- c("WI","WV","WY")
  
  for(state in states){
    
  state_ot <- outcome[outcome[,7] == state,c(2,7,col)]
  #print(tail(state_ot))
  state_ot <- state_ot[!is.na(state_ot[,3]),]
  state_or <- state_ot[order(state_ot[,3],state_ot[,1]),c(1,2,3)]

  srow <- nrow(state_or)

  rank <- data.frame(rank = 1:srow)
  state_rank <- cbind(state_or,rank)
  
  if (numb == 'best') num <- 1
  else if (numb == 'worst') num <- srow
  else num <- numb

  if (num <= srow){
  state_rank1 <- state_rank[rank == num,c(1,2,4)]
  ranked.states <- rbind(ranked.states,state_rank1)
  }
  else{
     state_rank1 <- data.frame(Hospital.Name= NA, State = state, rank = NA)
    ranked.states <- rbind(ranked.states,state_rank1)
  }
  
  }
  
  #print(nrow(ranked.states))
  #print(head(ranked.states))
  ranked.states <- ranked.states[order(ranked.states[,2]),]
  
  return(ranked.states)
  
  ## Return hospital name in that state with the given rank ## 30-day death rate
}
