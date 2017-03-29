library(ggplot2)
xrange <- seq(-8, 8, by = 0.01)
yrange <- seq(-3, 3, by = 0.01)
f  <- function (z) {1/4*(2+7*z-(2+5*z)*cos(pi*z))}
z <- outer(xrange, 1i*yrange,'+')
t <- mat.or.vec(nrow(z), ncol(z))
for (k in 1:5)
{
  z <- f(z)
  t <- t + (is.finite(z)+0)
}
## Supressing texts, titles, ticks, background and legend.
opt <- theme(legend.position="none",
             panel.background = element_blank(),
             axis.ticks=element_blank(),
             axis.title=element_blank(),
             axis.text =element_blank())
z <- data.frame(expand.grid(x=xrange, y=yrange), z=as.vector(t))
ggplot(z, aes(x=x, y=y, color=z)) + geom_tile() + scale_colour_gradient(low="blue", high="white") + opt

