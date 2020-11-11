#Librería qqplot2

## Instalación del paquete
#install.packages("qqplot2")

## carga del paquete
library(ggplot2)

##Carga del data frame
midwest <- read.csv("http://goo.gl/G1K41K")
View(midwest)

##Gráficas Básicas

hist(midwest$inmetro)
plot(midwest$area,midwest$poptotal,type = "p")


options(scipen=999) 
##Cargar el marco
data("midwest", package = "ggplot2")
ggplot(midwest, aes(x=area, y=poptotal))

## Sobreescribiendo en el marco de trabajo (gráfico de dispersión)
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

## Regresión lineal
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() +
  geom_smooth(method="lm")
plot(g)

## Regresión Lineal sin intervalos de confianza
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() +
  geom_smooth(method="lm",se=FALSE)
plot(g)

?geom_smooth

### límites entre los ejes
g <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point() + geom_smooth(method="lm")
g + xlim(c(0, 0.1)) + ylim(c(0, 1000000)) 

### otra forma de realizar zoom

g1 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  # zooms in
plot(g1)

## Etiquetar las parte de la imagen

g1 + labs(title="Area Vs Population", subtitle="From midwest dataset",
          y="Population",x="Area", caption="Midwest Demographics")

# otra forma

g1 + ggtitle("Area Vs Population", subtitle="From midwest dataset") + 
  xlab("Area") + ylab("Population")


#### cambiar tamaño y colo de los puntos

ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col="steelblue", size=3) +   # Set static color and size for points
  geom_smooth(method="lm", col="firebrick") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", 
       y="Population", x="Area", caption="Midwest Demographics")

### Como cambiar el color para reflejar una categoría deseadas

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset",
       y="Population", x="Area", caption="Midwest Demographics")
plot(gg)


### cambiar la forma en vez de bolas
 
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(shape=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset",
       y="Population", x="Area", caption="Midwest Demographics")
plot(gg)

##

gg + theme(legend.position="None")  # remove legend

##

gg + scale_colour_brewer(palette = "Set1")  # change color palette

## cambio en el espaciamiento en la grilla, tanto eje x, como y

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# cambia breaks
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))

## cambiar etiquetas de los elementos del eje

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Change breaks + label
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01), labels = letters[1:11])

## cambiar el sentido del eje

  gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
    geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
    geom_smooth(method="lm", col="firebrick", size=2) + 
    coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
    labs(title="Area Vs Population", subtitle="From midwest dataset",
         y="Population", x="Area", caption="Midwest Demographics")
  
  # Reverse X Axis Scale
  gg + scale_x_reverse()

## cambiar el formato  
  
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset"
       , y="Population", x="Area", caption="Midwest Demographics")

# Change Axis Texts
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01), 
                labels = sprintf("%1.2f%%", seq(0, 0.1, 0.01))) + 
  scale_y_continuous(breaks=seq(0, 1000000, 200000), 
                     labels = function(x){paste0(x/1000, 'K')})  

## Cambiar fondo de la grilla

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset", y="Population",
       x="Area", caption="Midwest Demographics")

gg <- gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))

# method 1: Using theme_set()
theme_set(theme_classic())  # not run
gg


gg + theme_bw() + labs(subtitle="BW Theme")
gg + theme_classic() + labs(subtitle="Classic Theme")


theme_set(theme_bw())

# Add plot components --------------------------------
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + xlim(c(0, 0.1)) +
  ylim(c(0, 500000)) + labs(title="Area Vs Population", 
                            y="Population", x="Area", 
                            caption="Source: midwest")

# Call plot ------------------------------------------
plot(gg)


gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + xlim(c(0, 0.1)) + ylim(c(0, 500000)) + 
  labs(title="Area Vs Population", y="Population", x="Area", caption="Source: midwest")

# Modify theme components -------------------------------------------
gg + theme(plot.title=element_text(size=20, 
                                   face="bold", 
                                   family="American Typewriter",
                                   color="tomato",
                                   hjust=0.5,
                                   lineheight=1.2),  # title
           plot.subtitle=element_text(size=15, 
                                      family="American Typewriter",
                                      face="bold",
                                      hjust=0.5),  # subtitle
           plot.caption=element_text(size=15),  # caption
           axis.title.x=element_text(vjust=0,  
                                     size=15),  # X axis title
           axis.title.y=element_text(size=15),  # Y axis title
           axis.text.x=element_text(size=10, 
                                    angle = 30,
                                    vjust=.5),  # X axis text
           axis.text.y=element_text(size=10))  # Y axis tex

## Diagrams de barras

mpg <- read.csv("http://goo.gl/uEeRGu")
View(mpg)

theme_set(theme_bw())

cty_mpg <- aggregate(mpg$cty, by=list(mpg$manufacturer), FUN=mean)  # aggregate
colnames(cty_mpg) <- c("make", "mileage")  # change column names
cty_mpg <- cty_mpg[order(cty_mpg$mileage), ]  # sort
cty_mpg$make <- factor(cty_mpg$make, levels = cty_mpg$make)  # to retain the order in plot.
head(cty_mpg, 4)
View(cty_mpg)

# Draw plot
ggplot(cty_mpg, aes(x=make, y=mileage)) + 
  geom_bar(stat="identity", width=0.7, fill="tomato3") + 
  labs(title="Ordered Bar Chart", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
?geom_bar

theme_set(theme_classic())

# Histogram on a Continuous (Numeric) Variable
g <- ggplot(mpg, aes(displ)) + scale_fill_brewer(palette = "Spectral")

g + geom_histogram(aes(fill=class), 
                   binwidth = .1, 
                   col="black", 
                   size=.1) +  # change binwidth
  labs(title="Histogram with Auto Binning", 
       subtitle="Engine Displacement across Vehicle Classes")  

g + geom_histogram(aes(fill=class), 
                   bins=5, 
                   col="black", 
                   size=.5) +   # change number of bins
  labs(title="Histogram with Fixed Bins", 
       subtitle="Engine Displacement across Vehicle Classes")

## Diagrama de Torta

theme_set(theme_classic())

# Source: Frequency table
df <- as.data.frame(table(mpg$class))
colnames(df) <- c("class", "freq")
pie <- ggplot(df, aes(x = "", y=freq, fill = factor(class))) + 
  geom_bar(width = 1, stat = "identity") +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
  labs(fill="class", 
       x=NULL, 
       y=NULL, 
       title="Pie Chart of class", 
       caption="Source: mpg")

pie + coord_polar(theta = "y", start=0)

# Source: Categorical variable.
# mpg$class
pie <- ggplot(mpg, aes(x = "", fill = factor(class))) + 
  geom_bar(width = 1) +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
  labs(fill="class", 
       x=NULL, 
       y=NULL, 
       title="Pie Chart of class", 
       caption="Source: mpg")

pie + coord_polar(theta = "y", start=0)


theme_set(theme_bw())  # pre-set the bw theme.
g <- ggplot(mpg, aes(cty, hwy))
g + geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Counts Plot")