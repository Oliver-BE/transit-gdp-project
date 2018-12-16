library(shiny)
library(leaflet)
library(dplyr)
# library(mapview)
# devtools::install_github("environmentalinformatics-marburg/mapview", ref = "develop")
# devtools::install_github("r-spatial/mapview@develop")
# devtools::install_github('r-lib/later')

ui <- fluidPage(
  headerPanel('Leaflet Map'),
  
  sidebarPanel(
    sliderInput('max_pop', 
                 'Maximum Metropolitan Statistical Area (MSA) Poulation (based on 2010 values): ', 
                 min = 1000000, max = 20000000, value = 1500000, step = 500000, ticks=F)
  ),
  
  mainPanel(
    leafletOutput("mymap", height = 600)
  )
 
  
)