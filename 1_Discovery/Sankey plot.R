library("ggplot2")
library("ggalluvial")
library("export")

rt <- read.table("input.txt", header = T, sep = '\t')

tiff('Sankey plot.tiff',width = 1200,height = 2000,res = 150)
pdf('Sankey plot.pdf',width = 8,height = 20)
ggplot(data = rt,
       aes(axis1 = m6A, axis2 = RNA, y = freq)) +
  geom_alluvium(aes(fill = m6A)) +  
  geom_stratum() +
  geom_text(stat = "stratum",
            aes(label = after_stat(stratum))) +
  scale_x_discrete(limits = c("m6A", "RNA"),
                   expand = c(0.15, 0.05)) +
  theme_void()
dev.off()
