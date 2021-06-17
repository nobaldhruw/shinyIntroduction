library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel("sidebar panel"),
        mainPanel("main panel")
    )
)

server <- function(input, output) {

}

shinyApp(ui, server)
