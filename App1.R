####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("superhero"), 
    navbarPage(
      # theme = "cerulean",  # <--- To use a theme, uncomment this
      "Djibril's first app",
      tabPanel("Navbar 1",
               sidebarPanel(
                 tags$h3("Noms:"),
                 textInput("txt1", "Nom:", " Isaac"), # txt1 will be send to the server
                 textInput("txt2", "Prenom:", "Newton"), # txt2 will be send to the server
                 textInput("txt3", "Age")
                 
               ), # sidebarPanel
               mainPanel(
                            h1("Chap 1"),
                            
                            h4("Sortie 1"),
                            verbatimTextOutput("txtout"), # txtout genereted from the server
                            #verbatimTextOutput("tout"),

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2", "This panel is intentionally left blank"),
      tabPanel("Navbar 3", "This panel is intentionally left blank")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
   # output$tout <- renderText({
    #  paste( input$txt1, input$txt2, input$txt3, sep = "  " )
   # })
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, input$txt3, sep = "  " )
    })
  } # server
  

  # Create Shiny object
  shinyApp(ui = ui, server = server)
