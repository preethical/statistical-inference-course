library(ggplot2)
set.seed(10)

lambda <- 0.2
sample_size <- 40
simulations <- 1000

simulation_1 <- NULL

for(i in 1:simulations) 
  {
  simulation_1 <- c(simulation_1, mean(rexp(sample_size, lambda)))
}

means <- data.frame (Comparison_of_means = c("sample mean","theoretical mean"), values = c(mean(simulation_1), 1/lambda))
                    

g2 <- ggplot(data.frame(simulation_1),aes(x=simulation_1))
g2 <- g2+ggtitle("Density distribution of mean values simulated from an exponential distribution")+xlab("mean values")
g2 <- g2 + geom_histogram(binwidth = 0.1, colour = "black", fill = "aquamarine3", aes(y=..density..))
g2 <- g2+geom_density(color="navyblue", size = 1)
g2 <- g2+geom_vline(data = means,aes(xintercept=values, col=Comparison_of_means),size=2)
print(g2)

##mean(simulation_1)
## var(simulation_1)

