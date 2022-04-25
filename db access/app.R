library(shiny)
library(DBI)
library(odbc)
library(dplyr)
library(pins)
library(leaflet)
library(ggplot2)

#bring in access table
board <- board_rsconnect()
access_table <- pin_read(board, "katie.masiello/access_table")


ui <- fluidPage(
  titlePanel("Data Level Security"),
  mainPanel(
    tags$h2("Logged in as: "), 
    tags$h3(textOutput("user")),
    tags$h3(textOutput("user_zone"))
  )
)

server <- function(input, output, session) {
  # Allows the app to be work while developing and when
  # publishing to RStudio Connect without changing code
  if(Sys.getenv("R_CONFIG_ACTIVE") == "rsconnect") {
    user_name <- session$user
    user_groups <- session$groups
  } else {
    user_name <- "xu.fei"
  }
  
  output$user <- renderText(user_name)
  
  user_zone <- access_table %>% filter(user == user_name) %>% pull(zone)
  
  output$user_zone <- renderText(user_zone)
}

shinyApp(ui = ui, server = server)