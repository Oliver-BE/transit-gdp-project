library(shiny)
library(leaflet)
library(dplyr)

ui <- fluidPage(
  headerPanel('Leaflet Map'),
  
  sidebarPanel(
    sliderInput('population', 'Metropolitan Statistical Area Poulation: ', 
                 min = 0, max = 21000000, value = 21000000, step = 1000000, ticks = F)
  ),
  
  mainPanel(
    leafletOutput("mymap",height = 600)
  )
 
  
)