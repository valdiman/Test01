# Install packages
install.packages("ggplot2")
install.packages("tidyverse")

# Libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# Read data
Aroclor <- read.csv("Data/Frame1996.csv", header = TRUE, check.names = F)

# Look at data
head(Aroclor)
str(Aroclor)

# Change format
Aroclor.2 <- Aroclor %>%
  pivot_longer(
    cols = -c(CASRN, `PCB#`),
              names_to = "Aroclor",
              values_to = "Value"
  )

# Need to organize the PCB names
Aroclor.2$`PCB#` <- factor(Aroclor.2$`PCB#`,
                               levels = unique(Aroclor.2$`PCB#`))

# Plot PCB profile
ggplot(Aroclor.2, aes(x = `PCB#`, y = Value, fill = "Aroclor 1016 A2")) +
  geom_col() +
  xlab("") +
  theme_classic() +
  theme(aspect.ratio = 4/16) +
  ylab(expression()) +
  theme(axis.text.y = element_text(face = "bold", size = 14),
        axis.title.y = element_text(face = "bold", size = 14)) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

