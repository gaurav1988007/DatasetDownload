library(shiny)

shinyServer(
  
  function(input, output) {
    datasetInput <- reactive({
      switch(input$var,
             "iris" = head(iris),
                   #list(summary(iris), mean(iris),head(iris)),
             "mtcars" = mtcars,
               #summary(mtcars), mean(mtcars),head(mtcars), 
             "AirPassengers" = AirPassengers)
    })
    
    filesext <- reactive({
      switch(input$ext, 
             "CSV File (.csv)" = "csv",
              "Text File (.txt)" = "txt",
              "Doc File (.doc)" = "doc")
      
    })
      output$table <- renderTable({ 
        datasetInput()
      
             })
    
   
       output$downloadData <- downloadHandler(
        
        filename = function(){
          
          paste(input$var, filesext(), sep = ".")
        }, 
        
        content =  function(file)
        {
          
          sep <- switch(input$ext, "CSV File (.csv)" = ",", 
                        "Text File (.txt)" ="\t", "Doc File (.doc)" = " ")
          
          write.table(datasetInput(),file, sep = sep, row.names = FALSE )
                 
          })
       })
            
      

    
  