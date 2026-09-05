#prvi dio ponavljanje
library(forecast)
rez1 <- stl(nottem, s.window=7)
plot(rez1)
#odnos trenda prema signalu
plot(nottem, col="gray", ylab="Prosjecna temp", xlab="Mjeseci")
lines(rez1$time.series[,2], col="red", ylab="Trend")

rez2<-stl(AirPassengers,s.window = 7) 
rez2
sez<-rez2$time.series[,"seasonal"]
sez
rez2
ppp <- predict(arima(window(sez,c(1950,1),c(1956,12)), order = c(10,0,0)), n.ahead = 20)
plot(sez, xlim=c(1950,1970))
lines(ppp$pred, col="red")


ppp <- predict(ar(window(sez, c(1950,1),c(1956,12))), n.ahead = 150)
plot(sez, xlim=c(1950,1970))
lines(ppp$pred, col="red")

#drugi dio samostalan rad
Tr <- rez2$time.series[,2] #trend-ciklus
S <- rez2$time.series[,1] #sezonska komponenta
E <- rez2$time.series[,3] #sum

plot(Tr)
plot(S)
plot(E)

signal1<-Tr+S
signal2<-signal1+E

plot(signal1)
plot(signal2)

rez_signal1<-stl(signal1, s.window=7)
rez_signal2<-stl(signal2, s.window=7)
plot(rez_signal1)
plot(rez_signal2)


