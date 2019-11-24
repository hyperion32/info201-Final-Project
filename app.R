library(shiny)
source("analysis.R")

page_one <- tabPanel(
   "Introduction",
   titlePanel("The Problem Situation"),
   p("In the States, many people prioritize work and school over sleep,
     and American labor laws generally encourage this unhealthy behavior.
     Identifying the factors that affect sleep quality could help policymakers
     create labor laws that encourage high quality of sleep, which could
     massively improve general quality of life. If labor laws were tightened
     to encourage shorter hours, many companies would suffer as a result.
     Some countries also have a culture of excessively long workdays.
     There might be some tension between these cultures and data that
     doesn't support long workdays."),
   h2("Research Questions"),
   p("1. What variables affect sleep quality and duration the most?"),
   p("2. How do socioeconomic factors affect sleep quality and duration?"),
)

page_two <- tabPanel(
   "Visualizations",
   ui <- fluidPage(
      titlePanel("Analysis of the Factors that Affect Sleep"),
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
            selectInput('yCol', 'Choose Second Variable', names(df_graph))
         ),
         
         mainPanel(
            # plotOutput("distPlot"),
            plotOutput("scatterPlot")
         )
      
         )
      )
)

page_three <- tabPanel(
   "Next Steps",
   ui <- fluidPage(
      titlePanel("Conclusion"),
      h2("Conclusion Title 1"),
      p("Description"),
      h2("Conclusion Title 2"),
      p("Description")
   )
)

page_four <- tabPanel(
   "About the Application",
   ui <- fluidPage(
      titlePanel("Technology Used"),
      h2("The User Interface"),
      p("We used a multi-page layout to create our Shiny application.
        A multi-page layout allowed for easy naviagtion of the application.
        We want our users to fully understand our project, the details
        behind our project, and interact with the visualizations that we
        have created. The Shiny package and dplyr package have allowed
        for us to create an application that meets our standards."),
      h2("The Server"),
      p("Details about the server go here."),
   )
   
)

page_five <- tabPanel(
   "Our Team",
   ui <- fluidPage(
      titlePanel("Sleep201"),
      "Greyson Fields, John Rosen, Harry Yao",
      br(), "Technical Foundations of Informatics",
      br(), "The Information School",
      br(), "University of Washington",
      br(), "Autumn 2019",
      h2("Project Team's Goals"),
      "Greyson's individual goal is to learn how to create
      intuitive and beautiful info visualizations.", br(),
      "John's individual goal is to learn how to transform
      data into real life solutions using R.", br(),
      "Harry's individual goal is to learn how to become a
      well-rounded R coder."),
   h2("Links"),
   a("Link to the Github Repository "),
     #href = "https://github.com/hyperion32/info201-Final-Project"),
   br(),
   a("Link to the Technical Report")
     #href = "https://github.com/hyperion32/info201-Final-Project/wiki/
              #Technical-Report")
)

ui <- navbarPage(
   "Sleep201",
   page_one,
   page_two,
   page_three,
   page_four,
   page_five
)



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

