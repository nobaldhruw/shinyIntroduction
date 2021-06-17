library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            numericInput("x", "Enter value of x: ", value = 10, min = 10, max = 100)
        ),
        mainPanel(
            plotOutput("hist"),
            verbatimTextOutput("summary")
        )
    )
)

server <- function(input, output) {
    data <- reactive({
        rnorm(input$x)
    })
    output$hist <- renderPlot({
        hist(data())
    })
    output$summary <- renderPrint({
        summary(data())
    })
}

shinyApp(ui, server)
