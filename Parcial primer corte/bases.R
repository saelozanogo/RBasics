corona <- read.csv("case.csv",header = T)
View(corona)
corona2 <- read.csv("patient.csv",header = T)
View(corona2)
names(corona2)
base1<-data.frame("id"=corona2$patient_id,"sexo"=corona2$sex,"año de nacimiento"=corona2$birth_year, "fecha de confirmación"=corona2$confirmed_date)
View(base1)
reduced.frame <- base1[!is.na(base1$año.de.nacimiento),]
View(reduced.frame)
x <-sample(1:666,8)
x
x1 <- c(158,424,631,514,547,530,600,444)
base11<-reduced.frame[x,]
View(base11)
####
base2 <- data.frame("país"=corona2$country,"sexo"=corona2$sex,"Estado"=corona2$state,"id"=corona2$patient_id)
View(base2)
reduced.frame2 <- base2[!is.na(base1$año.de.nacimiento),]
base22<-reduced.frame2[x1,]
View(base22)
####
base11
base22
merge(base11,base22,by=c("id"))
merge(base11,base22)
######
######
#####
credit <- read.csv("Credit_Union_Headquarters.csv",header = T)
View(credit)
