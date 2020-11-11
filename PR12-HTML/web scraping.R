### Web Scraping
#install.packages("XML2")
#install.packages("rvest")
#install.packages("dplyr")
library(xml2)
library(dplyr)
library(rvest)
hp <- html("https://news.google.com/topstories?hl=es-419&gl=CO&ceid=CO:es-419")
hp %>%
  html_nodes(".ICsaqd") %>%
  html_text()

### Ejemplo para saber el número de página

hp2 <- html("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")

hp2 %>%
  html_nodes(".clear+ .desc span:nth-child(1)") %>%
  html_text()->peliculas

peliculas

xpel <- strsplit(peliculas, " ")
xpel
y <- as.numeric(as.vector(xpel[[1]][-grep("\\D",as.character(xpel[[1]]))]))
y
numpag <- y/50
numpag 

vector <- seq(from=1,to=y,by=50)
vector

urls <- paste("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating,desc&start=",vector,"&ref_=adv_nxt",sep = "")
urls
titulosfin <- c()
duracionesfin <- c()
anofin <- c()
generofin <- c()
descripcionfin <- c()

for (i in urls){

  Sys.time(5)  
hp3 <- html(i)
  
hp3 %>%
  html_nodes(".lister-item-header a") %>%
  html_text() -> titulos

hp3 %>%
  html_nodes(".runtime") %>%
  html_text() -> duraciones

hp3 %>%
  html_nodes(".text-muted.unbold") %>%
  html_text() -> ano

hp3 %>%
  html_nodes(".genre") %>%
  html_text() -> genero

hp3 %>%
  html_nodes(".ratings-bar+ .text-muted") %>%
  html_text() -> descripcion

titulosfin <- c(titulosfin,titulos)
duracionesfin <- c(duracionesfin,duraciones)
anofin <- c(anofin,ano)
generofin <- c(generofin,genero)
descripcionfin <- c(descripcionfin,descripcion)

}

titulosfin
duracionesfin
anofin
generofin
descripcionfin

final <- data.frame("Título"=titulosfin,"Duración"=duracionesfin,
                    "año"=anofin,"Género"=generofin,"Descripción"=descripcionfin)
View(final)

## limpiando anofin

ano2 <- regexpr("\\(.*\\)$", anofin)
ano2

anofin <- substring(anofin, first=ano2+1, last=ano2+attr(ano2,"match.length")-2)
anofin
## limpiando generofin

generofin <- gsub("^.?","",gsub(" *$", "",generofin))
generofin

## limpiando descripcionfin 

descripcionfin <- gsub("^. *","",descripcionfin)
descripcionfin

final <- data.frame("Título"=titulosfin,"Duración"=duracionesfin,
                    "año"=anofin,"Género"=generofin,"Descripción"=descripcionfin)
View(final)
