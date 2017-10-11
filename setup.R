install.packages("shiny")
install.packages("ggplot2")
install.packages("rsconnect")

z <- sample(c(1, 2, 3), 50, replace = T)
x <- sapply(ifelse(z == 1, 5, ifelse(z == 2, 7, 2)), function(X){rnorm(mean = X, n = 1)})
y <- 2 * (x - 4) + rnorm(0, 0.3, n = length(x)) -> w
w <- (x - 4)^2 * 0.6 + rnorm(0, 0.1, n = length(x))
write.csv(data.frame(w, x, y, z), file = "data.csv", row.names = F)