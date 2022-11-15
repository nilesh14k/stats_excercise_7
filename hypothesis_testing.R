load("galaxies.Rdata")

#histograma for velocity dispersssion
hist(galaxies$Vdispersion, breaks=seq(from=0, to=500, by=40))
#hist(galaxies$Vdispersion)

#Fn(x) by ecdf()
fn<-ecdf(galaxies$Vdispersion)
fn(200)
plot(fn)

sum(galaxies$Vdispersion<=200)/length(galaxies$Vdispersion)#checking whether it worked or not
mu<-mean(galaxies$Vdispersion)
sigma<-sd(galaxies$Vdispersion)
G<-function(x){
  return(pnorm(x, mean=mu, sd=sigma))
}
G(200)
#hist(G)
plot(fn, vertical=TRUE, pch=NA)


x<-1:5000
lines(x, G(x))

mu_