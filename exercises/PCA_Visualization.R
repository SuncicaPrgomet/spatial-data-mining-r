####Prvi dio - priprema####

# učitavanjem (grafičkih) biblioteka koje ću koristiti
install.packages("scatterplot3d")
library(scatterplot3d)
install.packages("rgl")
library(rgl)


set.seed(100)
n <- 200
m <- 20*n
theta <- seq(0, 2*pi, length=n)
phi <- seq(0, 2*pi, length=m)
r <- 2
x1 <- 3*theta*cos(phi) + rnorm(m, sd=0.5)
x1
y1 <- 3*theta*sin(phi) + rnorm(m, sd=0.5)
z1 <- r*phi + rnorm(m, sd=0.5)

lim <- range(c(x1, y1, z1))
podatci1 <- cbind(x1,y1,z1)
podatci1
gl.rez <- princomp(podatci1)
gl.rez
# Call:
#   princomp(x = podatci1)
# 
# Standard deviations:
#   Comp.1    Comp.2    Comp.3 
# 101.83621   7.73321   7.72488 
# 
# 3  variables and  4000 observations.
gl.osi <- gl.rez$loadings

gl.osi
# Loadings:
#   Comp.1 Comp.2 Comp.3
# x1         0.387  0.922
# y1        -0.922  0.387
# z1  1.000              
# 
# Comp.1 Comp.2 Comp.3
# SS loadings     1.000  1.000  1.000
# Proportion Var  0.333  0.333  0.333
# Cumulative Var  0.333  0.667  1.000
gl.proj <- gl.rez$scores 
gl.proj

s3d <- scatterplot3d(podatci1, xlim=lim, ylim=lim, zlim=lim,
                     xlab="",ylab="",zlab="",grid=FALSE,
                     main="Podatci i PCA osi")
s3d$points3d(rbind(c(0,0,0), gl.osi[,1]), type="l", lwd=3, col="red")
s3d$points3d(rbind(c(0,0,0), gl.osi[,2]), type="l", lwd=3, col="green")
s3d$points3d(rbind(c(0,0,0), gl.osi[,3]), type="l", lwd=3, col="blue")


plot3d(podatci1, aspect="iso")
decorate3d(main="Podatci i PCA osi")
plot3d(rbind(c(0,0,0), gl.osi[,1]), type="l", lwd=3, col="red", add=TRUE)
plot3d(rbind(c(0,0,0), gl.osi[,2]), type="l", lwd=3, col="green", add=TRUE)
plot3d(rbind(c(0,0,0), gl.osi[,3]), type="l", lwd=3, col="blue", add=TRUE)

x2 <- 3*theta*cos(phi) + rnorm(m, sd=0.5)
y2 <- 3*theta*sin(phi) + rnorm(m, sd=0.5)
z2 <- r*phi + rnorm(m, sd=0.5)
e <-(theta**6)*sin(theta) + rnorm(m, sd=0.5)
f <- r*phi + rnorm(m, sd=0.5)
podatci2 <- cbind(x2,y2,z2,e,f)
podatci2
summary(podatci2)
# x2                   y2                  z2        
# Min.   :-19.771079   Min.   :-19.82804   Min.   :-1.473  
# 1st Qu.: -4.943717   1st Qu.: -4.91216   1st Qu.: 3.160  
# Median :  0.005487   Median : -0.01021   Median : 6.295  
# Mean   :  0.003558   Mean   : -0.00310   Mean   : 6.285  
# 3rd Qu.:  4.983407   3rd Qu.:  4.94296   3rd Qu.: 9.451  
# Max.   : 19.886938   Max.   : 19.71054   Max.   :13.944  
# e                    f         
# Min.   :-19559.592   Min.   :-1.114  
# 1st Qu.: -8409.160   1st Qu.: 3.127  
# Median :    -0.883   Median : 6.332  
# Mean   : -4589.202   Mean   : 6.282  
# 3rd Qu.:    14.081   3rd Qu.: 9.437  
# Max.   :   166.858   Max.   :13.736 
lim2 <- range(c(x2, y2, z2,e,f))
# Call:
#   princomp(x = podatci2)
# 
# Standard deviations:
#   Comp.1       Comp.2       Comp.3       Comp.4       Comp.5 
# 6749.2957649    8.6309510    7.7337618    3.4291013    0.4888113 
# 
# 5  variables and  4000 observations.

gl.rez2 <- princomp(podatci2)
gl.rez2
gl.osi2 <- gl.rez2$loadings 
gl.osi2
# Loadings:
#   Comp.1 Comp.2 Comp.3 Comp.4 Comp.5
# x2                0.999              
# y2        -0.873        -0.485       
# z2         0.344        -0.619  0.706
# e  -1.000                            
# f          0.344        -0.617 -0.708
# 
# Comp.1 Comp.2 Comp.3 Comp.4 Comp.5
# SS loadings       1.0    1.0    1.0    1.0    1.0
# Proportion Var    0.2    0.2    0.2    0.2    0.2
# Cumulative Var    0.2    0.4    0.6    0.8    1.0
gl.proj2 <- gl.rez2$scores 

pv <- cumsum(gl.rez2$sdev^2)/sum(gl.rez2$sdev^2)
plot(1:ncol(podatci2), pv, type="b", ylim=c(0,1),
     col="red", xlab="Broj komponenti",
     ylab="Varijanca")
lines(1:ncol(podatci2), (gl.rez2$sdev^2)/sum(gl.rez2$sdev^2),
      type="b", col="blue")

##ovo se ne moze nacrtit

####Drugi dio - samostalan rad####
###ZADATAK 1
#podatci1:

xlim <- c(0,1)
ylim <- c(0,1)

plot(gl.proj[,1], gl.proj[,2], main="Projekcija na prve dvije glavne osi PCA",
     xlab="PCAos1", ylab="PCAos2")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="red", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="green", lwd=8)

plot(gl.proj[,2], gl.proj[,3], main="Projekcija na druge dvije glavne osi PCA",
     xlab="PCAos2", ylab="PCAos3")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="green", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="blue", lwd=8)

plot(gl.proj[,3], gl.proj[,1], main="Projekcija na prvu i trecu os PCA",
     xlab="PCAos3", ylab="PCAos1")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="red", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="green", lwd=8)

#podatci2:

plot(gl.proj2[,1], gl.proj2[,2], main="Projekcija na os1 i os2", xlab="PCAos1", ylab="PCAos2")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="red", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="green", lwd=8)

plot(gl.proj2[,2], gl.proj2[,3], main="Projekcija na os2 i os3", xlab="PCAos2", ylab="PCAos3")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="green", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="blue", lwd=8)

plot(gl.proj2[,3], gl.proj2[,4], main="Projekcija na os3 i os4", xlab="PCAos3", ylab="PCAos4")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="red", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="green", lwd=8)

plot(gl.proj2[,4], gl.proj2[,5], main="Projekcija na os4 i os5", xlab="PCAos4", ylab="PCAos5")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="green", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="blue", lwd=8)

plot(gl.proj2[,5], gl.proj2[,1], main="Projekcija na os5 i os1", xlab="PCAos5", ylab="PCAos1")
segments(xlim[1], ylim[1], xlim[2], ylim[1], col="green", lwd=8)
segments(xlim[1], ylim[1], xlim[1], ylim[2], col="blue", lwd=8)

###ZADATAK2
set.seed(123) # radi ponovljivosti
n <- 200
m <- 20*n
theta <- seq(0, 2*pi, length=n)
phi <- seq(0, 2*pi, length=m)
R <- 5
r <- 2
x <- (R + r*cos(theta))*cos(phi) + rnorm(m, sd=0.5)
y <- (R + r*cos(theta))*sin(phi) + rnorm(m, sd=0.5)
z <- r*sin(theta) + rnorm(m, sd=0.5)
lim <- range(c(x, y, z))
podatci <- cbind(x,y,z)

podatci3 <- podatci1 + podatci
podatci3
prcomp(podatci3, scale = TRUE)
# Standard deviations (1, .., p=3):
#   [1] 1.2925111 0.9999604 0.5740158
# 
# Rotation (n x k) = (3 x 3):
#   PC1          PC2         PC3
# x1 -0.02762421  0.999295538 -0.02540335
# y1  0.70658873  0.037496148  0.70663031
# z1 -0.70708505 -0.001570385  0.70712677
prcomp(podatci3, scale = FALSE)
# Standard deviations (1, .., p=3):
#   [1] 11.325624 10.989550  2.804617
# 
# Rotation (n x k) = (3 x 3):
#   PC1          PC2          PC3
# x1 -0.05182619  0.998615969 -0.008955041
# y1  0.96789357  0.052436229  0.245830188
# z1 -0.24595952 -0.004072916  0.969271544
prcomp(podatci3, center = TRUE)
# Standard deviations (1, .., p=3):
#   [1] 11.325624 10.989550  2.804617
# 
# Rotation (n x k) = (3 x 3):
#   PC1          PC2          PC3
# x1 -0.05182619  0.998615969 -0.008955041
# y1  0.96789357  0.052436229  0.245830188
# z1 -0.24595952 -0.004072916  0.969271544
prcomp(podatci3, center = FALSE)
# Standard deviations (1, .., p=3):
#   [1] 11.47573 10.98956  6.62332
# 
# Rotation (n x k) = (3 x 3):
#   PC1         PC2         PC3
# x1 -0.04707375  0.99880455 -0.01317283
# y1  0.93587652  0.04871004  0.34894480
# z1 -0.34916931 -0.00409800  0.93705069

#cor-treba li korisiti matricu cov ili cor
princomp(podatci3, cor = FALSE)
# Call:
#   princomp(x = podatci3, cor = FALSE)
# 
# Standard deviations:
#   Comp.1    Comp.2    Comp.3 
# 11.324208 10.988176  2.804266 
# 
# 3  variables and  4000 observations.
princomp(podatci3, cor = TRUE)
# Call:
#   princomp(x = podatci3, cor = TRUE)
# 
# Standard deviations:
#   Comp.1    Comp.2    Comp.3 
# 1.2925111 0.9999604 0.5740158 
# 
# 3  variables and  4000 observations.
?princomp
