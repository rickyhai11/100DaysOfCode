#source:http://www.everydayanalytics.ca/2014/12/the-mandelbrot-set-in-r.html
cols=colorRampPalette(c("red","yellow","blue","black"))(203)
xmin = -2
xmax = 3
nx = 250
ymin = -2.5
ymax = 2.5
ny = 250
n=300

# variables
x <- seq(xmin, xmax, length.out=nx)
y <- seq(ymin, ymax, length.out=ny)
c <- outer(x,y*1i,FUN="+")
z <- matrix(0.0, nrow=length(x), ncol=length(y))
k <- matrix(0.0, nrow=length(x), ncol=length(y))

for (rep in 1:n) { 
  print(rep)
  for (i in 1:nx) { 
    for (j in 1:ny) { 
      if(Mod(z[i,j]) < 4 && k[i,j] < n) {
        z[i,j] <- z[i,j]^2 + c[i,j]
        k[i,j] <- k[i,j] + 1
      }
    }
  }
}

image(x,y,k, col=cols)
