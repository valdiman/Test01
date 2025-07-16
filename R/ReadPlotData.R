# Install packages
install.packages("ggplot2")

# Libraries
library(ggplot2)

# Read data

Aroclor <- read.csv("Data/Frame1996.csv", head = TRUE)

# look data
head(Aroclor)
str(Aroclor)

# Bar plot

ggplot(Aroclor, aes(x = PCB., y = Aroclor.1221.A1)) +
  geom_bar() +
  xlab("") +
  theme_classic() +
  theme(aspect.ratio = 4/16) +
  ylab(expression()) +
  theme(axis.text.y = element_text(face = "bold", size = 14),
        axis.title.y = element_text(face = "bold", size = 14)) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())


  
  