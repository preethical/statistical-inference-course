library(datasets)
library(dplyr)
library(ggplot2)
data("ToothGrowth")
##summary(ToothGrowth)
groups <- group_by(ToothGrowth, supp)
summary_groups <- summarise(groups, count = n(),"Mean" = mean(len), "Std dev" = sd(len))
#print(summary_groups)
tooth <- ggplot(data = ToothGrowth, aes(x=as.factor(dose),y=len,fill=supp))+geom_bar(stat='identity', position='dodge')+xlab("Dose(mg/day)")+ylab("Tooth length(mm)")+ggtitle("The effect of supplements on tooth growth in guinea pigs")
print(tooth)

##hyp01<- t.test(len~supp, ToothGrowth)

hyp02A <- t.test(len~supp, data = subset(ToothGrowth, dose == 0.5))

hyp02A

hyp02A$p.value

hyp02A$conf.int

hyp02B <- t.test(len~supp, data = subset(ToothGrowth, dose == 1))

hyp02B

hyp02B$p.value

hyp02B$conf.int

hyp02C <- t.test(len~supp, data = subset(ToothGrowth, dose == 2))

hyp02C

hyp02C$p.value

hyp02C$conf.int


