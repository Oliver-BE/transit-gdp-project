library(dplyr)
library(jsonlite)
library(httr)
library(rvest)
library(readxl)
library(tidyverse)
library(mdsr)   
library(tidyr)
library(ggplot2)
library(readr)
library(knitr)
library(shiny)
library(leaflet)

df <- transit_qol_df %>% 
  filter(year == 2010) %>% 
  mutate("latitude" = intptlat, "longitude" = intptlon) %>% 
  group_by(msa_id, latitude, longitude, msa_name, pop_estimate_msa) %>% 
  summarize() %>% 
  select(latitude, longitude, msa_name, msa_id, pop_estimate_msa) %>% 
  drop_na()

saveRDS(df, "../df.rds")

