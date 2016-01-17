setwd('F:/Analytics/Moocs/DS-Coursera/Exercise/R-Programming/rprog-data-specdata')
#dir()
pollutantmean <- function(directory,pollutant,id = 1:332){
  
  df = data.frame()
  for( i in id){

    len  = nchar(i)
     re  = 3 - len
     pad = paste0(rep(0,re),collapse = '')   
    fil  = paste0(pad,i,'.csv',collapse = '')
    file = paste(directory,fil,sep = '/')
    df   = rbind(df,read.csv(file))
    
  }
  
  meandf <- mean(df[ ,pollutant],na.rm = TRUE)
  return(meandf)
  
}

#pollutantmean('specdata','sulfate',1:10)