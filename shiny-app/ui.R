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
    numericInput('max_pop', 
                'Maximum Metropolitan Statistical Area (MSA) Poulation (based on 2010 values): ', 
                value = 700000, min = 0, max = 20000000, step = 100000)
  ),
  
  mainPanel(
    leafletOutput("mymap", height = 600)
  )
 
  
)