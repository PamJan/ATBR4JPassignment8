library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

server <- function(input, output, session) {
  observe({
    
    # Accessing data
    my_data <- read.csv("TPMs_table_100genes.csv")
  
    # creating new array containing genes
    genes <- my_data$GeneID
  
    # accessing to the UI 
    updateSelectInput(session, 'GENE', choices = genes)
  })
  
  #making plot
  output$expression <- renderPlot({
    
    filtered_gene_exp <- my_data %>%
      # filtering required data
      filter(GeneID == input$GENE)
    
    long_filtered_gene_exp <- filtered_gene_exp %>%
      tidyr::pivot_longer(cols=matches('Treated|Control'), names_to='Sample_Name', values_to='Expression')
    
    # creating bar plot
    ggplot(long_filtered_gene_exp, aes(x=Sample_Name, y=Expression, fill=Sample_Name)) +
      geom_bar(stat = "identity") +
      theme_minimal()
  })

}
