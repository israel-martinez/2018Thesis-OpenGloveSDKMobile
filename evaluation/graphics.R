# This file management the plots and storage in specific format

normalQQGraphic <- function(dataList, testName, graphicTypeTitle, xlim, ylim){
  i <- 1
  while (i <= length(dataList)){
    qqnorm(dataList[[i]]$latencies.us, main=paste(c(graphicTypeTitle, i, testName), collapse = ' '))
    qqline(dataList[[i]]$latencies.us, col='red')
    i <- i + 1
  }
}

histogramGraphic <- function(dataList, testName, graphicTypeTitle, xlim = NULL, ylim = NULL){
  i <- 1
  while (i <= length(dataList)){
    if(!is.null(xlim) && is.null(ylim))
      hist(dataList[[i]]$latencies.us, col="lightcyan", main=paste(c(graphicTypeTitle, i, testName), collapse = ' '), xlab=expression('Time ('*mu*'s)'), ylab='Frequency', xlim = xlim)
    else
      hist(dataList[[i]]$latencies.us, col="lightcyan", main=paste(c(graphicTypeTitle, i, testName), collapse = ' '), xlab=expression('Time ('*mu*'s)'), ylab='Frequency')
    i <- i + 1
  }
}

boxplotGraphic <- function(dataList, testName, graphicTypeTitle){
  aux <- dataList[[1]]$latencies.us
  names <- list(paste(c(1, testName), collapse = ' ')) 
  i <- 2
  while (i <= length(dataList)){
    aux <- cbind(aux, dataList[[i]]$latencies.us)
    names[[i]] <- paste(c(i, testName), collapse = ' ')
    i <- i + 1
  }
    return ( boxplot(aux, main=paste(c(graphicTypeTitle, testName), collapse = ' '), ylab=expression('Time ('*mu*'s)'), names = names))
}