library(shiny)
library(leaflet)
library(dplyr)

server <- function(input, output, session){
  
  lat_long_df <- reactive({
    x <- df #%>% 
      #filter(pop_estimate_msa < input$population)
  })
  
  output$mymap <- renderLeaflet({
    df <- lat_long_df()
    
    map <- leaflet(data = df) %>%
      addTiles() %>%
      addMarkers(lng = ~longitude,
                 lat = ~latitude,
                 popup = paste(df$msa_name, "<br>",
                               "ID #: ", df$msa_id)
                 #icon = list(iconUrl = ""),
                 ) %>% 
      setView(lng=-98.5795, lat=39.8283, zoom=4)
    map
  })
}

  
