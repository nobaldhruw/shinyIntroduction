library(shiny)

ui <- fluidPage(
    titlePanel("My app"),
    
    sidebarLayout(
        sidebarPanel("sidebar panel"),
        mainPanel(
            h1("Heading 1"),
            h2("Heading 2"),
            h3("Heading 3"),
            p("This is a simple paragraph"),
            p("This is another paragraph"),
            br(),
            br(),
            p("This is the last paragraph")
        )
    )
)

server <- function(input, output) {

}

shinyApp(ui, server)
