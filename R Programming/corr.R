setwd('F:/Analytics/Moocs/DS-Coursera/Exercise/R-Programming/rprog-data-specdata')
#dir()
corr <- function(directory,threshold = 0){
  
  df = data.frame()
  corr_vec <- c()
  for( fil in dir(directory)){
    
    file = paste(directory,fil,sep = '/')
    df1   = read.csv(file)
    ccdf  <- df1[complete.cases(df1),]
    crows <- nrow(ccdf)
  
    if (crows > threshold){
      cr <- cor(ccdf[,'sulfate'],ccdf[,'nitrate'])
      corr_vec <- c(corr_vec,cr)
    }
    
  }
  return(corr_vec)
}
