{
  ## Dependencies
  library(shiny)

  ## Load Modules 
  source("R/Modules/OldFaithful.R")
}

ui <- fluidPage(
  tags$head(includeCSS("CSS/Header.css")),
  tags$head(includeCSS("CSS/NavbarPage.css")),
  tags$head(includeCSS("CSS/Home.css")),
  tags$head(includeHTML("HTML/FontAwesomeLoader.html")),
  includeHTML("HTML/Header.html"),
  navbarPage( id = 'navbar',
              title = "COVID-19 in SALURBAL Countries",
              tabPanel("Home",includeHTML("HTML/Home.html")),
              tabPanel("Figure1",OldFaithful_UI("Figure1"))
  ),
  includeHTML("HTML/Footer.html")
)

server <- function(input, output, session) {
  OldFaithful_Server("Figure1")
}

shinyApp(ui, server)