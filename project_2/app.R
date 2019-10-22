library(shiny)
library(tidyverse)
source("helper_functions.R")
# library(rsconnect)
# rsconnect::deployApp('/Users/jnote29/Desktop/bios_611/bios611-projects-fall-2019-j-foster2/project_2/')

# Define UI for app that draws a violin plot
ui <- fluidPage(
  
  # App title ----
  titlePanel("UMD Data Explorer"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: variable used for x-axis of violin plot ----
      sliderInput("year", "Year",
                  min = 2006, max = 2019, value = c(2010, 2015),sep = ""),
      # Give the user the abilty to toggle between different items provided
      selectInput("select", h3("Commodity  Provided"), 
                  choices = list("Food" = 1, "Clothes" = 2,
                                 "Diapers" = 3), selected = 1),
      #TODO for final project
      helpText("For the final version of the dashboard I plan to activate the drop down for the user to choose
               between food, clothes, and diapers. For each of these items I will provide a figure that
               shows total amount of a given item provided for a given time period. \n I will also 
               look to incoporate external data about the number of homeless people in Durham for a give year.")
      
      ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Display line plot showing total amount of food provided over a range of years
      plotOutput(outputId = "popPlot", click = "plot_click"),
      # Display a new line plot shwoing the month-to-month break down of total food provided
       plotOutput(outputId = "monthPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # renderPlot creates violin plot and links to ui
  output$popPlot <- renderPlot({
    
    line_plot(input$year)
    
  })
  
  output$monthPlot <- renderPlot({
    
    month_plot(input$year, input$plot_click)
  })
  
  # # renderText creates uniqe variable text and links to ui
  # output$num_unique <- renderText({
  #   
  #   unique_features(uncp_df, input$radio)
  #   
  #   })
  
}

# Handle Error messages
options(shiny.sanitize.errors = TRUE)

shinyApp(ui = ui, server = server)

