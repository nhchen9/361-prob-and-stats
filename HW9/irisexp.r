
library(devtools)
library(lattice)
install_github("ggbiplot","vqv")
data(iris)
library(datasets)
data(iris)
c= data(iris)
spnames = c('setosa', 'versicolor','virginica')
splom(iris[,c(1:4)], groups = iris$Species, par.settings = parset,
      varnames = c('Sepal\nLength','Sepal\nWidth', 'Petal\nLength', 'Petal\nWidth'),
      key = list(text = list(spnames), points = list(pchr), columns=3))
logir = log(iris[,1:4])
specs = iris[,5]
?prcomp
irispca = prcomp(logir, center=TRUE, scale.=TRUE)
predict(irispca, newdata = tail(logir, 5))
install_github("ggbiplot", "vqv")
library(ggbiplot)
g = ggbiplot(irispca, obs.scale = 1,choices = 1:2, var.scale = 1, groups = specs, ellipse= TRUE, circle = TRUE)
g = g + scale_color_discrete(name = ' ')
g = g + theme(legend.direction = 'horizontal', legend.position = 'top')
g

irispca