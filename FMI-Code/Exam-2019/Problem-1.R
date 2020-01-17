# Problem - 1

Calculate <- function(a0,a1,n)
{
  n = n-1
  summ = a0 + a1
  for(k in 2:n)
  {
    Ak = 2*(a1+a0)
    a0 = a1
    a1 = Ak
    summ = summ + Ak
  }
  return (c(Ak, summ))
}