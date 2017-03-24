library(tidyverse)
library(imager)
im <- load.image("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Aster_Tataricus.JPG/1024px-Aster_Tataricus.JPG")
#Convert to CIELAB colour space, then create a data.frame with three colour channels as columns
d <- sRGBtoLab(im) %>% as.data.frame(wide="c")%>%
  dplyr::select(-x,-y)
#Run k-means with 2 centers
km <- kmeans(d,2)
#Turn cluster index into an image
seg <- as.cimg(km$cluster,dim=c(dim(im)[1:2],1,1))
plot(im,axes=FALSE)
highlight(seg==1)
