library(tidyverse)
library(janitor)

load("004_kamisdata_Peket-Lelang-Kota-Bandung/data/lelang_bandung.rda")

lelang_bandung

lelang_bandung %>% 
  map(dim)

setdiff(
  colnames(lelang_bandung$`Data Paket Lelang Tahun 2016`),
  colnames(lelang_bandung$`Data Paket Lelang Tahun 2017`)
)


lelang_bandung %>% 
  modify_at("Data Paket Lelang Tahun 2017",
             mutate(.x, tahun = 2017)) %>% 
map(dim)
