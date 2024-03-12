library(shiny)

df <- USArrests

numerOfStates=nrow(df)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("US Arrest Statistics"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons("ArrestCategory", "1. Choose a crime:",
                         c("Murder" = "Murder",
                           "Assault" = "Assault",
                           "Rape" = "Rape")),
            numericInput(inputId="numericTopN", label = "2. Enter the top number of states to display:", min=1, max=numerOfStates, value = 10),
            # submitButton('Submit')
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("arrestPlot")
        )
    )
)
