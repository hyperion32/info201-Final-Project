#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("../source/analysis.R")
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Analysis of the Factors that Affect Sleep"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         #sliderInput("n_breaks",
         #            "Number of bins:",
         #             min = 10,
         #             max = 50,
         #             value = 30)
        
     # ),
     # sidebarPanel(
        selectInput('xCol', 'Choose First Variable', names(df_graph)),
        selectInput('yCol', 'Choose Second Variable', names(df_graph))),
      
      mainPanel(
        # plotOutput("distPlot"),
         plotOutput("scatterPlot"))
   ))

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
  
}

# Run the application 
shinyApp(ui = ui, server = server)

