library(shiny)
shinyServer(function(input, output, session) {
  output$sideNote <- renderText({
    HTML(paste0("<b>","Note:","</b><br/>", "Suggest to untick China for better comparison of other countries only."))
  })
  
  data_virus <- read.csv(file = "CoronaVirus.csv")
  filter_data <- as.character(data_virus$Country)

  updateAwesomeCheckboxGroup(
    session = session, inputId = "id1",
    choices = filter_data,
    selected = filter_data
  )
  
  m <- list(
    l = 50,
    r = 50,
    b = 100,
    t = 150,
    pad = 5
  )
  
  output$plot1 <- renderPlotly({
    data_virus %>%
      filter(Country %in% input$id1) %>%
      plot_ly(labels=~Country, values=~Total, type="pie", height=500) %>%
      layout(title = "Cases by Country", margin = m)
    
  })
  
})