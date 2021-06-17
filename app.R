library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            actionButton("norm", "norm"),
            actionButton("unif", "unif")
        ),
        mainPanel(
            plotOutput("hist"),
            verbatimTextOutput("summary")
        )
    )
)

server <- function(input, output) {
    rv <- reactiveValues(data = rnorm(100), updateCount = 0)
    
    observeEvent(input$norm, { 
        rv$data <- rnorm(100) 
        rv$updateCount <- rv$updateCount + 1
    })
    observeEvent(input$unif, { 
        rv$data <- runif(100) 
        rv$updateCount <- rv$updateCount + 1
    })
    observeEvent(rv$updateCount, {
        print(rv$updateCount)
    })
    output$hist <- renderPlot({
        hist(rv$data)
    })
    output$summary <- renderPrint({
        summary(rv$data)
    })
}

shinyApp(ui, server)
