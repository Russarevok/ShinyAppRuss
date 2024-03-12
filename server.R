library(shiny)

data("USArrests")

# Define server logic required to draw a histogram
function(input, output, session) {
    
    output$arrestPlot <- renderPlot({
      top_N <- head(USArrests[order(USArrests[, input$ArrestCategory], decreasing = TRUE), ], input$numericTopN)
      xCol <- input$ArrestCategory
      mainlabel <- paste( xCol," by State for Year 1973")
      xlabel <- "State"
      ylabel <- paste( xCol," (per 100K residents)")
      
      par(mar=c(7, 7, 2, 2), mgp=c(5,2,0))
      
      mids <- barplot(top_N[, xCol], col='skyblue', las=2, cex.names=0.7, cex.axis=0.7)
      mtext(rownames(top_N), 1, at=mids, las=2, cex=0.7)
      
      title(mainlabel)
      title(xlab=xlabel, font.lab=2)
      title(ylab=ylabel, font.lab=2)
    })
}