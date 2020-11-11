# LIBRERIAS 

library(readxl)
library(ggplot2)
library(hrbrthemes)

# LLAMADO DE ARCHIVOS

oficina = read_excel("C:/Users/RentAdvisor/Desktop/PROYECTO R STUDIO/TRABAJO RENTABILIDAD Rstudio.xlsm", sheet = "OFICINAS")

datos = read_excel("C:/Users/RentAdvisor/Desktop/PROYECTO R STUDIO/TRABAJO RENTABILIDAD Rstudio.xlsm", sheet = "DATOS")

# CREACION DE DATA FRAME SEPARADOS DE CADA UNO EN UN VECTOR

i=1
o=2
d.f = c()
while(i<=47){
  a= datos[1:61,1]
  b= c(datos[1:61,o])
  c= c(datos[1:61,o+1])
  d=c(datos[1:61,o+2])
  d.f[[i]]= data.frame (a,b,c,d)
  i=i+1
  o=o+3
}
View(d.f)

# RENTABILIDAD DE FINCOMERCIO QUE SE ESPERA 

renta <-d.f[[1]][[3]][61]
renta

# RENTABILIDAD OBTENIDA

ren.1 <- d.f[[4]][[3]][61]
ren.1

# PREGUNTA LOGICA RENTABILIDAD

renta==ren.1

# FONDEO PROMEDIO

i=5
f.p= c()
while (i<=47){
  tc = d.f[[i]][[2]][8]
  tcp= d.f[[i]][[2]][31]
  as= d.f[[i]][[2]][41]
  x= tc-tcp-as
  if (x>0){
    f.p[i]=x
  }else{
    f.p[i]= 0
  }
  i=i+1
}
f.p

# RENTABILIDADES BASE

rentx= c()
ofiy= oficina$IMPORTANCIA[5:47]
i=5
rb = c()

while(i<=47){
  rb[i]=d.f[[i]][[3]][61]
  i=i+1
}
rb

# SIMULADOR

z = d.f[[4]][[2]][61]
j = d.f[[4]][[4]][61]
i=0.0
p= 0

while (p<renta) {
  o=5
  fon=c()
  ing=c()
  
  while (o<=47) {
    
    fon[o]=f.p[o]*i
    
    if(f.p[o]==0){
      
      ing[o]= ((d.f[[o]][[2]][31]+d.f[[o]][[2]][41]-d.f[[o]][[2]][15])*i/12*6)
    }else{
      
      ing[o]=0
    }
    
    o=o+1
  }
  
  s=sum(fon,na.rm = TRUE)-sum(ing,na.rm = TRUE)
  d= j+s
  p=d/z
  i= i+ 0.00001
  
}
fon = as.integer(fon)
fon
ing = as.integer(ing)
ing
s
tasa = i-0.00001
tasa

# CUADRO DE FONDEO E INGRESOS 

cuadro.1 = data.frame("OFICINA"=oficina$OFICINA[5:47],"CODIGO" = ofiy,"PROMEDIO_FONDEO"=f.p[5:47],"FONDEO_OFICINA"=fon[5:47],"INGRESOS_FONDEO"= ing[5:47])
cuadro.1

# Rentabilidad

i= 5
r.n = c()
while (i<=47) {
  n=fon[i]
  m= d.f[[i]][[4]][61] 
  l= d.f[[i]][[2]][61]
  r=(m+n)/l
  if(r== "NaN"|| r== "Inf"){
    r.n[i]=0
  }else{
    r.n[i]= r
  }
  
  i=i+1
}

r.n

# GRAFICAS DE RENTABILIDAD 

rentas = data.frame("CODIGO"= oficina$IMPORTANCIA[5:47] , "Rentabilidad_Nueva" = r.n[5:47],"Rentabilidad_Anterior"= rb[5:47])
rentas

grafrica_ra = ggplot(rentas,aes(x= CODIGO,y= Rentabilidad_Anterior))+ geom_line( color="grey") + geom_point(shape=21, color="black", fill="blue", size=3) + ggtitle("RENTABILIDAD ANTERIOR")
grafrica_ra = grafrica_ra + xlab("OFICINA")+ ylab("RENTABILIDAD")+ geom_hline(yintercept=0,colour = "red")+
  theme_ipsum()
grafrica_ra
geom_point()

# DATA.FRAME DE ACTIVOS

i=5
activos = c()
while (i<=47) {
  activos[i] = d.f[[i]][[4]][8]
  i=i+1
}
activos

# BASE DE DATOS

OFICINAS = oficina$OFICINA[5:47]
str(OFICINAS)

CODIGO = oficina$SERIE[5:47]
str(CODIGO)

RENTABILIDAD_ANTERIOR= rb[5:47]
str(RENTABILIDAD_ANTERIOR)

RENTABILIDAD_ACTUAL=r.n[5:47]
str(RENTABILIDAD_ACTUAL)

ACTIVOS = activos[5:47]
str(ACTIVOS)


Fincomercio_Base = data.frame(OFICINAS,CODIGO,RENTABILIDAD_ANTERIOR,RENTABILIDAD_ACTUAL,ACTIVOS)
View(Fincomercio_Base)

# CLASIFICACION POR GRUPOS

grupo.1 = Fincomercio_Base[Fincomercio_Base$ACTIVOS>5000000,]
m.1 = mean(grupo.1$RENTABILIDAD_ACTUAL)
m.1


grupo.2= Fincomercio_Base[Fincomercio_Base$ACTIVOS<5000000 & Fincomercio_Base$ACTIVOS >3000000,]
m.2 = mean(grupo.2$RENTABILIDAD_ACTUAL)
m.2

grupo.3 = Fincomercio_Base[Fincomercio_Base$ACTIVOS<3000000 & Fincomercio_Base$ACTIVOS >1000000,]
grupo.3
m.3 = mean(grupo.3$RENTABILIDAD_ACTUAL)
m.3


grupo.4 = Fincomercio_Base[Fincomercio_Base$ACTIVOS<1000000,]
grupo.4
m.4 = mean(grupo.4$RENTABILIDAD_ACTUAL)
m.4


# ALERTAS

alerta.1 = grupo.1[grupo.1$RENTABILIDAD_ACTUAL<m.1,]
alerta.1
g.1 = ggplot(grupo.1,mapping = aes(CODIGO,RENTABILIDAD_ACTUAL, colour= OFICINAS)) + geom_point(shape=21, color="black", fill="green", size=3) + xlab("CODIGO OFICINA")+ ylab("RENTABILIDAD")
g.1=g.1+ ggtitle("RENTABILIDAD GRUPO 1") + geom_hline(yintercept=m.1,colour = "red")
g.1

alerta.2 = grupo.2[grupo.2$RENTABILIDAD_ACTUAL<m.2,]
alerta.2
g.2 = ggplot(grupo.2,mapping = aes(CODIGO,RENTABILIDAD_ACTUAL, colour= OFICINAS)) + geom_point(shape=21, color="black", fill="purple", size=3) + xlab("CODIGO OFICINA")+ ylab("RENTABILIDAD")
g.2=g.2+ ggtitle("RENTABILIDAD GRUPO 2") + geom_hline(yintercept=m.2,colour = "red")
g.2

alerta.3 = grupo.3[grupo.3$RENTABILIDAD_ACTUAL<m.3,]
alerta.3
g.3 = ggplot(grupo.3,mapping = aes(CODIGO,RENTABILIDAD_ACTUAL,colour = OFICINAS)) + geom_point(shape=21, color="black", fill="orange", size=3) + xlab("CODIGO OFICINA")+ ylab("RENTABILIDAD")
g.3=g.3+ ggtitle("RENTABILIDAD GRUPO 3") + geom_hline(yintercept=m.3,colour = "red")
g.3

alerta.4 = grupo.4[grupo.4$RENTABILIDAD_ACTUAL<m.4,]
alerta.4
g.4 = ggplot(grupo.4,mapping = aes(CODIGO,RENTABILIDAD_ACTUAL,colour = OFICINAS)) + geom_point(shape=21, color="black", fill="yellow", size=3) + xlab("CODIGO OFICINA")+ ylab("RENTABILIDAD")
g.4=g.4+ ggtitle("RENTABILIDAD GRUPO 4") + geom_hline(yintercept=m.4,colour = "red")
g.4
