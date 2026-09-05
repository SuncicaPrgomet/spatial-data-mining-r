#Istraživanje nad podatcima women

#osnovno o podacima
typeof(women)
#[1] "list"
class(women)
#[1] "data.frame"
names(women)
#[1] "height" "weight"
dim(women)
#[1] 15  2
str(women)
# 'data.frame':	15 obs. of  2 variables:
#   $ height: num  58 59 60 61 62 63 64 65 66 67 ...
# $ weight: num  115 117 120 123 126 129 132 135 139 142 ...
attributes(women)
# $names
# [1] "height" "weight"
# 
# $class
# [1] "data.frame"
# 
# $row.names
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
women[1:5,] 
# height weight
# 1     58    115
# 2     59    117
# 3     60    120
# 4     61    123
# 5     62    126
head(women)
# height weight
# 1     58    115
# 2     59    117
# 3     60    120
# 4     61    123
# 5     62    126
# 6     63    129
tail(women)
# height weight
# 10     67    142
# 11     68    146
# 12     69    150
# 13     70    154
# 14     71    159
# 15     72    164

##stat info
summary(women) 
# height         weight     
# Min.   :58.0   Min.   :115.0  
# 1st Qu.:61.5   1st Qu.:124.5  
# Median :65.0   Median :135.0  
# Mean   :65.0   Mean   :136.7  
# 3rd Qu.:68.5   3rd Qu.:148.0  
# Max.   :72.0   Max.   :164.0 

#osnovni prikaz pod
visina=women$height
tezina=women$weight
hist(visina,main="Histogram parametra visina")
hist(tezina,main="Histogram paramtera tezina")
plot(density(visina))
plot(density(tezina))
razdioba <- density(visina)
str(razdioba)
# List of 7
# $ x        : num [1:512] 51 51 51.1 51.1 51.2 ...
# $ y        : num [1:512] 0.000168 0.000181 0.000195 0.000209 0.000224 ...
# $ bw       : num 2.34
# $ n        : int 15
# $ call     : language density.default(x = visina)
# $ data.name: chr "visina"
# $ has.na   : logi FALSE
# - attr(*, "class")= chr "density"
plot(razdioba$x)

#odnos medu podacima
cov(visina,tezina)
#[1] 69
cor(visina,tezina)
#[1] 0.9954948

#prikaz podataka,osnovni R paketima
with(women, plot(visina, tezina))
pairs(iris)

#dodatni paketi
#koristila u sljedecem zad,ovde nema klasa


#Istraživanje nad podatcima ToothGrowth
str(ToothGrowth)
# 'data.frame':	60 obs. of  3 variables:
#   $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
# $ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
# $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...
ToothGrowth[1:5,] #izvuc dio data framea
# len supp dose
# 1  4.2   VC  0.5
# 2 11.5   VC  0.5
# 3  7.3   VC  0.5
# 4  5.8   VC  0.5
# 5  6.4   VC  0.5
ToothGrowth[1:5,"len"] #izvuci dio stupca data framea

#stat
summary(ToothGrowth)
# len        supp         dose      
# Min.   : 4.20   OJ:30   Min.   :0.500  
# 1st Qu.:13.07   VC:30   1st Qu.:0.500  
# Median :19.25           Median :1.000  
# Mean   :18.81           Mean   :1.167  
# 3rd Qu.:25.27           3rd Qu.:2.000  
# Max.   :33.90           Max.   :2.000 

#osnovni prikaz pod
len=ToothGrowth$len
supp=ToothGrowth$supp
dose=ToothGrowth$dose


hist(len,main="Histogram parametra len")
hist(dose,main="Histogram parametra dose")
plot(density(len))
plot(density(dose))
razdioba <- density(len)
str(razdioba)
# List of 7
# $ x        : num [1:512] -4.91 -4.81 -4.72 -4.63 -4.53 ...
# $ y        : num [1:512] 4.19e-05 4.63e-05 5.11e-05 5.62e-05 6.19e-05 ...
# $ bw       : num 3.04
# $ n        : int 60
# $ call     : language density.default(x = len)
# $ data.name: chr "len"
# $ has.na   : logi FALSE
# - attr(*, "class")= chr "density"
plot(razdioba$x)
table(ToothGrowth$supp)
# OJ VC 
# 30 30 
pie(table(ToothGrowth$supp))
barplot(table(ToothGrowth$supp))

#odnos medu podacima
cov(len,dose)
#[1] 3.861299
cor(len,dose)
#[1] 0.8026913
aggregate(len, list(supp), var) #usporedba var
# Group.1        x
# 1      OJ 43.63344
# 2      VC 68.32723
#ili
aggregate(len ~ supp, var, data=ToothGrowth)
# supp      len
# 1   OJ 43.63344
# 2   VC 68.32723
aggregate(dose, list(supp), var)
# Group.1         x
# 1      OJ 0.4022989
# 2      VC 0.4022989
aggregate(cbind(len,dose)~supp,var,data=ToothGrowth)
# supp      len      dose
# 1   OJ 43.63344 0.4022989
# 2   VC 68.32723 0.4022989


#prikaz podataka,osnovni R paketima
with(ToothGrowth, plot(len, dose))
#sa sumom
with(ToothGrowth, {
  plot(jitter(len, factor=5),
       jitter(dose, factor=5),
       col=supp, pch=as.numeric(supp))
})
boxplot(len~supp, data=ToothGrowth)
boxplot(dose~supp, data=ToothGrowth)
pairs(ToothGrowth)

#dodatni paketi
#scatterplot
library(scatterplot3d)
scatterplot3d(len, dose,,
              color=as.numeric(supp), pch=as.numeric(supp))

#lattice
library(lattice)
cloud(len~dose*len| supp, data=ToothGrowth,
      main="3D prikaz u ovisnosti o supp")
levelplot(len~dose*len, data=ToothGrowth,
          col.regions=rainbow)

#mass
library(MASS)
novi<-ToothGrowth[1:3][-2]
novi
parcoord(novi, col=supp)

##ggplot2
library(ggplot2)
qplot(len, dose, data=ToothGrowth,
      color=as.numeric(supp))

f <- function(a,b,c){
  print("Stat info: ")
  print(summary(a))
  hist(b)
  hist(c)
  print("Kovarijanca: ")
  print(cov(b,c))
  print("Korelacija: ")
  print(cor(b,c))
  pairs(a)
}

f(women,visina,tezina)
f(ToothGrowth,len,dose)
