library(datasets)
library(dplyr)
library(ggplot2)
data("ToothGrowth")
##summary(ToothGrowth)

Split_Dose<-split(ToothGrowth, ToothGrowth$dose)

names(Split_Dose) <- c("half", "one","two")

hypdose <- t.test(Split_Dose$half$len, Split_Dose$two$len)
hypdose$p.value