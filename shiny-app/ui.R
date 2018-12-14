library(shiny)
library(leaflet)
library(dplyr)

ui <- fluidPage(
  headerPanel('Leaflet Map'),
  
  sidebarPanel(
    numericInput('max_pop', 
                'Maximum Metropolitan Statistical Area (MSA) Poulation (based on 2010 values): ', 
                value = 700000, min = 0, max = 20000000, step = 100000)
  ),
  
  mainPanel(
    leafletOutput("mymap",height = 600)
  )
 
  
)