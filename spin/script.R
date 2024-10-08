library(ggplot2)

summary(mtcars)

ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()

# To turn this into an RMD file, use knitr::spin()
# knitr::spin("spin_demo.R", knit = FALSE)
# Note: the `knit = FALSE` argument prevents the .md and associated files from being created

