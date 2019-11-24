library(shiny)
library(plotly)

shinyUI(fluidPage(

    titlePanel("Using plotly in Shiny apps"),

    sidebarLayout(
        sidebarPanel(
            selectInput(
                "x",
                "X Variable:",
                c("cyl", "vs", "am", "gear", "carb")
            ),
            selectInput(
                "y",
                "Y Variable:",
                c("mpg", "disp", "hp", "wt", "qsec")
            ),
            selectInput(
                "color",
                "Group by Variable:",
                rev(c("cyl", "vs", "am"))
            )
        ),

        mainPanel(
            tabsetPanel(
                tabPanel(
                    "Vanilla plot using ggplot2",
                    plotOutput("vanilla_ggplot")
                ),
                tabPanel(
                    "Interactive Plot using plotly",
                    plotlyOutput("interactive_ggplotly")
                )
            )
        )
    )
))
