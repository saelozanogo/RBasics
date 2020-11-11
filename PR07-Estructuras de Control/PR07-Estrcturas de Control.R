#####Estructura de control####
#####Condicionales####
a <- 5
if (a < 7){
  print("Menor a Siete")
}
a == 5
a < 5 
######
riesgo = "m"

if (riesgo == "alto"){
  cat("El riesgo del paciente es", riesgo, "\n")
  cat("Asigne al paciente al grupo A")
}
print("Diagnótico finalizado")

if (riesgo == "medio"){
  cat("El riesgo del paciente es", riesgo, "\n")
  cat("Asigne al paciente al grupo B")
}
print("Diagnótico finalizado")

######
if(riesgo == "alto"){
  cat("El riesgo del paciente es", riesgo, "\n")
  cat("Asigne al paciente al grupo A", "\n")
} else if (riesgo == "medio"){
  cat("El riesgo del paciente es", riesgo, "\n")
  cat("Asigne al paciente al grupo B", "\n")
} else if (riesgo == "bajo"){
  cat("El riesgo del paciente es", riesgo, "\n")
  cat("Asigne al paciente al grupo C","\n")
} else {
  print("¿Qué está haciendo?")
}
print("Diagnóstico Finalizado")
###
y <- 3
if (y < 10){
  print("menor a 10")
}
if (y < 5){
  print("Menor a 5")
}
#####
if (y < 10){
  print("menor a 10")
} else if (y < 5){
  print("Menor a 5")
}
######
if (y < 10){
  print("menor a 10")
} else if (y < 5){
  print("Menor a 5")
}
if (y < 2){
  print("Menor a 20")
} 
#####Loops####
nums = c(1,4,8,9,11)
for (n in nums){
  print(n)
} 

for (n in 1:5){
  print(n)
} 

for (n in 1:5){
  print(1:n)
} 

for (numero in 1:5){
  cat("El número es:",numero, "\n")
} 
######
for(i in nums){
  if(i %% 2 == 0){
    cat(i,"es par","\n")
  } else {
    cat(i,"es impar","\n")
  }
}

es_primo = TRUE
n <- 9
for (i in 2:(n-1)) {
  if (n %% i == 0){
    es_primo = FALSE 
    break
  }
}
cat (n, es_primo)
###el break se usa cuando se tiene un loop
for (j in 1:100){
  es_primo = TRUE
  for (i in 2:(j-1)) {
    if (j %% i == 0){
      es_primo = FALSE 
      break
    }
  }
  cat(j,es_primo,"\n")
}
#####while loops
i = 13
N = 10
while (i > N){
  print(i)
  i = i + 1
}
####next estamento
v <- LETTERS[1:6]
for ( i in v) {
  if (i == "D") {
    next
  }
  print(i)
}
