#server.R
NewDF <- readRDS("NewDF.rds")
library(shiny)
library(shinydashboard)
library(ggplot2)
shinyServer(function(input, output) {
  output$Table <- renderDataTable(
    NewDF,options = list(
      lengthMenu = list(c(10, 20, 30,-1),c('10','20','30','ALL')),
      pageLength = 10))
  sumNewDF<-as.data.frame.array(summary(NewDF))
  output$Table2 <- renderDataTable(sumNewDF)
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    plot(Data(),main = "K-MEANS",
         col = Clusters()$cluster,
         pch = 20, cex = 3,
         cex.main = 2,   font.main= 4, col.main= "blue")
  }, width = "auto",height = "auto")
  
  output$plot2 <- renderPlot({
    
    
    ggplot(NewDF, aes(x = e, fill = factor(f))) +geom_bar()
  })
  
  output$plot3 <- renderPlot({
    
    
    ggplot(NewDF, aes(x = e, y = a, col = factor(f))) +geom_point(size = 4)
  })
  
  output$coord <- renderText({
    paste0("x=", input$mouse$x, "\ny=", input$mouse$y)
  })
  
  
  Data <- reactive({NewDF[, c(input$select,input$checkGroup)]
  })
  Clusters <- reactive({
    kmeans(Data(),input$slider1)
  })
})
