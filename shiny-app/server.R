library(shiny)
library(leaflet)
library(dplyr)

server <- function(input, output, session){
  
  lat_long_df <- reactive({
    x <- df %>% 
      filter(pop_estimate_msa < input$max_pop)
  })
  
  test_plot <- reactive ({
    ggplot(lat_long_df(), aes_string(x=msa_id, y=pop_estimate_msa)) +
      geom_point() +
      theme(legend.position = "none", axis.title = element_text(size = 15))
  })
  
  output$mymap <- renderLeaflet({
    df <- lat_long_df()
    
    map <- leaflet(data = df) %>%
      addTiles() %>%
      addCircleMarkers(lng = ~longitude,
                 lat = ~latitude,
                 popup = paste(df$msa_name, "<br>",
                               "ID #: ", df$msa_id)) %>% 
                 #icon = list(iconUrl = "") 
      setView(lng=-98.5795, lat=39.8283, zoom=4) #%>% 
      #mapview(popup = popupGraph(test_plot(), width = 300, height = 300))
    map
  })
}

  
