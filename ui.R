


library(shiny)
default_data <- "ID	TestData
This	data
is	tab
delimited	.
this	works
when copying from 	excel
"
fluidPage(
 
  splitLayout(
    inputPanel(
      verticalLayout(
      tags$textarea(id="text_input", rows=10, cols=40, default_data),
      radioButtons("delim", label = "delim", 
                   choices = list(
                     "Tab" = "\t",
                     "Space" = " ",
                     "|"
                   ),
                   selected = "\t"),
      
      checkboxInput("header", "First Row as Header?", value = TRUE),
      
      submitButton()
      )
    ),
    tableOutput("df")
  )
  
)
