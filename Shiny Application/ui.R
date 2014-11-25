library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Small Changes on Histogram"),
  sidebarPanel(
     numericInput("bars", "Number of Bars:", min = 1, max = 100, value=10, step = 5),
     sliderInput("color", "Color of Bars:", min = 1, max = 8, value=1, step= 1),
     submitButton('Submit')
     ),
  mainPanel(
      plotOutput("distPlot"), 
      tableOutput("values"), 
      helpText("Use numericInput to set number of bins of histogram"),
      helpText("Use sliderInput to set color of bins"),
      helpText("After setting these two parameters you see the values in table under the graph")
    )
  )
)