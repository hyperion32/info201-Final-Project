library(shiny)
library(rsconnect)
source("analysis.R")

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  df_new <- reactive({df_graph[, c(input$xCol, input$yCol)]})
  output$scatterPlot <- renderPlot({plot(df_new(), pch = 20, cex = 2, col = "Black",
                                         main = "Analysis")})

  
  
  min_bmi <- input$bmi[1]
  max_bmi <- input$bmi[2]
  
  min_age <- input$age[1]
  max_age <- input$age[2]
  df_viz_2 <- df %>% 
    filter(age <= max_age, age >= min_age) %>% 
    filter(bmi <= max_bmi, bmi >= min_bmi)
  df_new_2 <- reactive({df_viz_2[, c(input$xCol, input$yCol)]})
  output$scatterPlot2 <- renderPlot({plot(df_new_2(), pch = 20, cex = 2, col = "Black",
                                          main = "Analysis")})
  
}

# server
shinyServer(server)