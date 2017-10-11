library(shiny)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  dataset <- reactive({
    if(is.null(input$df)){
      NULL
    } else {
      read.csv(input$df$datapath, header = T)
    }
  })
  
  observe({
    if(!is.null(input$df)) {
      updateSelectInput(session, "x.variable",
                        label = "Horizontal Axis",
                        choices = names(dataset()),
                        selected = sample(names(dataset()), 1))
      updateSelectInput(session, "y.variable",
                        label = "Vertical Axis",
                        choices = names(dataset()),
                        selected = sample(names(dataset()), 1))
      updateSelectInput(session, "color.variable",
                        label = "Color",
                        choices = names(dataset()),
                        selected = sample(names(dataset()), 1))
    }
  })
   
  output$plot <- renderPlot({
    if(is.null(input$df)){
      NULL
    } else {
      if(input$x.variable %in% names(dataset()) && input$y.variable %in% names(dataset())) {
        if(input$should.color) {
          ggplot() + geom_point(aes(dataset()[, input$x.variable], dataset()[, input$y.variable], color = factor(dataset()[, input$color.variable])))
        } else {
          ggplot() + geom_point(aes(dataset()[, input$x.variable], dataset()[, input$y.variable]))
        }
      } else {
        NULL
      }
    }
  })
  
})
