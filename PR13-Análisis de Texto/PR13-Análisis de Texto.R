### Análisis de Textos
#install.packages("tidyverse")
#install.packages("tidytext")
#install.packages("tokenizers")
library(tidyverse)
library(tidytext)
library(tokenizers)
library(tibble)
setwd("C:/Users/santiago/Documents/MCPP/Repositorio del Curso/mcpp_2019_1/Notebooks/mcpp_2019_1_notebook_semana_11")
biblia <- readLines("bible.txt")
head(biblia)
texto <- paste(biblia, collapse = "\n")
palabras <- tokenize_words(texto)
palabras
length(palabras[[1]])##cuenta el número de palabras en al biblia
tabla <- table(palabras[[1]])
tabla <- data.frame(word = names(tabla), count = as.numeric(tabla))
tabla <- arrange(tabla, desc(count))
head(tabla)
##Detectar oraciones
oraciones <- tokenize_sentences(texto)
head(oraciones)
oraciones_palabras <- tokenize_words(oraciones[[1]])
head(oraciones_palabras)
length(oraciones_palabras[[1]])
length(oraciones_palabras[[2]])
length(oraciones_palabras[[3]])
length(oraciones_palabras[[4]])


palabras_frecuentes <- read.table("http://norvig.com/ngrams/count_1w.txt",stringsAsFactors = FALSE)
head(palabras_frecuentes)
names(palabras_frecuentes)<-c("word","frecuencia")
tabla <- inner_join(tabla, palabras_frecuentes)
class(tabla)
head(tabla)
tabla[tabla$frecuencia < 1000000,]
x <- tabla[nchar(tabla$word)>6,]  
hist()
library(stopwords)










