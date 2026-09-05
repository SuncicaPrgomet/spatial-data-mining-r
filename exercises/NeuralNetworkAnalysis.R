# Prvi dio - priprema

plot(infert$stratum, infert$pooled.stratum, col=infert$education)
#Podatci se mogu linearno razdvojiti, iz slike se vidi gdje mogu povuci pravac
with(mtcars, plot(mpg, drat, col=cyl/2))

#Podatci se ne mogu linearno razdvojiti, imamo vise grupa koje su izmjesane  
#ne vidi se  gdje povuci pravac



# Drugi dio - samostalan rad

install.packages('neuralnet')
library(nnet)
library(neuralnet)

#1
auti <- mtcars
auti
# mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
# Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
# Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
# Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
# Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
# Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
# Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
# Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
# Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
# Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
# AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
# Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
# Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
# Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
# Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
# Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
# Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
auti1 <- as.factor(auti$cyl)
auti1
# [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
# Levels: 4 6 8
auti1 <- sample(2, nrow(auti), replace=TRUE, prob=c(0.7, 0.3))
skup_za_treniranje1 <- auti[auti1==1,]
skup_za_treniranje1
# mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
# Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
# Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
# Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
# Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
# Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
# Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
# Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
# AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
# Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
# Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
# Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
# Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
skup_za_testiranje1 <- auti[auti1==2,]
skup_za_testiranje1
# mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
# Merc 450SE     16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
# Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Camaro Z28     13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
# Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
testiranje1 <- skup_za_testiranje1$cyl
skup_za_testiranje1$cyl <- NULL
#a) nnet
?nnet
nn1_model1<-nnet(cyl~.,data=skup_za_treniranje1,size=2,rang=0.1,decay=5e-4,maxit=200)


table(skup_za_treniranje1$cyl, 
      predict(nn1_model1, skup_za_treniranje1, type="class")) 
#    4  6  8
# 4  7  0  0
# 6  0  5  0
# 8  0  0 11


table(testiranje1 , predict(nn1_model1, skup_za_testiranje1, type="class"))

# cyl_testiranje 4 6 8
#              4 4 0 0
#              6 0 2 0
#              8 0 0 3

##uočavam da mreža dobro radi i da nema pogrešaka u skupu za  treniranje niti testiranje


#b)neuralnet
?neuralnet
nn2_model1 <- neuralnet(cyl~., data = skup_za_treniranje1, hidden=1, act.fct="tanh")

table(skup_za_treniranje1$cyl,max.col(compute(nn2_model1, skup_za_treniranje1)$net.result))
#   1  3
# 4  2  5
# 6  0  5
# 8  0 11

table(cyl_testiranje,max.col(compute(nn2_model1, skup_za_testiranje1)$net.result))
# cyl_testiranje 3
#               4 4
#               6 2
#               8 3
plot(nn2_model1,rep=1)


#2

zene <- infert
zene
zene2 <- as.factor(zene$education)
zene2
# [1] 0-5yrs  0-5yrs  0-5yrs  0-5yrs  6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [11] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [21] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [31] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [41] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [51] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [61] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [71] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [81] 12+ yrs 12+ yrs 12+ yrs 0-5yrs  0-5yrs  0-5yrs  0-5yrs  6-11yrs 6-11yrs 6-11yrs
# [91] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [101] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [111] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [121] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 12+ yrs 12+ yrs 12+ yrs
# [131] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [141] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [151] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [161] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 0-5yrs  0-5yrs  0-5yrs  0-5yrs  6-11yrs
# [171] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [181] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [191] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs
# [201] 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 6-11yrs 12+ yrs
# [211] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [221] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [231] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# [241] 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs 12+ yrs
# Levels: 0-5yrs 6-11yrs 12+ yrs

zene2 <- sample(2, nrow(zene), replace=TRUE, prob=c(0.7, 0.3))
skup_za_treniranje2 <- zene[zene2==1,]
skup_za_treniranje2
skup_za_testiranje2 <- zene[zene2==2,]

edu_testiranje <- skup_za_testiranje2$education
skup_za_testiranje2$education <- NULL

#a)nnet

nn1_model2<-nnet(education~.,data=skup_za_treniranje2,size=2,rang=0.1,decay=5e-4,maxit=200)


table(skup_za_treniranje2$education, 
      predict(nn1_model2, skup_za_treniranje2, type="class")) 
#           0-5yrs 12+ yrs 6-11yrs
# 0-5yrs       8       0       0
# 6-11yrs      0       0      74
# 12+ yrs      0      83       0

table(edu_testiranje, predict(nn1_model2, skup_za_testiranje2, type="class"))

# edu_testiranje 0-5yrs 12+ yrs 6-11yrs
#           0-5yrs       4       0       0
#           6-11yrs      0       0      46
#           12+ yrs      0      33       0
#DOBRO SE PONASA NA SKUPU ZA TRENIRANJE I TESIRANJE

#b) neuralnet
nn2_model2 <- neuralnet(education~., data = skup_za_treniranje2, hidden=1, act.fct="tanh")

table(skup_za_treniranje2$education,max.col(compute(nn2_model2, skup_za_treniranje2)$net.result))
#         2
# 0-5yrs   8
# 6-11yrs 74
# 12+ yrs 83

table(edu_testiranje,max.col(compute(nn2_model2, skup_za_testiranje2)$net.result))
# edu_testiranje  2
#       0-5yrs   4
#       6-11yrs 46
#       12+ yrs 33


plot(nn2_model2,rep=1)
