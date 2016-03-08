
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(readr)


shinyServer(function(input, output) {
   
  parsed_df <- eventReactive(input$parse_text, {
    raw <- input$text_input
    
    read_delim(raw, 
               delim = input$delim, 
               col_names = input$header)
    
    
  })
  
  output$df <- renderTable({
    #if(is.null(parsed_df)) return()
    parsed_df()
  })
  
})
