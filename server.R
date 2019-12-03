library(shiny)
library(rsconnect)
source("analysis.R")

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  #output$distPlot <- renderPlot({
  # generate bins based on input$bins from ui.R
  #  hist(df$SAWA50,
  #       breaks = as.numeric(input$n_breaks),
  #       xlab = "Duration (minutes)",
  #       ylab = "Frequency",
  #       main = "Average in-bed duration from main sleep period over all days",
  #       col = 'darkgray', border = 'white')
  
  
  
  # })
  df_new <- reactive({df_graph[, c(input$xCol, input$yCol)]})
  output$scatterPlot <- renderPlot({plot(df_new(), pch = 20, cex = 2, col = "Black",
                                         main = "Analysis")})
  
  df_new_2 <- reactive({df_graph[, c(input$xCol, input$yCol)]})
  output$scatterPlot2 <- renderPlot({plot(df_new(), pch = 20, cex = 2, col = "Black",
                                         main = "Analysis")})
}

# server
shinyServer(server)