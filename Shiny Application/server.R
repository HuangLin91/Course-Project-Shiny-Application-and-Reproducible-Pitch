library(shiny)

shinyServer( function(input, output) {
  my_colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan") 
  sliderValues <- reactive({
    data.frame(
      Name = c("Number of Bars", 
               "color"),
      Value = as.character(c(input$bars, 
                             my_colors[input$color])), 
      stringsAsFactors=FALSE)
  }) 
  
  output$values <- renderTable({
    sliderValues()
  })
  
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bars + 1)
    hist(x, breaks = bins, col = my_colors[input$color], border = 'white', main = "Histogram of some numeric variable")
  })
  
})