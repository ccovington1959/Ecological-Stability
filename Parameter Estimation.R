p = 10
TT = 20
one <- matrix(1, nrow=TT, ncol=1)
X <- matrix(c(seq(0.5,10,10/TT)),nrow=TT,ncol=p)
U <- matrix(c(seq(100/TT,100,100/TT)),nrow=TT,ncol=p)
E <- matrix(c(seq(5/TT,5,5/TT)),nrow=TT,ncol=p)
for (i in c(1:p)){
  X[,i] = sample(seq(1,10,0.125),1) * (X[,sample(1:p,1)] + U[,sample(1:p,1)] + E[,sample(1:p,1)] + sample(seq(1,10,0.125),1) * one)
  U[,i] = sample(seq(1,10,0.125),1) * (U[,sample(1:p,1)] + X[,sample(1:p,1)] + E[,sample(1:p,1)] + sample(seq(1,10,0.125),1) * one)
  E[,i] = sample(seq(1,10,0.125),1) * (E[,sample(1:p,1)] + X[,sample(1:p,1)] + U[,sample(1:p,1)] + sample(seq(1,10,0.125),1) * one)
}
Y <- matrix(c(X[,2:p],seq(20/TT,10+10/TT,10/TT)),nrow=TT,ncol=p)
Z <- matrix(c(one,X,U),nrow=TT,ncol=2*p+1)
D <- solve((t(Z) %*% Z)) %*% t(Z) %*% Y[,1]