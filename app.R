library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            numericInput("pval", "Choose pval threshold", value = 0, min=0, max=1, step=0.05),
            numericInput("logFC", "Choose a logFC threshold", value = 1, min = 0, max = 4)
        ),
        mainPanel(
            textOutput("pval_output"),
            textOutput("logFC_output")
        )
    )
)

server <- function(input, output) {
    output$pval_output <- renderText({
        paste0("pval threshold: ", input$pval)
    })
    
    output$logFC_output <- renderText({
        paste0("logFC theshold: ", input$logFC)
        
    })
}

shinyApp(ui, server)
