setwd('F:/Analytics/Moocs/DS-Coursera/Exercise/R-Programming/rprog-data-specdata')
#dir()
complete <- function(directory,id = 1:332){
  
  df = data.frame()
  for( i in id){
    
    len  = nchar(i)
    re  = 3 - len
    pad = paste0(rep(0,re),collapse = '')   
    fil  = paste0(pad,i,'.csv',collapse = '')
    file = paste(directory,fil,sep = '/')
    df1   = read.csv(file)
    #print(dim(df1))
    crows <- nrow(df1[complete.cases(df1),])
    #print(crows)
    df    <- rbind(df,data.frame( id = i, nobs = crows ))
  }
  return(df)
  }

