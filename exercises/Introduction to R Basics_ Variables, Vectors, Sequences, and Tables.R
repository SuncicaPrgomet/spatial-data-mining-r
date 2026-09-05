#pridru?ivanje vrijednosti varijabli
assign("a",1)
1->b
x<-c(4,5,6)
(y<-c(7,8,9))
#7 8 9
#?to se dogodi kada od vektora zatra?imo vrijednost na indeksu koji prelazi opseg/duljinu vektora

x[length(x)+2]
#ispi?e "NA"
#?to je NA?
#NA je logi?ka konstanta,a NA je kratica ta "Not Available" , to nam vrati prethodna naredba
#NA se koristi kada podaci nisu dostupni, nedostaju ili su nepouzdani

#vektorizacija
x+y
#11 13 15

#pretvorba i iznuda vrste vrijednosti

#Koje naredbe su na?inile pretvorbu vrste vrijednosti, a u kojim naredbama je na?injena iznuda vrste vrijednosti?

imena <- c("Ivana", "Ana", "Marija")
mode(imena)
br1 <- c(1,2,3)
mode(br1)
mode(br1) <- "character" #pretvorba vrste vrijednosti
br1
mode(br1)
br2 <- c(1,2,"3")#iznuda vrte vrijednosti
mode(br2)

#generiranje i repliciranje niza

#Generirajte niz koriste?i se operatorom : i funkcijom seq()
seq(from=1,to=100,by=2)
#[1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41
#[22] 43 45 47 49 51 53 55 57 59 61 63 65 67 69 71 73 75 77 79 81 83
#[43] 85 87 89 91 93 95 97 99
seq(from=2,to=200,length=20)
# [1]   2.00000  12.42105  22.84211  33.26316  43.68421  54.10526
#[7]  64.52632  74.94737  85.36842  95.78947 106.21053 116.63158
#[13] 127.05263 137.47368 147.89474 158.31579 168.73684 179.15789
#[19] 189.57895 200.00000

#Napravite periodi?an niz koriste?i se naredbom rep()

rep(1:5,len=50)
#[1] 1 2 3 4 5
rep(1:5,each=4)
#[1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1
#[32] 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
rep(1:5,times=4)
#[1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5

##Kako repliciramo faktore?
gl(4,1,labels=c("Matematika", "Hrvatski", "Likovni", "Tjelesni"))
rep(gl(4,1,labels=c("Matematika", "Hrvatski", "Likovni", "Tjelesni")),time=3)
#[1] Matematika Hrvatski   Likovni    Tjelesni   Matematika
#[6] Hrvatski   Likovni    Tjelesni   Matematika Hrvatski  
#[11] Likovni    Tjelesni  
#Levels: Matematika Hrvatski Likovni Tjelesni

rep(c("polozen","polozen","nije polozen"),time=3)
#[1] "polozen"      "polozen"      "nije polozen" "polozen"     
#[5] "polozen"      "nije polozen" "polozen"      "polozen"     
#[9] "nije polozen"

#Tablice
#Na?ini tablicu i iz nje izvuci vrijednosti realtivnih i grani?nih4frekvencija5

pred<-c("A","B","C")
tab<-matrix(rep(1:15,time=2),ncol=3)
colnames(tab)<-pred
rownames(tab)<-c(1,2,3,4,5,6,7,8,9,10)
tab
# A  B  C
#1   1 11  6
#2   2 12  7
#3   3 13  8
#4   4 14  9
#5   5 15 10
#6   6  1 11
#7   7  2 12
#8   8  3 13
#9   9  4 14
#10 10  5 15

margin.table(tab)
#[1] 240

prop.table(tab)
#  A           B          C
# 1  0.004166667 0.045833333 0.02500000
# 2  0.008333333 0.050000000 0.02916667
# 3  0.012500000 0.054166667 0.03333333
# 4  0.016666667 0.058333333 0.03750000
# 5  0.020833333 0.062500000 0.04166667
# 6  0.025000000 0.004166667 0.04583333
# 7  0.029166667 0.008333333 0.05000000
# 8  0.033333333 0.012500000 0.05416667
# 9  0.037500000 0.016666667 0.05833333
# 10 0.041666667 0.020833333 0.06250000

#Naredbom sweep() demonstrirajte neke operacije nad tablicama.

sweep(tab, 1 , c(1,2), "-")
#   A  B  C
# 1  0 10  5
# 2  0 10  5
# 3  2 12  7
# 4  2 12  7
# 5  4 14  9
# 6  4 -1  9
# 7  6  1 11
# 8  6  1 11
# 9  8  3 13
# 10 8  3 13

#Uzorkovanje niza

#Na?inite vektor od 100 elemenata i iz njega izvucite 10 elemenata:

niz<-seq(1:100)

niz

# [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15
# [16]  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30
# [31]  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45
# [46]  46  47  48  49  50  51  52  53  54  55  56  57  58  59  60
# [61]  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75
# [76]  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90
# [91]  91  92  93  94  95  96  97  98  99 100

#Slu?ajnim izvla?enjem
sample(niz,10)
# [1] 55 84 41 75 38 74 70 66 51 28

#? Pozicijskim indeksiranjem
niz[c(3,56,45,78,23)]
#[1]  3 56 45 78 23

#Slijednim indeksiranjem

niz[30:40]
#[1] 30 31 32 33 34 35 36 37 38 39 40

#? Indeksiranjem logi?kom maskom
#? npr. odaberite elemente manje od srednje vrijednosti

niz[niz<mean(niz)]
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21
#[22] 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42
#[43] 43 44 45 46 47 48 49 50

#Rije?nik
#? Na?inite rje?nik ili imenik kao vektor ili matricu
#? Odaberite element, redak ili stupac
#* Imenom, izostavljanjem. . .

r <- c(11, 12, 13, 14)
names(r) <- c("Ante", "Ana", "Ivana", "Jospi")
r
