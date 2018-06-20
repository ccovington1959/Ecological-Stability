#########################################################################
#																		#
# Claire Plunkett, Summer 2016											#
# This script runs the MAR process for all data files and can export 	#
# the results to the working directory.									#
#																		#
# This script requires the MAR1 package to be install:					#
# install.packages("MAR1")												#
# MAR1 has other required packages; refer to the MAR1 website if it		#
# does not automatically work.											#
#																		#
#########################################################################
#																		#
# MAR1 Example:															#
# library(MAR1)															#
#	#	Loads the packages												#
# data = read.table("datafolder/datafile.csv",header=T);				#
#	#	Loads the data from a text file:									#
#	#	The first column should be the tank number, the second column	#
#	#	should be the date in year/month/day format, and the other		#
#	#	columns should be data.											#
# data.mar = data.frame(c(data[1:2], log(data[3:6])));					#
#	#	Log-transforms the data, for a data set where columns 3			#
#	#	through 6 are the data.											#
# vars = c(0,0,2,1,1,1); res = matrix(1, nrow=3, ncol=4);				#
#	#	vars is a vector that should contain a 1 for each column with	#
#	#	a variable, a 2 for each column with a covariate, and a 0 for	#
#	#	each column with either the date, tank number, or unused data.	#
#	#	res is a matrix whose entries determines which spaces on the 	#
#	#	matrix can be nonzero (0.5), should be nonzero (1), or must be 	#
#	#	0 (0). Here, each entry is 1 to require a nonzero entry in		#
#	#	each slot.														#
# result = run.mar(data=data.mar, variables=vars, restrictions=res)		#
#	#	Runs the MAR process. Other options are available, but this 		#
#	#	automatically finds the best-fit matrix and runs a bootstrap 	#
#	#	process to give error bounds. If a bound intersects 0, then 		#
#	#	the bootstrap matrix will be 0 at that entry. To view the		#
#	#	results, execute result.											#
# export.MAR(result, export="MAR Results/newfolder")					#
#	#	Exports all results to MAR Results/newfolder in .csv format.		#
#																		#
#########################################################################

library(MAR1) # Load the MAR1 package
setwd('/Users/4/Documents/Weak interactions/') # Change the working directory if necessary

##### Import all data. The header=T option creates a header for things like tank, date, and cer without putting that information in the first row of the dataframe.
cer = read.table("tank data R/CER.csv",header=T);
cer0 = read.table("tank data R/CER0.csv",header=T);
dap = read.table("tank data R/DAP.csv",header=T);
dap0 = read.table("tank data R/DAP0.csv",header=T);
sca = read.table("tank data R/SCA.csv",header=T);
sca0 = read.table("tank data R/SCA0.csv",header=T);
cersca = read.table("tank data R/CER_SCA.csv",header=T);
cersca0 = read.table("tank data R/cer_sca0.csv",header=T);
cerdap = read.table("tank data R/CER_DAP.csv",header=T);
cerdap0 = read.table("tank data R/CER_DAP0.csv",header=T);
dapsca = read.table("tank data R/DAPSCA.csv",header=T);
dapsca0 = read.table("tank data R/DAPSCA0.csv",header=T);

N = read.table("tank data R/N.csv",header=T);
N0 = read.table("tank data R/N0.csv",header=T);
Ncer = read.table("tank data R/N_CER.csv",header=T);
Ncer0 = read.table("tank data R/N_CER0.csv",header=T);
Ndap = read.table("tank data R/N_DAP.csv",header=T);
Ndap0 = read.table("tank data R/N_DAP0.csv",header=T);
Nsca = read.table("tank data R/N_SCA.csv",header=T);
Nsca0 = read.table("tank data R/N_SCA0.csv",header=T);

Ncersca = read.table("tank data R/N_CER_SCA.csv",header=T);
Ncersca0 = read.table("tank data R/N_CER_SCA0.csv",header=T);
Ncerdap = read.table("tank data R/N_CER_DAP.csv",header=T);
Ncerdap0 = read.table("tank data R/N_CER_DAP0.csv",header=T);
Ndapsca = read.table("tank data R/N_SCA_DAP.csv",header=T);
Ndapsca0 = read.table("tank data R/N_SCA_DAP0.csv",header=T);

Ni = read.table("tank data R/N_I.csv",header=T);
Ni0 = read.table("tank data R/N_I0.csv",header=T);
Nicop = read.table("tank data R/N_I_COP.csv",header=T);
Nicop0 = read.table("tank data R/N_I_COP0.csv",header=T);
Nidap = read.table("tank data R/N_I_DAP.csv",header=T);
Nidap0 = read.table("tank data R/n_i_dap0.csv",header=T);
cerscadap0 = read.table("tank data R/CER_SCA_DAP0.csv",header=T);


##### Log-transform the data that is not tank number or date.
##### data.frame is used to put the information in a dataframe format, the format that MAR prefers.
##### The indecies for the log-transform data change based on the number of species and covariates. For example, cer has 1 covariate and 3 species, so columns 3 through 6 are log-transformed.
cer.mar = data.frame(c(cer[1:2], log(cer[3:6])));
cer0.mar = data.frame(c(cer0[1:2], log(cer0[3:5])));
dap.mar = data.frame(c(dap[1:2], log(dap[3:6])));
dap0.mar = data.frame(c(dap0[1:2], log(dap0[3:5])));
sca.mar = data.frame(c(sca[1:2], log(sca[3:6])));
sca0.mar = data.frame(c(sca0[1:2], log(sca0[3:5])));
cersca.mar = data.frame(c(cersca[1:2], log(cersca[3:7])));
cersca0.mar = data.frame(c(cersca0[1:2], log(cersca0[3:6])));
cerdap.mar = data.frame(c(cerdap[1:2], log(cerdap[3:7])));
cerdap0.mar = data.frame(c(cerdap0[1:2], log(cerdap0[3:6])));
dapsca.mar = data.frame(c(dapsca[1:2], log(dapsca[3:7])));
dapsca0.mar = data.frame(c(dapsca0[1:2], log(dapsca0[3:6])));

N.mar = data.frame(c(N[1:2], log(N[3:9])));
N0.mar = data.frame(c(N0[1:2], log(N0[3:8])));
Ncer.mar = data.frame(c(Ncer[1:2], log(Ncer[3:8])));
Ncer0.mar = data.frame(c(Ncer0[1:2], log(Ncer0[3:7])));
Ndap.mar = data.frame(c(Ndap[1:2], log(Ndap[3:8])));
Ndap0.mar = data.frame(c(Ndap0[1:2], log(Ndap0[3:7])));
Nsca.mar = data.frame(c(Nsca[1:2], log(Nsca[3:8])));
Nsca0.mar = data.frame(c(Nsca0[1:2], log(Nsca0[3:7])));

Ncersca.mar = data.frame(c(Ncersca[1:2], log(Ncersca[3:7])));
Ncersca0.mar = data.frame(c(Ncersca0[1:2], log(Ncersca0[3:6])));
Ncerdap.mar = data.frame(c(Ncerdap[1:2], log(Ncerdap[3:7])));
Ncerdap0.mar = data.frame(c(Ncerdap0[1:2], log(Ncerdap0[3:6])));
Ndapsca.mar = data.frame(c(Ndapsca[1:2], log(Ndapsca[3:7])));
Ndapsca0.mar = data.frame(c(Ndapsca0[1:2], log(Ndapsca0[3:6])));

Ni.mar = data.frame(c(Ni[1:2], log(Ni[3:10])));
Ni0.mar = data.frame(c(Ni0[1:2], log(Ni0[3:8])));
Nicop.mar = data.frame(c(Nicop[1:2], log(Nicop[3:11])));
Nicop0.mar = data.frame(c(Nicop0[1:2], log(Nicop0[3:9])));
Nidap.mar = data.frame(c(Nidap[1:2], log(Nidap[3:8])));
Nidap0.mar = data.frame(c(Nidap0[1:2], log(Nidap0[3:7])));
cerscadap0.mar = data.frame(c(cerscadap0[1:2], log(cerscadap0[3:7])));

##### Create the variable vectors and restriction matrices.
##### There are always two 0s at the beginning of the variable vectors for the tank number and date columns, followed by either 0, 1, or 2 2s for covariates, then the rest of the 1s.
##### The restriction matrices are filled with 1s here.
vars3 = c(0,0,2,1,1,1); res3 = matrix(1, nrow=3, ncol=4);
vars30 = c(0,0,1,1,1); res30 = matrix(1, nrow=3, ncol=3);
vars4 = c(0,0,2,1,1,1,1); res4 = matrix(1, nrow=4, ncol=5);
vars40 = c(0,0,1,1,1,1); res40 = matrix(1, nrow=4, ncol=4);
vars5 = c(0,0,2,1,1,1,1,1); res5 = matrix(1, nrow=5, ncol=6);
vars50 = c(0,0,1,1,1,1,1); res50 = matrix(1, nrow=5, ncol=5);
vars6 = c(0,0,2,1,1,1,1,1,1); res6 = matrix(1, nrow=6, ncol=7);
vars60 = c(0,0,1,1,1,1,1,1); res60 = matrix(1, nrow=6, ncol=6);
vars62 = c(0,0,2,2,1,1,1,1,1,1); res62 = matrix(1, nrow=6, ncol=8);
vars7 = c(0,0,2,1,1,1,1,1,1,1); res7 = matrix(1, nrow=7, ncol=8);
vars70 = c(0,0,1,1,1,1,1,1,1); res70 = matrix(1, nrow=7, ncol=7);
vars72 = c(0,0,2,2,1,1,1,1,1,1,1); res72 = matrix(1, nrow=7, ncol=9);


##### Execute the MAR process
cer.results = run.mar(data=cer.mar, variables=vars3, restrictions=res3)
cer0.results = run.mar(data=cer0.mar, variables=vars30, restrictions=res30)
dap.results = run.mar(data=dap.mar, variables=vars3, restrictions=res3)
dap0.results = run.mar(data=dap0.mar, variables=vars30, restrictions=res30)
sca.results = run.mar(data=sca.mar, variables=vars3, restrictions=res3)
sca0.results = run.mar(data=sca0.mar, variables=vars30, restrictions=res30)
cersca.results = run.mar(data=cersca.mar, variables=vars4, restrictions=res4)
cersca0.results = run.mar(data=cersca0.mar, variables=vars40, restrictions=res40)
cerdap.results = run.mar(data=cerdap.mar, variables=vars4, restrictions=res4)
cerdap0.results = run.mar(data=cerdap0.mar, variables=vars40, restrictions=res40)
dapsca.results = run.mar(data=dapsca.mar, variables=vars4, restrictions=res4)
dapsca0.results = run.mar(data=dapsca0.mar, variables=vars40, restrictions=res40)

N.results = run.mar(data=N.mar, variables=vars6, restrictions=res6)
N0.results = run.mar(data=N0.mar, variables=vars60, restrictions=res60)
Ncer.results = run.mar(data=Ncer.mar, variables=vars5, restrictions=res5)
Ncer0.results = run.mar(data=Ncer0.mar, variables=vars50, restrictions=res50)
Ndap.results = run.mar(data=Ndap.mar, variables=vars5, restrictions=res5)
Ndap0.results = run.mar(data=Ndap0.mar, variables=vars50, restrictions=res50)
Nsca.results = run.mar(data=Nsca.mar, variables=vars5, restrictions=res5)
Nsca0.results = run.mar(data=Nsca0.mar, variables=vars50, restrictions=res50)

Ncersca.results = run.mar(data=Ncersca.mar, variables=vars4, restrictions=res4)
Ncersca0.results = run.mar(data=Ncersca0.mar, variables=vars40, restrictions=res40)
Ncerdap.results = run.mar(data=Ncerdap.mar, variables=vars4, restrictions=res4)
Ncerdap0.results = run.mar(data=Ncerdap0.mar, variables=vars40, restrictions=res40)
Ndapsca.results = run.mar(data=Ndapsca.mar, variables=vars4, restrictions=res4)
Ndapsca0.results = run.mar(data=Ndapsca0.mar, variables=vars40, restrictions=res40)

Ni.results = run.mar(data=Ni.mar, variables=vars62, restrictions=res62)
Ni0.results = run.mar(data=Ni0.mar, variables=vars60, restrictions=res60)
Nicop.results = run.mar(data=Nicop.mar, variables=vars72, restrictions=res72)
Nicop0.results = run.mar(data=Nicop0.mar, variables=vars70, restrictions=res70)
Nidap.results = run.mar(data=Nidap.mar, variables=vars5, restrictions=res5)
Nidap0.results = run.mar(data=Nidap0.mar, variables=vars50, restrictions=res50)
cerscadap0.results = run.mar(data=cerscadap0.mar, variables=vars50, restrictions=res50)


##### Export the results to folders in the folder MAR Results
##### The folders are numbered according to the numbers used in MAR_dataruns0.nb
##### This data can easily be imported into Mathematica.
export.MAR(cer.results, export="MAR Results/18")
export.MAR(sca.results, export="MAR Results/23")
export.MAR(dap.results, export="MAR Results/21")
export.MAR(cerdap.results, export="MAR Results/19")
export.MAR(cersca.results, export="MAR Results/20")
export.MAR(dapsca.results, export="MAR Results/22")
export.MAR(N.results, export="MAR Results/24")
export.MAR(Ncer.results, export="MAR Results/25")
export.MAR(Nsca.results, export="MAR Results/29")
export.MAR(Ndap.results, export="MAR Results/28")
export.MAR(Ncerdap.results, export="MAR Results/26")
export.MAR(Ncersca.results, export="MAR Results/27")
export.MAR(Ndapsca.results, export="MAR Results/30")
export.MAR(Ni.results, export="MAR Results/32")
export.MAR(Nicop.results, export="MAR Results/33")
export.MAR(Nidap.results, export="MAR Results/31")

export.MAR(cer0.results, export="MAR Results/1")
export.MAR(sca0.results, export="MAR Results/6")
export.MAR(dap0.results, export="MAR Results/4")
export.MAR(cerdap0.results, export="MAR Results/2")
export.MAR(cersca0.results, export="MAR Results/3")
export.MAR(dapsca0.results, export="MAR Results/5")
export.MAR(N0.results, export="MAR Results/7")
export.MAR(Ncer0.results, export="MAR Results/8")
export.MAR(Nsca0.results, export="MAR Results/12")
export.MAR(Ndap0.results, export="MAR Results/11")
export.MAR(Ncerdap0.results, export="MAR Results/9")
export.MAR(Ncersca0.results, export="MAR Results/10")
export.MAR(Ndapsca0.results, export="MAR Results/13")
export.MAR(Ni0.results, export="MAR Results/15")
export.MAR(Nicop0.results, export="MAR Results/16")
export.MAR(Nidap0.results, export="MAR Results/14")
export.MAR(cerscadap0.results, export="MAR Results/17")