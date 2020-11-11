as.integer(runif(12,0,10))
x<-1:5
y<- c(4,7,5,2)
z <- c(x,y)
z
is.vector(z)
integer(3)
######Funciones#######
Hola <- function(nombre) {
  cat("Hola,","Bienvenido",nombre)
}
Hola("Santiago")

hello <- function(name) {
  # Converte el nombre a may?scula
    name <- toupper(name)
    cat("Hello",name,"!")
}
hello("Andr?s")
#### diferencia entre print y return
Mul <- function(a,b){
  n <- a*b
  print(n)
}
Mul(2,4)

Mul1 <- function(a,b){
  n <- a*b
  return(n)
}
x <- Mul1(2,4)

z <- 5.9
y <- 7.8

xx <- Mul1(z,y)

main <- function() {
  w <- 5
  s <- 8
  t <- Mul1(w,s)
  cat("El valor es", t)
}
main()

prime <- function(n){
  rv = TRUE
  for (i in 2:(n-1)){
    if(n %% i == 0){
      rv = FALSE
      break
    }
  }
  return(rv)
}
prime(4)
prime(1243)
prime(9389381)
x <- prime(58349787)
x

for (j in 2:100){
  cat(j,prime(j),"\n")
}

primo <- function(N){
  for (f in (3:N)){
    if (prime(f) == TRUE){
      cat(f,"Es primo","\n")
    } else {
      cat(f,"No es primo","\n")
    }
  }
}
primo(13)


absolut <- function(x){
  if (x < 0){
    return(-1*x)
  } else {
    return(x)
  }
}
y <- absolut(-3)
y
help(runif)
aleas <- function(n,li,ls){
  rv <- numeric(n)
  for (i in 1:n){
    rv[i] <- as.integer(runif(1,min =li,max =ls))
  }
  return(rv)
}
aleas(n =5,li = 2,8)
as.integer(3.8)
runif(2,min =2,max =8)

f <- function(i){
  i = i + 1
  return(i)
}

h <- function(i){
  return(i+1)
}

g <- function(i){
  h(i*5)
}

main <- function(){
  i =7
  j = k = l = 0
  j = f(i)
  k = f(j*3)
  l = g(i)
  print(i)
  print(j)
  print(k)
  print(l)
}
main()

increment_first_inplace <- function(x){
  x[1] <- x[1] + 1
  return (x)
}
y <- c(2,3,2,4,3)
z <-increment_first_inplace(y)
z
