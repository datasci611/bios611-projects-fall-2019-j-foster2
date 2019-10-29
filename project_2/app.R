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
      sliderInput("year", h4("Year"),
                  min = 2006, max = 2018, value = c(2010, 2015),sep = ""),
      # Give the user the abilty to toggle between different items provided
      selectInput("service", h4("Commodity  Provided"), 
                  choices = list("Food" = 1, "Clothes" = 2
                                 ), selected = 1),
      #Provide some guidance to the user 
      helpText("Toggle between food and clothing to explore both annual and monthly trends in 
               the distribution of these resources. Use the slider above to select the date range of interest.
               These data are shown along with the average
               Durham Chapel Hill unemployment rate as recorded by the bureau of labor statistics.")
      
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
    
    line_plot(input$year, input$service)
    
  })
  
  output$monthPlot <- renderPlot({
    
    month_plot(input$year, input$plot_click, input$service)
  })
  
  
}

# Handle Error messages
options(shiny.sanitize.errors = TRUE)

shinyApp(ui = ui, server = server)

