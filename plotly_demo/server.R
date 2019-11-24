library(shiny)
library(plotly)
library(ggplot2)

data(mtcars)
factor_vars <- c("cyl", "vs", "am", "gear", "carb")
for (var in factor_vars) {
    mtcars[, var] <- as.factor(mtcars[[var]])
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$vanilla_ggplot <- renderPlot({
        req(input$x, input$y, input$color)
        ggplot(mtcars, aes_string(input$x, input$y, fill = input$color)) +
            geom_boxplot()

    })

    output$interactive_ggplotly <- renderPlotly({
        req(input$x, input$y, input$color)
        plot <- ggplot(mtcars, aes_string(input$x, input$y, fill = input$color)) +
            geom_boxplot()
        ggplotly(plot) %>%
            layout(boxmode = "group")
    })

})
