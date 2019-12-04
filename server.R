library(shiny)
library(dplyr)
library(rsconnect)
library(ggplot2)
source("analysis.R")

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  # create the reactive dataframe for the first visualization
  df_new <- reactive({df_graph[, c(input$xCol, input$yCol)]})
  
  # create the first visualization
  output$scatterPlot <- renderPlot({plot(df_new(), pch = 20, cex = 2, col = "Black",
                                         main = "Analysis")})
  
  # create the reactive dataframe for the second visualization
  df_new_2 <- reactive({df_sleep %>% 
      filter(age <= input$bmi[2] & age >= input$bmi[1] &
               bmi <= input$age[2] & bmi >= input$age[1]) %>% 
      select(age, sleep_dur_wkday)})

  # create the second visualization
  output$hist <- renderPlot(ggplot(df_new_2(), 
                                           aes(x=sleep_dur_wkday))
                                    + geom_histogram(binwidth = 1)
                                    + xlab("Sleep Duration"))
}

# shiny server
shinyServer(server)

