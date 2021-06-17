library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            numericInput("x", "Enter value of x: ", value = 10, min = 10, max = 100),
            actionButton("go", "Update")
        ),
        mainPanel(
            plotOutput("hist"),
            verbatimTextOutput("summary")
        )
    )
)

server <- function(input, output) {
    data <- eventReactive(input$go, {
        rnorm(input$x)
    })
    observeEvent(input$go, {
        write.csv(data(), 'data.csv')
    })
    output$hist <- renderPlot({
        hist(data())
    })
    output$summary <- renderPrint({
        summary(data())
    })
}

shinyApp(ui, server)
