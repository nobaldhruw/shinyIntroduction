library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            numericInput("x", "Enter value of x: ", value = 1),
            numericInput("y", "Enter value of y: ", value = 2)
        ),
        mainPanel(
            textOutput("sum")
        )
    )
)

server <- function(input, output) {
    output$sum <- renderText({
        input$x + input$y
    })
}

shinyApp(ui, server)
