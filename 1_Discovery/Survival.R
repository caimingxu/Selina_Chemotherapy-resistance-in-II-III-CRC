
library(ggplot2)
library('survminer')
library(survival)
library(export)

rt=read.table("riskOutput.txt",header=T,sep="\t")
fit <- survfit(Surv(futime, fustat) ~ risk, data = rt)

tiff("survival.tiff",width = 1500,height = 1800,res = 200)
ggsurvplot(fit,                     # survfit object with calculated statistics.
  risk.table = TRUE,       # show risk table.
  pval = FALSE,             # show p-value of log-rank test.
  conf.int = TRUE,         # show confidence intervals for 
  # point estimaes of survival curves.
  xlim = c(0,10),        # present narrower X axis, but not affect
  # survival estimates.
  break.time.by = 2,     # break X axis in time intervals by 500.
  palette = c("brown1", "springgreen4"),
  size = 1.2,
  ggtheme = theme_minimal(), # customize plot and risk table with a theme.
  risk.table.y.text.col = T, # colour risk table text annotations.
  risk.table.y.text = FALSE # show bars instead of names in text annotations
  # in legend of risk table
)
dev.off()
graph2ppt(file="survival.pptx", width=7, height=8)

