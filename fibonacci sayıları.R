sayi<-as.numeric(readline(prompt = "Fibonacci Serisi İçin Hesaplanacak Son Sayıyı Giriniz... : ")) 
fibonacci <- numeric(sayi)
fibonacci[1] <- 0
fibonacci[2] <- 1
tek <- vector("numeric")
cift<- vector("numeric")
oran <- vector("numeric")

for(i in 3:sayi)
{
  fibonacci[i]<- fibonacci[i-1]+fibonacci[i-2]
  if(fibonacci[i]%%2==0)
  {
    cift[length(cift)+1] <- c(fibonacci[i])
  }
  else
  {
    tek[length(tek)+1]<-c(fibonacci[i])
  } 
}
# Vektörlerde Oran Bulan Fonksiyon
oran_func <- function(x,y,z) 
{
  result <- x[z]/y[z]
  return(result)
}


for (i in 1:length(cift)) #çift vektöründeki eleman sayısı tek vektöründeki eleman sayısından daha az olacağı için çift vektöründeki eleman sayısı kadar oran bulunur.
{
  oran[length(oran)+1] <-c(oran_func(tek,cift,i))
}
fibonacci
tek
cift
oran

rm(all.vars())




