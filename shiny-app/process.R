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
library(gluskr)

df <- transit_qol_df %>% 
  mutate("latitude" = intptlat, "longitude" = intptlon) %>% 
  group_by(year, msa_id) %>% 
  mutate(sum_year_vrh = sum(per_capita_vrh)) %>% 
  select(-transit_modes) %>% 
  unique() %>% 
  ungroup() %>% 
  select(msa_id, latitude, longitude, msa_name, sum_year_vrh, per_capita_gdp, percent_commuting_msa, pop_estimate_msa) %>% 
  group_by(msa_id) %>% 
    mutate(avg_gdp = mean(per_capita_gdp, na.rm= TRUE),
           avg_pop = mean(pop_estimate_msa),
           avg_commuting = mean(percent_commuting_msa),
           avg_vrh = mean(sum_year_vrh)) %>% 
    select(msa_id, latitude, longitude, msa_name, avg_vrh, avg_gdp, avg_commuting, avg_pop) %>% 
    unique() %>% 
    drop_na()
  
saveRDS(df, "../df.rds")
  
  
  
  