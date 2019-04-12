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
             ~mutate(.x,
                     tahun = 2017,
                     tanggal_pembuatan = excel_numeric_to_date(tanggal_pembuatan))
            ) %>%
  map(~mutate_all(.x, as.character)) %>%
  bind_rows() %>%
  mutate_all(~na_if(.x, "-")) %>%
  mutate_all(~parse_guess(.x)) %>%
  
  
  
