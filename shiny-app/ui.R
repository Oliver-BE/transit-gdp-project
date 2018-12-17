library(shiny)
library(leaflet)
library(dplyr)


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