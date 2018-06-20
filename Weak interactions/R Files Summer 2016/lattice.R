setwd("/Users/4/Documents/Weak interactions")

# Import data from file and create a new list with log-transformed data
### I changed the file type to csv because R doesn't work well with .xlsx files
#alldata = read.csv("Combined Data.csv");
alldata = read.csv("Combined Data 0 cov.csv");
alldataL = data.frame(c(alldata[,1:4],log(alldata[,5:11])))

# Delete the first row to facilitate comparing one population at time t to another population at time t+1
alldataShift1 = alldata[0:-1,]
alldata = alldata[-nrow(alldata),]
alldataDelta = (alldataShift1 - alldata);
alldataLShift1 = alldataL[0:-1,]
alldataL = alldataL[-nrow(alldataL),]

dev.new()
par(mfrow=c(2,3))

plot(alldata[,5],alldataShift1[,9], main="Edible vs. Ceriodaphnia", xlab="Cer", ylab="Edible Algae")
abline(lm(alldataShift1[,9]~alldata[,5]), col="red")

plot(alldata[,6],alldataShift1[,9], main="Edible vs. Daphnia", xlab="Dap", ylab="Edible Algae")
abline(lm(alldataShift1[,9]~alldata[,6]), col="red")

plot(alldata[,7],alldataShift1[,9], main="Edible vs. Scapholebris", xlab="Sca", ylab="Edible Algae")
abline(lm(alldataShift1[,9]~alldata[,7]), col="red")


plot(alldata[,9],alldataShift1[,5], main="Ceriodaphnia vs. Edible", xlab="Edible Algae", ylab="Cer")
abline(lm(alldataShift1[,5]~alldata[,9]), col="red")

plot(alldata[,9],alldataShift1[,6], main="Daphnia vs. Edible", xlab="Edible Algae", ylab="Dap")
abline(lm(alldataShift1[,6]~alldata[,9]), col="red")

plot(alldata[,9],alldataShift1[,7], main="Scapholebris vs. Edible", xlab="Edible Algae", ylab="Sca")
abline(lm(alldataShift1[,7]~alldata[,9]), col="red")

dev.new()
par(mfrow=c(2,3))

plot(alldataL[,5],alldataLShift1[,9], main="Edible vs. Ceriodaphnia", xlab="Cer", ylab="Edible Algae")
abline(lm(alldataLShift1[,9]~alldataL[,5]), col="red")

plot(alldataL[,6],alldataLShift1[,9], main="Edible vs. Daphnia", xlab="Dap", ylab="Edible Algae")
abline(lm(alldataLShift1[,9]~alldataL[,6]), col="red")

plot(alldataL[,7],alldataLShift1[,9], main="Edible vs. Scapholebris", xlab="Sca", ylab="Edible Algae")
abline(lm(alldataLShift1[,9]~alldataL[,7]), col="red")


plot(alldataL[,9],alldataLShift1[,5], main="Ceriodaphnia vs. Edible", xlab="Edible Algae", ylab="Cer")
abline(lm(alldataLShift1[,5]~alldataL[,9]), col="red")

plot(alldataL[,9],alldataLShift1[,6], main="Daphnia vs. Edible", xlab="Edible Algae", ylab="Dap")
abline(lm(alldataLShift1[,6]~alldataL[,9]), col="red")

plot(alldataL[,9],alldataLShift1[,7], main="Scapholebris vs. Edible", xlab="Edible Algae", ylab="Sca")
abline(lm(alldataLShift1[,7]~alldataL[,9]), col="red")


dev.new()
par(mfrow=c(2,3))

plot(alldata[,5],alldataDelta[,9], main="Delta Edible vs. Ceriodaphnia", xlab="Cer", ylab="Edible Algae")
abline(lm(alldataDelta[,9]~alldata[,5]), col="red")

plot(alldata[,6],alldataDelta[,9], main="Delta Edible vs. Daphnia", xlab="Dap", ylab="Edible Algae")
abline(lm(alldataDelta[,9]~alldata[,6]), col="red")

plot(alldata[,7],alldataDelta[,9], main="Delta Edible vs. Scapholebris", xlab="Sca", ylab="Edible Algae")
abline(lm(alldataDelta[,9]~alldata[,7]), col="red")


plot(alldata[,9],alldataDelta[,5], main="Delta Ceriodaphnia vs. Edible", xlab="Edible Algae", ylab="Cer")
abline(lm(alldataDelta[,5]~alldata[,9]), col="red")

plot(alldata[,9],alldataDelta[,6], main="Delta Daphnia vs. Edible", xlab="Edible Algae", ylab="Dap")
abline(lm(alldataDelta[,6]~alldata[,9]), col="red")

plot(alldata[,9],alldataDelta[,7], main="Delta Scapholebris vs. Edible", xlab="Edible Algae", ylab="Sca")
abline(lm(alldataDelta[,7]~alldata[,9]), col="red")