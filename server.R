library(shiny)
# Loading 'swiss' data from datasets
library(datasets)


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill plot
  output$swissPlot <- renderPlot({
    # Render a barplot
    barplot(sapply(swiss[rownames(swiss) %in% c(input$region1, input$region2),], as.matrix), 
            beside=TRUE,
            main=paste(input$region1, input$region2, sep=" vs."),
            ylab="Percentage (%)",
            xlab="Socioeconomic Indicators")
  })
})
