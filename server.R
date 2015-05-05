source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)
library(shiny)

# server.R
shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      data=counties$asian;
      color = 'purple';
      if (input$var == 'Percent White') {
        data=counties$white;
        color = 'green';
      } else if (input$var == 'Percent Black') {
        data=counties$black;
        color = 'black';
      } else if (input$var == 'Percent Hispanic') {
        data=counties$hispanic;
        color = 'brown';
      }
      percent_map(data, color, paste("% ",input$var), input$range[1], input$range[2]);
    });
  })
