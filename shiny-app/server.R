library(shiny)
library(leaflet)
library(dplyr)
library(knitr)

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

  
