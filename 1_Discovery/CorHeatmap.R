
#install.packages("corrplot")
library(corrplot)
library(export)

rt=read.table("input.txt",sep="\t",header=T,row.names=1,check.names=F)

pdf("corHeatmap.pdf",height=13,width=13)              #????ͼƬ???ļ?????
corrplot(corr=cor(rt),
         method = "color",
         order = "hclust",
         tl.col="black",
         #addCoef.col = "black",
         number.cex = 0.8,
         col=colorRampPalette(c("blue", "white", "red"))(50),
         )
graph2ppt(file="corHeatmap.pptx", width=10, height=10)
dev.off()

###Video source: http://study.163.com/provider/1026136977/index.htm?share=2&shareId=1026136977
######Video source: http://www.biowolf.cn/shop/
######??????ѧ??: http://www.biowolf.cn/
######QQ??2749657388
######????QȺ??219795300
######΢??: 18520221056
