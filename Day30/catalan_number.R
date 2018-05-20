catalan_num_direct <- function(num){
  catalan <- (choose(2*num, num))/(num+1)
  return(catalan)
}

catalan_num_recr <- function(numb){
  if (numb == 0){
    return(1)
  }
  else
    return(((4*numb-2)*catalan_num_recr(numb-1))/(numb+1))
}
