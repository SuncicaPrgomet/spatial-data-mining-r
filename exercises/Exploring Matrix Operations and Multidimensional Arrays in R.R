#Operacije s matricama - funkcija diag()
(A <- matrix(1:25, 5, 5))
(B <- matrix(1:25, 5, 5, byrow = T))
(x <- seq(2, 10, by=2))
diag(x) #daje dijagonalnu matricu od niza
diag(A ) #daje dijagonalne elemente matrice
diag(c(5))
diag(c(5,5,5))
diag(diag(A))

#Operacije s matricama - zanimljivosti
library(MASS)
solve(A, x) # y = A^{-1} x
solve(A) # inverz
ginv(A) #Moore–Penrose inverse
# radi li ?ginv - možda trebate instalirati paket MASS

svd(A) #singular-value decomposition of a rectangular matrix
eigen(A) #svojstvene vrijednosti i svojstveni vektori 
qr(A) #qr dekompozicija
chol(A) #Choleski factorizacija

#Još neke operacije s matricama
cbind(A,B) #column bind
rbind(A,B,diag(x)) #row bind
rowMeans(A)
rowSums(A)
colMeans(A)
colSums(A)

#Matrica udaljenosti
B[upper.tri(B)]<-t(B)[upper.tri(B)]
diag(B)<-0

#Višedimenzionalno polje
vector1 <- c(5, 9, 3)
vector2 <- c(10, 11, 12, 13, 14, 15)
polje <- array(c(vector1, vector2), dim = c(3, 3, 2))
polje


ucenici1.<-c("Ana","Ivan")
ucenici2.<-c("Ante","Lea","Anamarija")
ucenici3.<-c("Josip")
lista<-list(list1=ucenici1.,list2=ucenici2.,list3=ucenici3.)
imena<-list("1. raz","2. raz","3. raz")
names(lista)<-c(imena)
lista

prezimena<-c("Anic","Peric","Tomic")
br<-c(6,7,5)
palcevanje<-c(10,2,1)

lista<-list(list1=ucenici2.,list2=prezimena,list3=br,list4=palcevanje)
lista
imena<-list("imena","prezimena","br","palcevanje")
names(lista)<-c(imena)
lista
