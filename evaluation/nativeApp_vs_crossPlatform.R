# This file generate evaluation graphics for latex project of Mobile SDK Openlove 2018
# install.packages("stargazer")
# install.packages("moments")
library(stargazer) # For generate LaTeX tables from R: stargazer(table, summary=FALSE, rownames=FALSE)
library(moments) # for calculate skewness and kurtosis

# Load .R files to use
source('loadData.R')
source('preprocessing.R')
source('graphics.R')
source('statistics.R')

# Load Data to processing
path <- getwd()
folderData <- 'data'
folderGraphics <- 'graphics'
# ----------------------------  DEVICE IS VARIABLE (subfolder name) ---------------------------- #
# 'Device2' # Is the name for graphics subfolder... graphics/Droid/Galaxy ... graphics/Droid/Device2 ... graphics/Xamarin/Device2
device <- 'Nexus' # Select Galaxy - Nexus
# ----------------------------  DEVICE IS VARIABLE (subfolder name) ---------------------------- #

# TEST FOR device:  Native Android vs Xamarin.Forms flexors and motors
flexorTestNamesDroid    <- getTestFileNames(1, 'flexor', 'Droid', device, '.csv')
flexorTestNamesXamarin  <- getTestFileNames(1, 'flexor', 'Xamarin', device, '.csv')
motorTestNamesDroid     <- getTestFileNames(5, 'motor', 'Droid', device, '.csv')
motorTestNamesXamarin   <- getTestFileNames(5, 'motor', 'Xamarin', device, '.csv')
#imuTestNamesDroid       <- getTestFileNames(1, 'imu', 'Droid', device, '.csv') # For next imu data
#imuTestNamesXamarin     <- getTestFileNames(1, 'imu', 'Xamarin', device, '.csv') # For next imu data

# Load samples test in List
flexorTestDroidList     <- loadData(path, folderData, flexorTestNamesDroid)
flexorTestXamarinList   <- loadData(path, folderData, flexorTestNamesXamarin)
motorTestDroidList      <- loadData(path, folderData, motorTestNamesDroid)
motorTestXamarinList    <- loadData(path, folderData, motorTestNamesXamarin)

# Preprocessing the load data (convert time ns-> us ->ms) and (convert outlierst to NA for ignore in graphics
flexorTestDroidList     <- preprocessingTestList(flexorTestDroidList)
flexorTestXamarinList   <- preprocessingTestList(flexorTestXamarinList)
motorTestDroidList      <- preprocessingTestList(motorTestDroidList)
motorTestXamarinList    <- preprocessingTestList(motorTestXamarinList)

# Generate matrix statistic summary for generate LaTeX tables with stargazer
tableFlexorTestDroid    <- statisticsTable_us("flexors", flexorTestDroidList)
tableFlexorTestXamarin  <- statisticsTable_us("flexors", flexorTestXamarinList)
tableMotorTestDroid     <- statisticsTable_us("motors", motorTestDroidList)
tableMotorTestXamarin   <- statisticsTable_us("motors", motorTestXamarinList)


# Constants for graphics
ext <- '.png'
testName <- list('Flexors', 'Motors', 'IMU')
graphicType <- list('NormalQQ', 'Hist', 'Boxplot')
platform <- list('Droid', 'Xamarin')
graphicTypeTitle <- list('Normal Q-Q ', 'Histogram ', 'Boxplot')

# ----------------------------  FLEXORS TEST ---------------------------- #
res = 75 * 1.5 # pixel of resolution
width = 400 * 3.0
height = 350 * 3.0

nRow <- 1
nCol <- 1

# NORMAL QQ graphics
tmpFileName <- paste(graphicType[1], testName[1], platform[1], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[1], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
normalQQGraphic(flexorTestDroidList, testName[1], graphicTypeTitle[1])
dev.off()

tmpFileName <- paste(graphicType[1], testName[1], platform[2], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[2], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
normalQQGraphic(flexorTestXamarinList, testName[1], graphicTypeTitle[1])
dev.off()

# HISTOGRAMS
tmpFileName <- paste(graphicType[2], testName[1], platform[1], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[1], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
histogramGraphic(flexorTestDroidList, testName[1], graphicTypeTitle[2])
dev.off()

tmpFileName <- paste(graphicType[2], testName[1], platform[2], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[2], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
histogramGraphic(flexorTestXamarinList, testName[1], graphicTypeTitle[2])
dev.off()

# BOXPLOTS
tmpFileName <- paste(graphicType[3], testName[1], platform[1], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[1], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
boxplotGraphic(flexorTestDroidList, testName[1], graphicTypeTitle[3])
dev.off()

tmpFileName <- paste(graphicType[3], testName[1], platform[2], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[2], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
boxplotGraphic(flexorTestXamarinList, testName[1], graphicTypeTitle[3])
dev.off()
# ----------------------------  MOTOR TEST ---------------------------- #

ext <- '.png'
testName <- list('Flexors', 'Motors', 'IMU')
graphicType <- list('NormalQQ', 'Hist', 'Boxplot')
platform <- list('Droid', 'Xamarin')
graphicTypeTitle <- list('Normal Q-Q ', 'Histogram ', 'Boxplot')

nRow <- 3
nCol <- 2
# NORMAL QQ graphics

# Droid
tmpFileName <- paste(graphicType[1], testName[2], platform[1], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[1], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
normalQQGraphic(motorTestDroidList, testName[2], graphicTypeTitle[1])
dev.off()

# Xamarin
tmpFileName <- paste(graphicType[1], testName[2], platform[2], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[2], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
normalQQGraphic(motorTestXamarinList, testName[2], graphicTypeTitle[1])
dev.off()

# HISTOGRAMS

# Droid
tmpFileName <- paste(graphicType[2], testName[2], platform[1], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[1], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
histogramGraphic(motorTestDroidList, testName[2], graphicTypeTitle[2])
dev.off()

# Xamarin
tmpFileName <- paste(graphicType[2], testName[2], platform[2], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[2], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
par(mfrow = c(nRow,nCol))
histogramGraphic(motorTestXamarinList, testName[2], graphicTypeTitle[2])
dev.off()

# BOXPLOTS

# Droid
tmpFileName <- paste(graphicType[3], testName[2], platform[1], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[1], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
boxplotGraphic(motorTestDroidList, testName[2], graphicTypeTitle[3])
dev.off()

# Xamarin
tmpFileName <- paste(graphicType[3], testName[2], platform[2], device, ext, sep = '')
png(filename <- paste(path, folderGraphics, platform[2], device, tmpFileName, sep = '/'), res=res, width = width, height = height)
boxplotGraphic(motorTestXamarinList, testName[2], graphicTypeTitle[3])
dev.off()
