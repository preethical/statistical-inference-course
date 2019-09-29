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

g3 <- ggplot(data.frame(simulation_1),aes(x=simulation_1))
g3 <- g3+xlab("mean values")
g3 <- g3 + geom_histogram(binwidth = 0.1, colour = "black", fill = "thistle4", aes(y=..density..))
g3 <- g3 + stat_function(fun = dnorm, args = list(mean = mean(simulation_1), sd = sqrt(var(simulation_1))),col = "purple4",size = 1)+ stat_function(fun = dnorm, args = list(mean = 1/lambda, sd = sqrt((1/lambda)^2/sample_size)),col = "darkred",size = 1)
g3 <- g3 + ggtitle("Normal distribution vs sample distribution")
g3 <- g3+geom_vline(data = means,aes(xintercept=values, col=Comparison_of_means),size=2)
print (g3)