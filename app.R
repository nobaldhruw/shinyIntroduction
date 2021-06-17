library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("num", "Enter a number", min=10, max = 100, value = 50, step = 10)
        ),
        mainPanel(
            plotOutput("hist")
        )
    )
)

server <- function(input, output) {
    output$hist <- renderPlot({
        x <- rnorm(input$num)
        hist(x)
    })
}

shinyApp(ui, server)
