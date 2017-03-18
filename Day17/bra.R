library(deSolve)

bra <- function(time, state, pars){
  with(as.list(c(state, pars)),{
    dx = v*(sin(u))
    dy = v*(cos(u))
    dv = g*(cos(u))
    return(list(c(dx, dy, dv)))
  })
}

pars <- c(g = 9.8, u = 45)
state <- c(x = 0, y = 0, v = 0)
time <- seq(0,2,by=0.1)

out <- as.data.frame(ode(func = bra, y = state, parms = pars, times = time))

matplot(out[,-1], type = "l", xlab = "", ylab = "")
