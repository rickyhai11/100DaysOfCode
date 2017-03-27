library(imager)
library(nabor)

fknn <- function(X,Xp,cl,k=1)
{
  out <- nabor::knn(X,Xp,k=k)
  cl[as.vector(out$nn.idx)] %>% matrix(dim(out$nn.idx)) %>% rowMeans
}

im <- load.image("image.JPG")
plot(im)

fg <- c(510,521,670,671 )
#Background
bg <- c(791,   28, 1020,  194 )
#Corresponding pixel sets
px.fg <- ((Xc(im) %inr% fg[c(1,3)]) & (Yc(im) %inr% fg[c(2,4)]))
px.bg <- ((Xc(im) %inr% bg[c(1,3)]) & (Yc(im) %inr% bg[c(2,4)]))

plot(im)
highlight(px.fg)
highlight(px.bg,col="blue")

im.lab <- sRGBtoLab(im)
#Reshape image data into matrix with 3 columns 
cvt.mat <- function(px) matrix(im.lab[px],sum(px)/3,3)
fgMat <- cvt.mat(px.fg)
bgMat <- cvt.mat(px.bg)
labels <- c(rep(1,nrow(fgMat)),rep(0,nrow(bgMat)))

testMat <- cvt.mat(px.all(im))

out <- fknn(rbind(fgMat,bgMat),testMat,cl=labels,k=5)

msk <- as.cimg(rep(out,3),dim=dim(im))
plot(msk)

plot(im*msk)
