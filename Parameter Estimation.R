p = 2
TT = 2
one <- matrix(1, nrow=TT, ncol=1)
X <- matrix(c(1,5,3,8),nrow=TT,ncol=p)
U <- matrix(c(4,1,8,5),nrow=TT,ncol=p)
E <- matrix(c(6,1,8,3),nrow=TT,ncol=p)
Y <- matrix(c(X[,2:p],seq(20/TT,10+10/TT,10/TT)),nrow=TT,ncol=p)
Z <- matrix(c(sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1),sample(seq(1,10,0.05),1)),nrow=TT,ncol=2*p+1)
for (i in c(1:p)){
  D[,i] <- solve((t(Z) %*% Z)) %*% t(Z) %*% Y[,i]
}
