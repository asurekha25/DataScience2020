x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
z <- 2*x + y + 1
z
min(z)
max(z)
range(z)
prod(z)


mean(z)
class(mean(z))

my_array <- c(1:3, NA)
result <- is.na(my_array)
result
seq <- seq()


vec1 <- c("Hockey", "Football", "Baseball", "Curling", "Rubgy", "Hurling", "Basketball", "Tennis", "Cricket", "Lacrosse")
vec2 <- c(vec1, "Hockey", "Lacrosse", "Hockey", "Waterpolo", "Hockey", "Lacrosse")
vec3 <- vec2[c(1, 3, 6)]
vec3
class(vec3)

