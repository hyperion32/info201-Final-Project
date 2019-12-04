library(shiny)
library(rsconnect)
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
  p("1. How does physical activity affect sleep?"),
  p("2. How does overall health (BMI and age) affect sleep?"),
)

page_two <- tabPanel(
  "Physical Activity vs Sleep",
  ui <- fluidPage(
    titlePanel("How Does Physical Activity Affect Sleep?"),
    sidebarLayout(
      sidebarPanel(
        selectInput('xCol', 'Choose Physical Activity Component', names(limited_var_x)),
        selectInput('yCol', 'Choose Sleep Component', names(limited_var_y))
      ),
      mainPanel(
        plotOutput("scatterPlot"),
        p("This visualization compares physical activity components to the quality
          of sleep a person received. The data is pulled from the HCHS database that
          we received access to for this project. In the sidebar selection, there are
          three components that can be selected for physical activity. Also, there are
          three components that can be selected for sleep quality. From there, you can
          analyze the histogram based on the components that have been selected.")
      ),
    )
  )
)

page_three <- tabPanel(
  "Visualization2",
  ui <- fluidPage(
    titlePanel("Title"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("age", "Age", 0, 100, c(0,100), step = 5, sep = ""),
        sliderInput("bmi", "BMI", 0, 50, c(0,50), step = 0.5, sep = "")
      ),
      mainPanel(
        plotOutput("scatterPlot2"),
        p("add description of the visualization")
      ),
    )
  )
)

page_four <- tabPanel(
  "Next Steps",
  ui <- fluidPage(
    titlePanel("Conclusion of Our Analysis"),
    h4("Conclusion Title 1"),
    p("describe our findings here"),
    h4("Conclusion Title 2"),
    p("decribe our findings here")
  )
)

page_five <- tabPanel(
  "About the Application",
  ui <- fluidPage(
    titlePanel("Technology Used"),
    h4("The User Interface"),
    p("We used a multi-page layout to create our Shiny application.
        A multi-page layout allowed for easy naviagtion of the application.
        We want our users to fully understand our project, the details
        behind our project, and interact with the visualizations that we
        have created. The Shiny package and dplyr package have allowed
        for us to create an application that meets our standards."),
    h4("The Server"),
    p("Details about the server app go here."),
  )
  
)

page_six <- tabPanel(
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
  page_five,
  page_six
)

shinyUI(ui)
