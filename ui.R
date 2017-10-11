library(shiny)

shinyUI(fluidPage(
  titlePanel("Tabula"),
  sidebarLayout(
    sidebarPanel(
      fileInput("df", "Choose CSV File", accept = c(".csv")),
      hr(),
      selectInput("x.variable", "Horizontal Axis", c("Upload a file!")),
      selectInput("y.variable", "Vertical Axis", c("Upload a file!")),
      hr(),
      checkboxInput("should.color", "Color Data Points?"),
      selectInput("color.variable", "Color", c("Upload a file!"))
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
))
