library(shiny)
library(ggplot2)

# Define server logic
shinyServer(function(input, output) {
    
    # Reactive expression to link slider input to output
    output$plot <- renderPlot({
        
        #hist(rnorm(n = 100, mean = input$mean, sd = input$sd))
        x <- seq(0, 1, 0.01)
        fx <- dbeta(x, shape1 = input$alpha, shape2 = input$beta)
        
        ggplot()+
            geom_smooth(aes(x = x, y = fx), color = input$color_choice, method = "loess", se = FALSE)+
            scale_x_continuous(limits = c(0, 1), expand = c(0, 0))+
            xlab("x")+
            coord_cartesian(ylim = c(0, 2.5), expand = c(0,0))+
            ylab("PDF")+
            theme_bw()+
            theme(panel.grid = element_blank())
    })
    
})