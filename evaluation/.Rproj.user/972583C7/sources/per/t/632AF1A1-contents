# This script make the preprosseing of csv files generates

division10pow3 <- function(x) {
  return (x/1000)
}

outliersToNA <- function(latencies){
  mySummary <- summary(latencies)
  Q1 <- mySummary["1st Qu."]
  Q3 <- mySummary["3rd Qu."]
  IQR <- Q3 - Q1  # Calculate intercuartil
  limInf <- Q1 - 1.5*IQR
  limSup <- Q3 + 1.5*IQR
  
  i <- 1
  while(i <= length(latencies)){
    if (latencies[i] < limInf || limSup < latencies[i]) {
      latencies[i] <- NA
    }
    i <- i + 1
  }
  #latencies_ns <- latencies_ns[!is.na(latencies_ns)] # This delete NA
  return (latencies)
}

preprocessing <- function(latencies) {
  latencies <- cbind(latencies, latencies[,1])
  latencies <- cbind(latencies, latencies[,2])
  colnames(latencies) <- c('latencies.ns', 'latencies.us', 'latencies.ms')
  latencies <- cbind(latencies[1], apply(latencies[2:3],2,division10pow3))
  latencies <- cbind(latencies[1:2], apply(latencies[3],2,division10pow3))
  # Convert outlierst to NA for ignore in graphics
  #latencies[[1]]$latencies.ns <- outliersToNA(latencies[[1]]$latencies.ns)
  #latencies[2] <- outliersToNA(latencies[2])
  #latencies[3] <- outliersToNA(latencies[3])
  return (latencies)
}

preprocessingTestList <- function(testsList) {
  i = 1
  while (i <= length(testsList)){
    testsList[[i]] <- preprocessing(testsList[[i]])
    testsList[[i]]$latencies.ns <- outliersToNA(testsList[[i]]$latencies.ns)
    testsList[[i]]$latencies.us <- outliersToNA(testsList[[i]]$latencies.us)
    testsList[[i]]$latencies.ms <- outliersToNA(testsList[[i]]$latencies.ms)
    i <- i + 1
  }
  return (testsList)
}