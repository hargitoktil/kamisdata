library(dplyr)
library(readr)

compile <- read.csv("compile.csv")
edward <- read.csv("edward.csv")
imam <- read.csv("imam.csv")

glimpse(compile)
glimpse(edward)
glimpse(compile)

edward_txt <- edward %>%  
  mutate(Serial_Number = as.character("Serial_Number"))

compile_txt <- compile %>%
  mutate(Serial_Number = as.character("Serial_Number"))

str(compile_txt)

compile_sn <- left_join(compile_txt, edward_txt, "Serial_Number")