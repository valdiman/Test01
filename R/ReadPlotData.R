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
    cols = -c(CASRN, `PCB`),
              names_to = "Aroclor",
              values_to = "Value")

# Aroclor names
# "Aroclor1221A1"   "Aroclor1232A1.5" "Aroclor1232G1.5" "Aroclor1016A2"   "Aroclor1016S2"   "Aroclor1242A3"   "Aroclor1242G3"  
# "Aroclor1242S3B"  "Aroclor1248A3.5" "Aroclor1248G3.5" "Aroclor1254A4"   "Aroclor1254G4"   "Aroclor1260A5"   "Aroclor1260G5"  
# "Aroclor1260S5"   "Aroclor1262A6"   "Aroclor1262G6"  

# Need to select Aroclor
selected_aroclor <- Aroclor.2 %>%
  filter(Aroclor == "Aroclor1221A1")

# Need to organize the PCBs by number
selected_aroclor$PCB <- factor(selected_aroclor$PCB,
                               levels = unique(selected_aroclor$PCB))

# Plot PCB profile
ggplot(selected_aroclor, aes(x = PCB, y = Value, fill = Aroclor)) +
  geom_col() +
  xlab("") +
  theme_classic() +
  theme(aspect.ratio = 4/16) +
  ylab(expression(paste("%"))) +
  theme(
    axis.text.y = element_text(face = "bold", size = 14),
    axis.title.y = element_text(face = "bold", size = 14),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank()
  )

