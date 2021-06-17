library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel(
            numericInput("pval", "Choose pval threshold", value = 0, min=0, max=1, step=0.05),
            numericInput("logFC", "Choose a logFC threshold", value = 1, min = 0, max = 4)
        ),
        mainPanel()
    )
)

server <- function(input, output) {

}

shinyApp(ui, server)
