library(shiny)
library(ggplot2)

##UI

ui = fluidPage( ##Content resizes to the window size of the browser
  titlePanel("Diamonds Data"), ##Sets the main title of the app
  sidebarLayout(            ##Creates the layout for a sidebar
    sidebarPanel(
      helpText("This application is intended to help visualize the 'diamonds' dataset"),
      textInput(inputId = "title", 
                label = "Chart Title", 
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack", "dodge"),
                  selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")   ##assigning an outputID for display
    )
  )
  
) 

##Server

server = function(input, output){     
  
  output$plot = renderPlot(
  ggplot(diamonds, aes(x = cut, fill = clarity)) +
    geom_bar(position = input$pos) +
    ggtitle(input$title)
  )
  
}

##Running the code
shinyApp(ui, server)


