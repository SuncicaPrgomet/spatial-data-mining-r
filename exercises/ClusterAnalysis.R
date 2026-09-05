#Prvi dio
# Na skupu Perunike primijenite algoritme:
#   • iz obitelji k-centara
# – s variranjem k parametra
head(iris)
iris2 <- iris
iris2$Species <- NULL #uklonimo info o vrsti
kc <- kmeans(iris2, 3)
kc
# K-means clustering with 3 clusters of sizes 38, 62, 50
# 
# Cluster means:
#   Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     6.850000    3.073684     5.742105    2.071053
# 2     5.901613    2.748387     4.393548    1.433871
# 3     5.006000    3.428000     1.462000    0.246000
# 
# Clustering vector:
#   [1] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
# [36] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
# [71] 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 1 1 1
# [106] 1 2 1 1 1 1 1 1 2 2 1 1 1 1 2 1 2 1 2 1 1 2 2 1 1 1 1 1 2 1 1 1 1 2 1
# [141] 1 1 2 1 1 1 2 1 1 2
# 
# Within cluster sum of squares by cluster:
#   [1] 23.87947 39.82097 15.15100
# (between_SS / total_SS =  88.4 %)
# 
# Available components:
#   
#   [1] "cluster"      "centers"      "totss"        "withinss"    
# [5] "tot.withinss" "betweenss"    "size"         "iter"        
# [9] "ifault" 
names(kc)
# [1] "cluster"      "centers"      "totss"        "withinss"    
# [5] "tot.withinss" "betweenss"    "size"         "iter"        
# [9] "ifault" 
kc$centers
# Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     6.850000    3.073684     5.742105    2.071053
# 2     5.901613    2.748387     4.393548    1.433871
# 3     5.006000    3.428000     1.462000    0.246000
kc$size
#[1] 38 62 50
table(iris$Species, kc$cluster) #koliko el grupirano u pogresne grupe
# 
# 1  2  3
# setosa      0  0 50
# versicolor  2 48  0
# virginica  36 14  0
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kc$cluster)
points(kc$centers[,c("Sepal.Length", "Sepal.Width")],
       col = 1:3, pch = 8, cex=2)

plot(iris2[c("Petal.Length", "Petal.Width")], col = kc$cluster)
points(kc$centers[,c("Petal.Length", "Petal.Width")],
       col = 1:3, pch = 8, cex=2)

#– ne birajući parametar k
install.packages("fpc")
library(fpc)
grupe <- pamk(iris2)  
grupe
# $pamobject
# Medoids:
#   ID Sepal.Length Sepal.Width Petal.Length Petal.Width
# [1,]   8          5.0         3.4          1.5         0.2
# [2,] 127          6.2         2.8          4.8         1.8
# Clustering vector:
#   [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
# [71] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2
# [106] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
# [141] 2 2 2 2 2 2 2 2 2 2
# Objective function:
#   build      swap 
# 0.9901187 0.8622026 
# 
# Available components:
#   [1] "medoids"    "id.med"     "clustering" "objective"  "isolation" 
# [6] "clusinfo"   "silinfo"    "diss"       "call"       "data"      
# 
# $nc
# [1] 2
# 
# $crit
# [1] 0.0000000 0.6857882 0.5528190 0.4896972 0.4867481 0.4703951 0.3390116
# [8] 0.3318516 0.2918520 0.2918482
grupe$nc #br grupa
#[1] 2
table(grupe$pamobject$clustering, iris$Species)

# 
# setosa versicolor virginica
# 1     50          1         0
# 2      0         49        50

#– koriteći centroide i medoide kao centre grupa
#centroidi
g <- kmeans(iris2, 3)
g
g$centers   
# Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     5.006000    3.428000     1.462000    0.246000
# 2     6.850000    3.073684     5.742105    2.071053
# 3     5.901613    2.748387     4.393548    1.433871
g$size
# [1] 50 38 62
table(iris$Species, g$cluster) #matrica zabune
# 
# 1  2  3
# setosa     50  0  0
# versicolor  0  2 48
# virginica   0 36 14
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = g$cluster)
points(g$centers[,c("Sepal.Length", "Sepal.Width")],col = 1:3, pch = 8, cex=2)  

#medoidi
library(cluster)
g2 <- pam(iris2, 3)            
table(g2$clustering, iris$Species)#matrica zabune
# 
# setosa versicolor virginica
# 1     50          0         0
# 2      0         48        14
# 3      0          2        36
layout(matrix(c(1,2),1,2))        
plot(g2)
g3 <- clara(iris2, 3)             
table(g3$clustering, iris$Species)#matrica zabune
# 
# setosa versicolor virginica
# 1     50          0         0
# 2      0         48        13
# 3      0          2        37
layout(matrix(c(1,2),1,2))        
plot(g3)


# • za hijerarhijsko grupiranje
library(stats)
idx <- c(1:10,51:60,101:110)
hg <- hclust(dist(iris2[idx,]), method="average")
hg
# Call:
#   hclust(d = dist(iris2[idx, ]), method = "average")
# 
# Cluster method   : average 
# Distance         : euclidean 
# Number of objects: 30 
plot(hg, hang = -1, labels=iris$Species[idx])
rect.hclust(hg, k=3) #rezanje na 3 grupe

plot(hg, hang = -1, labels=iris$Species[idx])
rect.hclust(hg, k=4) #rezanje na 4 grupe

#2.) odozdo
dg <- diana(dist(iris2[idx,]))
dg
# Merge:
#   [,1] [,2]
# [1,]   -1   -5
# [2,]   -2  -10
# [3,]    1   -8
# [4,]  -15  -19
# [5,]   -3   -7
# [6,]  -11  -13
# [7,]  -12  -17
# [8,]   -4   -9
# [9,]  -21  -25
# [10,]    2    5
# [11,]  -14  -20
# [12,]  -26  -28
# [13,]   10    8
# [14,]    7    4
# [15,]  -24  -29
# [16,]    6   14
# [17,]   11  -16
# [18,]  -23   12
# [19,]    3   13
# [20,]   17  -27
# [21,]   18  -30
# [22,]    9   15
# [23,]   16  -22
# [24,]   19   -6
# [25,]   22   21
# [26,]   23   20
# [27,]   24  -18
# [28,]   26   25
# [29,]   27   28
# Order of objects:
#   [1] 1   5   8   2   10  3   7   4   9   6   58  51  53  52  57  55  59 
# [18] 102 54  60  56  107 101 105 104 109 103 106 108 110
# Height:
#   [1] 0.1414214 0.2236068 0.9219544 0.1732051 0.5099020 0.2645751 0.5567764
# [8] 0.3000000 1.4594520 2.3874673 6.3953108 0.2645751 0.7348469 0.2645751
# [15] 0.5916080 0.2449490 1.4491377 2.2427661 0.5196152 0.7937254 0.9433981
# [22] 3.6918830 0.5099020 1.1532563 0.6000000 1.6703293 0.8602325 0.5291503
# [29] 1.0148892
# Divisive coefficient:
#   [1] 0.912666
# 
# Available components:
#   [1] "order"     "height"    "dc"        "merge"     "diss"      "call"     
# [7] "order.lab"
plot(dg, labels=iris$Species[idx], which = 2)
rect.hclust(dg, k=3) #rezanje na 3 grupe
rect.hclust(dg, k=4) ##rezanje na 4 grupe

#Drugi dio
#Nakupine se ne preklapaju:
N <- 25
g1 <- cbind(rnorm(N, mean=12), rnorm(N, mean=16))
g2 <- cbind(rnorm(N, mean=16), rnorm(N, mean=15))
g3 <- cbind(rnorm(N, mean=15), rnorm(N, mean=23))
g4 <- cbind(rnorm(N, mean=15), rnorm(N, mean=20))
g5 <- cbind(rnorm(N, mean=19), rnorm(N, mean=29))
g6 <- cbind(rnorm(N, mean=26), rnorm(N, mean=31))
g7 <- cbind(rnorm(N, mean=23), rnorm(N, mean=28))
g8 <- cbind(rnorm(N, mean=25), rnorm(N, mean=25))
tocke <- rbind(g1,g2,g3,g4,g5,g6,g7,g8)

kc1 <- kmeans(tocke, 5)
plot(tocke,col = kc1$cluster)
points(kc1$centers,col = 1:5,pch = 8,cex = 2)
#lose grupirano

#DBSCAN
gg1 <- dbscan(tocke,eps = 5,showplot = 1)
plot(gg1,tocke)
#dobro grupirano

#Nakupine se preklapaju:
k1 <- cbind(rnorm(10, mean=21), rnorm(10, mean=19))
k2 <- cbind(rnorm(15, mean=17), rnorm(15, mean=20))
k3 <- cbind(rnorm(20, mean=17), rnorm(20, mean=22))
k4 <- cbind(rnorm(25, mean=15), rnorm(25, mean=20))
k5 <- cbind(rnorm(10, mean=20), rnorm(10, mean=24))
tocke2 <- rbind(k1,k2,k3,k4,k5)
plot(tocke2)

kc2 <- kmeans(tocke2, 5)
plot(tocke2,col = kc2$cluster)
points(kc1$centers,col = 1:5,pch = 8,cex = 2)
#dobro grupirano

#DBSCAN
gg2 <- dbscan(tocke2,eps = 5,showplot = 1)
plot(gg2,tocke2)
#lose grupirano


