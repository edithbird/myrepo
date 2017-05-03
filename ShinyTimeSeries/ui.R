library(shiny)
library(forecast)
fluidPage(
  titlePanel("Uploading Time Series Files"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      tags$hr(),
      uiOutput("fromCol"), 
      uiOutput("toCol"), 
      
      
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"'), 
      textInput("caption", "Caption:", "Data Summary"),
      numericInput("obs", "Number of observations to view:", min = 5, max = 10, value = 6)
    ),
    mainPanel(
      tableOutput('contents'), 
      verbatimTextOutput("summary"), 
      tableOutput("view")
    )
  )
)
