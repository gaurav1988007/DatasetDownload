library(shiny)
# Define UI for application
 shinyUI(fluidPage(
  # Header or Title Panel 
  titlePanel(title = h4("Download Datasets", align="center")),
  sidebarLayout(
    # Sidebar panel
    sidebarPanel(
      selectInput("var", "1. Select the dataset", choices =c("iris", "mtcars", "AirPassengers"), selected = 1),
      helpText("Please Select the Dataset to view the detailing"),
      br(),
      
      radioButtons("ext", "1. Select Format:", choices=c("CSV File (.csv)", "Text File (.txt)", "Doc File (.doc)"), selected ='CSV File (.csv)'),
      helpText("Please select the file format in which you want to download the file"),
      br(),
      
      downloadButton("downloadData","Download"),
      helpText("Please click on download button to download the selected dataset.")
      
    ),
    
    # Main Panel
  mainPanel(
    tableOutput('table') 
  )
 )
 )
 )
  