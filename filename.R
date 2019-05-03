library(dplyr)
library(readr)
library(tidyr)
library(janitor)
library(purrr)
library(hablar)
library(XLConnect)
library(rJava)
compile <- tbl_df(read.csv("compile.csv"))
edward <- tbl_df(read.csv("edward.csv"))
imam <- tbl_df(read.csv("imam.csv"))

compile
edward
imam

imam %>% convert(chr(Pegawai)) %>% semi_join(edward, by = "Nomor_BMN")
edward_ch <- edward %>% convert(chr(Pegawai))  %>% convert(chr(Nomor_BMN)) 
imam_ch <- imam %>% convert(chr(Pegawai)) %>% convert(chr(Nomor_BMN)) 
compile_ch <- compile %>% convert(chr(Pegawai))
imam_ch
edward_ch

imam_edward <- imam_ch  %>% full_join(edward_ch, by = c("Nomor_BMN", "Pegawai"))

compile_peg <- compile_ch %>% full_join(imam_edward, by = "Pegawai")

write.csv(compile_peg, "filename.csv")