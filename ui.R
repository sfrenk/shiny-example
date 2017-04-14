library(shiny)
library(LearnBayes)

# Define User Interface
shinyUI(pageWithSidebar(
    
    # Title
    headerPanel(h1("Beta distribution")),
    
    # Set up sidebar panel
    sidebarPanel(
        
        # Line color
        selectInput("color_choice", "Color:",
                    choices = list("black", "blue", "red", "green"), selected = "black"),
        
        # Alpha shape parameter
        sliderInput("alpha", HTML("&alpha;:"), 
                    min = 0, max = 5, value = 1, step = 0.01),
        
        # Beta shape parameter
        sliderInput("beta", HTML("&beta;:"),
                    min = 0, max = 5, value = 1, step = 0.01),
        
        # Quantile selection to caluclate alpha and beta
        strong("Calculate alpha and beta based on two quantiles"),
        fluidRow(
            column(6, numericInput("q1", "Quantile 1:", 0.25, min = 0, max = 1, step = 0.01)),
            column(6, numericInput("p1", "Prob 1:", 0.25, min = 0, max = 1, step = 0.01))
        ),
        
        fluidRow(   
            column(6, numericInput("q2", "Quantile 2:", 0.75, min = 0, max = 1, step = 0.01)),
            column(6, numericInput("p2", "Prob 2:", 0.75, min = 0, max = 1, step = 0.01))
        ),
        
        actionButton("go", "Go!")
        
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
        plotOutput("plot")
    )
))
