library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
library(shinyWidgets)
source("analysis.R")

# page one
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

# page two
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

# page three
page_three <- tabPanel(
  "General Health vs Sleep",
  ui <- fluidPage(
    titlePanel("Indicators of Overall Health"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("age", "Age", 15, 70, c(15,70), step = 5, sep = ""),
        sliderInput("bmi", "BMI", 18, 50, c(18,50), step = 0.5, sep = "")
      ),
      mainPanel(
        plotOutput("hist"),
        p("This visualization is a histogram showing how general determinates of health,
          specifically BMI and age, affect average weekday sleep duration. BMI stands for
          body mass index, a generally accepted measurement of health.")
      ),
    )
  )
)

# page four
page_four <- tabPanel(
  "Next Steps",
  ui <- fluidPage(
    titlePanel("Conclusion of Our Analysis"),
    h4("Does physical activity affect sleep?"),
    p("Based on our analysis, physical activity slightly improves sleep quality and duration,
      on average."),
    h4("Does overall health affect sleep?"),
    p("Based on our analysis, general indicators of good overall health, specifically BMI and age,
      do not affect sleep duration.")
  )
)

# page five
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
      for us to create an application that meets our standards. Our visualizations
      use sliders and select inputs to allow the user to interact with the data
      in any way that they please."),
    h4("The Server"),
    p("Our server function takes in reactive information to output the desired
      visuals by the user. We displayed a scatterplot as well as a histrogram
      for our visualizations."),
    h4("Our Data"),
    p("Our project was driven by the high-quality dataset that we gained access to.
      The data that we gained access to was hosted by the National Sleep Research Resource.
      To gain access to the data, we had to submit a detialed request about our project,
      why we needed access to the data, how the data would be used, and who would have
      access to the data. The process took about two weeks, and once our request was approved,
      we had access to a dataset called 'Hispanic Community Health Study / Study of Latinos'.
      The data had 1,000+ attributes and 16,000+ records. This factor allowed us to choose
      what attributes we wanted to focus on given the scope of this project. Overall, we
      were very lucky to have gained access to a very high quality dataset.")
  )
  
)

# page six
page_six <- tabPanel(
  "Our Team",
  ui <- fluidPage(
    titlePanel("Sleep201"),
    h4("Affiliation"),
    "Greyson Fields, John Rosen, Harry Yao",
    br(), "Technical Foundations of Informatics",
    br(), "The Information School",
    br(), "University of Washington",
    br(), "Autumn 2019",
    h4("Project Team's Goals"),
    "Greyson's individual goal is to learn how to create
      intuitive and beautiful info visualizations.", br(),
    "John's individual goal is to learn how to transform
      data into real life solutions using R.", br(),
    "Harry's individual goal is to learn how to become a
      well-rounded R coder."),
    h4("Links"),
    a("Link to the Github Repository "),
    #href = "https://github.com/hyperion32/info201-Final-Project"),
    br(),
    a("Link to the Technical Report")
    #href = "https://github.com/hyperion32/info201-Final-Project/wiki/
    #Technical-Report")
)

# define the UI
ui <- navbarPage(
  "Sleep201",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six
)

# shiny UI
shinyUI(ui)
