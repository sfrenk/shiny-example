library(shiny)

# Define User Interface
shinyUI(pageWithSidebar(
    
    # Title
    headerPanel(h1("Beta distribution")),
    
    # Set up sidebar panel
    sidebarPanel(
        
        # Alpha shape parameter
        sliderInput("alpha", h2(HTML("&alpha;:")), 
                    min = 0, max = 5, value = 1, step = 0.5),
        
        # Beta shape parameter
        sliderInput("beta", h2(HTML("&beta;:")),
                    min = 0, max = 5, value = 1, step = 0.5),
        
        # Line color
        selectInput("color_choice", h2("Color:"),
                    choices = list("black", "blue", "red", "green"), selected = "black")
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
        plotOutput("plot")
    )
))
