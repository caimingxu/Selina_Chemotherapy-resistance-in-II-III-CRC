
library(corrplot)
rt <- read.table("input.txt",header = T,sep = "\t",row.names = 1,check.names = F)
rt <- t(rt)
#rt <- rt[,c(-1,-2)]
M6A=as.character(t(read.table('m6A.txt',header = F,check.names = F,sep = "\t")))

outTab=data.frame()
for (i in row.names(rt)[1:nrow(rt)]){
  j = "ZCCHC4"
  COR=cor.test(as.numeric(rt[j,]),as.numeric(rt[i,]),method = "pearson")
  p.value=COR$p.value
  coef=COR$estimate
  outTab=rbind(outTab,
               cbind(id=i,
                     coef=coef,
                     pVal=p.value))
}
write.table(outTab,file="ZCCHC4_Pearson.xls",sep="\t",row.names=F,quote=F)


