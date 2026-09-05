load("jadran.Rda")
dim(wind_data)
str(wind_data)
dim(lon)
dim(lat)
plot(lon,lat,col="blue", xlab="lon", ylab="lat", main = "Tocke u Jadranu")
jadran <- matrix(cbind(lon,lat),1106,2)
colnames(jadran) <- c("Lon","Lat")
jadran <- data.frame(jadran)
jadran
set.seed(105)
uzorak <- sample(1:1106,500)
podaci <- jadran[uzorak,]
plot(podaci, col="blue",main = "Uzorak: 500 tocaka")

install.packages("cluster")
kc<-kmeans(podaci,3)
plot(podaci,col=kc$cluster)
points(kc$centers,col=1:3,pch=8,cex=2)

grupe <- matrix(kc$cluster, 500,1)
grupe<-as.factor(grupe)
podaci <- cbind(grupe,podaci)
podaci

skup_no<-sample(2,nrow(podaci),replace = TRUE,prob=c(0.7,0.3))
skup_za_treniranje<-podaci[skup_no==1,]
skup_za_testigranje<-podaci[skup_no==2,]

install.packages("C50")
library("C50")
stablo<-C5.0(grupe~Lon+Lat,data=skup_za_treniranje)
plot(stablo,type="simple")
rez_test<-predict(stablo,newdata = skup_za_testiranje)
table(rez_test,skup_za_testiranje$grupe)

set.seed(105)
rnd<-sample(1:500,1)
tocka<-podaci[rnd,]
tocka
# Lon   Lat
# 813 19.25 41.25
plot(podaci, col="blue",main = "Uzorak: 500 tocaka")
par(new=TRUE)
plot(tocka,col="red")

okolina<-podaci[abs(podaci$Lon-tocka$Lon)<0.5 & abs(podaci$Lat-tocka$Lat)<0.5 
                & (podaci$Lon!=tocka$Lon | podaci$Lat!=tocka$Lat),]
nrow(okolina) #20 okolnih tocaka
tocka_vjetar_u<-wind_data[813,]
tocka_vjetar_v<-wind_data[813+1106,]

okolina_u<-NULL
okolina_v<-NULL

for(i in 1:20){
  okolina_u<-cbind(okolina_u,wind_data[which(jadran$Lon==okolina[i,1] & jadran$Lat==okolina[i,2]),])
  okolina_v <- cbind(okolina_v, wind_data[(which(jadran$Lon == okolina[i,1] & jadran$Lat == okolina[i,2])) + 1106,])
  
}

cor(tocka_vjetar_u,okolina_u)
cor(tocka_vjetar_v,okolina_v)

zav_u <- lm(tocka_vjetar_u ~ okolina_u, subset = c(1:as.integer(0.7*54056)))
zav_v <- lm(tocka_vjetar_v ~ okolina_v, subset = c(1:as.integer(0.7 * 54056)))

sum(zav_u$coefficients*c(1,okolina_u[1,]))
tocka_vjetar_u[1]

sum(zav_v$coefficients*c(1,okolina_v[1,]))
tocka_vjetar_v[1]





