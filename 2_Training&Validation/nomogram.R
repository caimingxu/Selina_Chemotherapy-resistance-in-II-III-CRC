
#install.packages("Hmisc")
#install.packages("lattice")
#install.packages("Formula")
#install.packages("ggplot2")
#install.packages("foreign")
#install.packages("rms")

library(rms)
library(export)
rt=read.table("input.txt",sep="\t",header=T,row.names=1,check.names=F)   #????????????
#rt=rt[c(1:(ncol(rt)-2))]
#rt$futime=rt$futime/12

dd <- datadist(rt)
options(datadist="dd")

f <- cph(Surv(futime, fustat) ~ risk + N + Chemotherapy, x=T, y=T, surv=T, data=rt, time.inc=1)
surv <- Survival(f)

nom <- nomogram(f, fun=list(function(x) surv(1, x), function(x) surv(2, x), function(x) surv(5, x)), 
    lp=F, funlabel=c("1-year survival", "3-year survival", "5-year survival"), 
    maxscale=100, 
    fun.at=c(0.99, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3,0.2,0.1,0.05))     #????surv????????????????????????1????3????5????????????????surv????????????????"n-year survival"??????????

pdf(file="nomogram.pdf",height=6,width=10)
plot(nom)
dev.off()
graph2ppt(file="effect plot.pptx", width=10, height=6)
