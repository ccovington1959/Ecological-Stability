####### MAR1 R Package ########
# Install MAR1 package
install.packages("MAR1", repos="http://cran.rstudio.com", dependencies=TRUE)
# Load package
library(MAR1)

#Reset R's brain
rm(list=ls())

# getwd tells you where R is currently looking
getwd()

# setwd tells R where to look
setwd("~/Desktop/MAR")

# use getwd to confirm that R is now looking here
getwd()

# tell R to read the file HSC_R.csv
read.csv("Dap.csv")


#Now we need to give the HSC_R.csv file a name inside R
Dap.dat <- read.csv("Dap.csv")

######## Build the MAR(1) model ########
# Look at the arguments available in run.mar and view help file
formals(run.mar) ?run.mar
# Initiate MAR(1) analysis using pop-up windows to select variables and set interaction restrictions # Set l_dap, l_edib, l_ined as variates
# Do not set any restrictions


