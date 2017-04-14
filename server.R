library(shiny)

# Define server logic
shinyServer(function(input, output, session) {
    
    # Change plot when alpha and beta slider values change
    vals <- reactive({
        
        alpha <- input$alpha
        beta <- input$beta
        
        x <- seq(0, 1, 0.01)
        
        curve(dbeta(x, alpha, beta), ylab = "PDF", col = input$color_choice)
        
    })
    
    # If user clicks "Go!", use provided quantile values to calculate alpha and beta
    observeEvent(input$go, {
        
        params <- beta.select(list(p = input$q1, x = input$p1), list(p = input$q2, x = input$p2))
        
        alpha_param <- params[1]
        beta_param <- params[2]
        
        updateSliderInput(session, "alpha", value = alpha_param)
        updateSliderInput(session, "beta", value = beta_param)
        
    })
    
    # Render plot
    output$plot <- renderPlot({
        vals()

    })
    
})