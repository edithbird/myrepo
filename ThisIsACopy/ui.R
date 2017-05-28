#ui.r
library(shiny)
library(shinydashboard)
NewDF <- readRDS("NewDF.rds")
dashboardPage(
  dashboardHeader(title = "Shiny App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("DATATABLE", tabName = "dt", icon = icon("dashboard")),
      menuItem("SUMMARY", tabName = "sm", icon = icon("th")),
      menuItem("K-MEANS", tabName = "km", icon = icon("th"))
    )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dt",
              h2("DATA TABLE"),
              fluidRow(
                box(dataTableOutput("Table"),width = 400),
                box(plotOutput("plot2",click = "mouse"))
              )),
      tabItem(tabName = "sm",
              h2("SUMMARY"),
              fluidRow(
                box(dataTableOutput("Table2"),width = 400), 
                box(plotOutput("plot3",click = "mouse"))
              )
      ),
      tabItem(tabName = "km",
              h2("K-MEANS"),
              fluidRow(
                box(plotOutput("plot1",click = "mouse")),
                box(sliderInput("slider1", label = h4("Clusters"),
                                min = 1, max = 9, value = 4),
                    verbatimTextOutput("coord"))),
              fluidRow(
                box(checkboxGroupInput("checkGroup",
                                       label = h4("Variable X"),names(NewDF),
                                       selected=names(NewDF)[[2]]
                )),
                box(selectInput("select", label = h4("Variable Y"),
                                names(NewDF),selected=names(NewDF)[[2]]
                )))
      )
    )
  )
)
