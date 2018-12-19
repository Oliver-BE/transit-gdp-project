library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(tidyverse)
library(mosaic)

#library(gluskr)
#df <- transit_qol_df %>% 

df <- readRDS("../shiny-app/final_data.RDA") %>% 
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

ui <- fluidPage(
  headerPanel('Average Transit Statistics across US Cities from 2007-2017'),
  
  sidebarPanel(
    sliderInput('max_pop', 
                'Maximum Metropolitan Statistical Area Poulation (averaged from 2007-2017): ', 
                min = 1000000, max = 20000000, value = 20000000, step = 500000, ticks=F)
  ),
  
  mainPanel(
    leafletOutput("mymap", height = 600)
  )
  
)

server <- function(input, output, session){
  
  lat_long_df <- reactive({
    x <- df %>% 
      filter(avg_pop < input$max_pop)
  })
  
  output$mymap <- renderLeaflet({
    df <- lat_long_df()
    
    map <- leaflet(data = df) %>%
      addTiles() %>%
      addCircleMarkers(lng = ~longitude,
                       lat = ~latitude,
                       popup = paste("<em>",df$msa_name,"</em>", "<br>",
                                     "<b> Average Vehicle Hours per Capita per Year:  </b>", round(df$avg_vrh, digits=2), "hours", "<br>",
                                     "<b> Average Percent of Workers Commuting by Public Transport per Year: </b>", round(df$avg_commuting, digits=1),
                                     "%", "<br>", "<b> Average GDP per Capita per Year: </b> $", round(df$avg_gdp, digits=0))) %>% 
      setView(lng=-98.5795, lat=39.8283, zoom=4) #%>% 
    #mapview(popup = popupGraph(test_plot(), width = 300, height = 300))
    map
  })
}

shinyApp(ui = ui, server = server)
