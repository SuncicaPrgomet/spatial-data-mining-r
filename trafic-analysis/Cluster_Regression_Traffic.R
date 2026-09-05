vozila<-read.csv("C:/Users/1/Desktop/uzi priprema/fcd_2085.csv.1")
vozila_pomocni<-vozila[1:100,]
vozila_pomocni
trake<-c()
for(i in 1:100){
  trake=append(trake,vozila_pomocni[i,"lane"])
}
trake<-unique(trake)
trake 

x<-c()
y<-c()
br_automobila_svake_trake<-c()
niz_duljina<-c()
vozila_novo<-c()
for(i in 1:length(trake)){
  traka<-NULL
  traka=rbind(traka,vozila[vozila$lane==trake[i],])
  vozila_novo=append(vozila_novo,vozila[vozila$lane==trake[i],"id"])
  br_automobila_svake_trake=append(br_automobila_svake_trake,nrow(traka))
  x=append(x,traka[,"x"])
  y=append(y,traka[,"y"])
  pomocni_niz<-c()
  for(k in 1:nrow(traka)-1){
    pomocni_niz=append(pomocni_niz,sqrt((traka[k+1,"y"]-traka[k,"y"])^2 +(traka[k+1,"x"]-traka[k,"x"])^2))
  }
  niz_duljina<-append(niz_duljina,sum(pomocni_niz))
}
plot(x,y,type="l")
br_automobila_svake_trake
niz_duljina

niz_gustoca<-c()
for(i in 1:length(trake)){
  niz_gustoca=append(niz_gustoca,niz_duljina[i]/br_automobila_svake_trake[i])
}
niz_gustoca
plot(niz_gustoca)

install.packages("cluster")
kc2<-kmeans(niz_gustoca,3)
plot(niz_gustoca,col=kc2$cluster)
points(kc2$centers,col=1:3,pch=8,cex=2)

#razrstaj(stablo) u ovisnosti o duljini prometnice
trake_sa_podacima<-NULL
for(i in 1:length(trake)){
  trake_sa_podacima=rbind(trake_sa_podacima,trake[i])
}
trake_sa_podacima <- cbind(niz_duljina,trake_sa_podacima)
trake_sa_podacima<-cbind(niz_gustoca,trake_sa_podacima)
colnames(trake_sa_podacima)[3] ="ime"
trake_sa_podacima<-data.frame(trake_sa_podacima)


skup_no<-sample(2,nrow(trake_sa_podacima),replace = TRUE,prob=c(0.7,0.3))
skup_za_treniranje<-trake_sa_podacima[skup_no==1,]
skup_za_testiranje<-trake_sa_podacima[skup_no==2,]

install.packages("rpart")
library("rpart")
stablo_tree<-rpart(niz_duljina~niz_gustoca,data=skup_za_treniranje,method = "anova")
plot(stablo_tree)
evaluacija<-predict(stablo_tree,newdata = skup_za_testiranje)

xlim <- as.numeric(range(skup_za_treniranje$niz_duljina))
plot(evaluacija ~ skup_za_treniranje$niz_duljina, data=skup_za_treniranje, xlab="Stvarne",
     ylab="Predvidene", ylim=xlim, xlim=xlim)
abline(a=0, b=1)

set.seed(123)
skup_no <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
skup_za_treniranje <- iris[skup_no==1,]
skup_za_testiranje <- iris[skup_no==2,]

zavisnosti2 <- Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width
perunika_rpart_stablo2 <- rpart(zavisnosti2, data=skup_za_treniranje,
                                control=rpart.control(minsplit=10))
eval <- predict(perunika_rpart_stablo2, newdata=skup_za_testiranje)
xlim <- range(skup_za_testiranje$Sepal.Length)
plot(eval ~ skup_za_testiranje$Sepal.Length, data=skup_za_testiranje, xlab="Stvarne",
     ylab="Predvidene", ylim=xlim, xlim=xlim)
abline(a=0, b=1)

