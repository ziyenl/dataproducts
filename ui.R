library(shiny)
# Loading 'swiss' data from datasets
library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Swiss Province Socioeconomic Indicator Comparison Tool"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        helpText("Please select two swiss regions for comparison:"),
        selectInput("region1", "1st Region:", 
                    choices=sort(rownames(swiss))),
        selectInput("region2", "2nd Region:", 
                    choices=sort(rownames(swiss)),
                    selected= tail(sort(rownames(swiss)), n=1)),
        hr(),
        helpText("Data is sourced from Project \"16P5\" where the data was collected for 47 French-speaking provinces in Switzerland at about 1888."),
        helpText("In 1888, Switzerland was entering a period known as the demographic transition whereby its fertility was beginning to fall from the high level typical of underdeveloped countries."),
        
        
        helpText("The following 6 socioeconomic indicators were measured:"),
        helpText(
          tags$ul(
            tags$li("Fertility"), 
            tags$li("Agriculture"), 
            tags$li("Examination"),
            tags$li("Education"),
            tags$li("Catholic (Religion)"),
            tags$li("Infant Mortality")
        )),
        h3('References:'),
        helpText("For more reference about the swiss data set:",a("Swiss data set", href="https://vincentarelbundock.github.io/Rdatasets/doc/datasets/swiss.html")),
        helpText("For more information about the source code:", br(), a("server.R", href="https://github.com/ziyenl/dataproducts/server.R"), " and ", a("ui.R", href="https://github.com/ziyenl/dataproducts/ui.R")) 
      ),

      # Create barplot
      mainPanel(
        plotOutput("swissPlot")  
      )
      
    )
  )
)