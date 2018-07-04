# This files make the tests for data inputs (Test de Wilkoxon)

# This file make statistics matrix resume from data input
# Sample Table generate
# Motores Mean Median Min Max Std. Dev. Skewness Kurtosis
# [1,]       1   NA     NA  NA  NA        NA       NA       NA
# [2,]       2   NA     NA  NA  NA        NA       NA       NA
# [3,]       3   NA     NA  NA  NA        NA       NA       NA
# [4,]       4   NA     NA  NA  NA        NA       NA       NA
# [5,]       5   NA     NA  NA  NA        NA       NA       NA
# [6,]      NA   NA     NA  NA  NA        NA       NA       NA
# For generate LaTeX tables from R sample: stargazer(table, summary=FALSE, rownames=FALSE)
# library("stargazer", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
# sample generate LaTeX table (no problems with negative sign): stargazer(tableMotorTestDroid, align = T)
# add the package LaTeX: \usepackage{dcolumn}

statisticsTable_us <- function(dataList){
  table <- matrix(NA, length(dataList), 8)
  colnames(table) <- c("Motors", "Mean", "Median", "Min", "Max", "Std. Dev.", "Skewness", "Kurtosis")
  i = 1
  while( i <= length(dataList)){
    data <- dataList[[i]]$latencies.us
    table[i, ] <- c(i, mean(data, na.rm = TRUE), median(data, na.rm = TRUE), min(data, na.rm = TRUE), max(data, na.rm = TRUE), sd(data, na.rm = TRUE), skewness(data, na.rm = TRUE), kurtosis(data, na.rm = TRUE))
    i <- i + 1
  }
  return(table)
}

