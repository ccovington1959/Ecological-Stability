alldataN = read.csv("Tank data R 2/Extended Combined.csv")
alldataNL = data.frame(c(alldataN[,1:2],log(alldataN[,3:10])))
normaldata = read.csv("tank data 2/combined.csv")
normaldataL = data.frame(c(normaldata[,1:2],log(normaldata[,3:10])))

# Delete the first row to facilitate comparing one population at time t to another population at time t+1
alldataNShift1 = alldataN[0:-1,]
alldataN = alldataN[-nrow(alldataN),]
alldataNLShift1 = alldataNL[0:-1,]
alldataNL = alldataNL[-nrow(alldataNL),]

normaldataShift1 = normaldata[0:-1,]
normaldata = normaldata[-nrow(normaldata),]
normaldataLShift1 = normaldataL[0:-1,]
normaldataL = normaldataL[-nrow(normaldataL),]


# par(mfrow=c(2,3))

# plot(alldataN[,4],alldataNShift1[,8], main="Edible vs. Ceriodaphnia", xlab="Cer", ylab="Edible Algae")
# abline(lm(alldataNShift1[,8]~alldataN[,4]), col="red")

# plot(alldataN[,5],alldataNShift1[,8], main="Edible vs. Daphnia", xlab="Dap", ylab="Edible Algae")
# abline(lm(alldataNShift1[,8]~alldataN[,5]), col="red")

# plot(alldataN[,6],alldataNShift1[,8], main="Edible vs. Scapholebris", xlab="Sca", ylab="Edible Algae")
# abline(lm(alldataNShift1[,8]~alldataN[,6]), col="red")


# plot(alldataN[,8],alldataNShift1[,4], main="Ceriodaphnia vs. Edible", xlab="Edible Algae", ylab="Cer")
# abline(lm(alldataNShift1[,4]~alldataN[,8]), col="red")

# plot(alldataN[,8],alldataNShift1[,5], main="Daphnia vs. Edible", xlab="Edible Algae", ylab="Dap")
# abline(lm(alldataNShift1[,5]~alldataN[,8]), col="red")

# plot(alldataN[,8],alldataNShift1[,6], main="Scapholebris vs. Edible", xlab="Edible Algae", ylab="Sca")
# abline(lm(alldataNShift1[,6]~alldataN[,8]), col="red")

# dev.new()
par(mfrow=c(2,3))

plot(alldataNL[,4],alldataNLShift1[,8], main="Edible vs. Ceriodaphnia", xlab="Cer", ylab="Edible Algae")
abline(lm(alldataNLShift1[,8]~alldataNL[,4]), col="red")
abline(lm(normaldataLShift1[,8]~normaldataL[,4]), col="blue")
for (i in 1:23) {
points(alldataNL[(29*i-28):(29*i-26),4],alldataNLShift1[(29*i-28):(29*i-26),8], col="red")
}

plot(alldataNL[,5],alldataNLShift1[,8], main="Edible vs. Daphnia", xlab="Dap", ylab="Edible Algae")
abline(lm(alldataNLShift1[,8]~alldataNL[,5]), col="red")
abline(lm(normaldataLShift1[,8]~normaldataL[,5]), col="blue")
for (i in 1:23) {
points(alldataNL[(29*i-28):(29*i-26),5],alldataNLShift1[(29*i-28):(29*i-26),8], col="red")
}

plot(alldataNL[,6],alldataNLShift1[,8], main="Edible vs. Scapholebris", xlab="Sca", ylab="Edible Algae")
abline(lm(alldataNLShift1[,8]~alldataNL[,6]), col="red")
abline(lm(normaldataLShift1[,8]~normaldataL[,6]), col="blue")
for (i in 1:23) {
points(alldataNL[(29*i-28):(29*i-26),6],alldataNLShift1[(29*i-28):(29*i-26),8], col="red")
}


plot(alldataNL[,8],alldataNLShift1[,4], main="Ceriodaphnia vs. Edible", xlab="Edible Algae", ylab="Cer")
abline(lm(alldataNLShift1[,4]~alldataNL[,8]), col="red")
abline(lm(normaldataLShift1[,4]~normaldataL[,8]), col="blue")
for (i in 1:23) {
points(alldataNL[(29*i-28):(29*i-26),8],alldataNLShift1[(29*i-28):(29*i-26),4], col="red")
}

plot(alldataNL[,8],alldataNLShift1[,5], main="Daphnia vs. Edible", xlab="Edible Algae", ylab="Dap")
abline(lm(alldataNLShift1[,5]~alldataNL[,8]), col="red")
abline(lm(normaldataLShift1[,5]~normaldataL[,8]), col="blue")
for (i in 1:23) {
points(alldataNL[(29*i-28):(29*i-26),8],alldataNLShift1[(29*i-28):(29*i-26),5], col="red")
}

plot(alldataNL[,8],alldataNLShift1[,6], main="Scapholebris vs. Edible", xlab="Edible Algae", ylab="Sca")
abline(lm(alldataNLShift1[,6]~alldataNL[,8]), col="red")
abline(lm(normaldataLShift1[,6]~normaldataL[,8]), col="blue")
for (i in 1:23) {
points(alldataNL[(29*i-28):(29*i-26),8],alldataNLShift1[(29*i-28):(29*i-26),6], col="red")
}