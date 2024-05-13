library(shiny)


moje_dane <- read.csv("TPMs_table_100genes.csv")
genes = my_data$GeneID


# Define UI
ui <- fluidPage(
  
  # Application title
  titlePanel("Expression of specific gene"),
  
  sidebarLayout(
    
    # Sidebar with an input
    sidebarPanel(
      selectInput(
        'GENE',
        h3('Selected a gene you want to see expression for'),
        choices = genes)
      
    ) ,
    # Show plot
    mainPanel(
      plotOutput("expression")
    )
  )
)
