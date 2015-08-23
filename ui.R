default_location = "Dwarka"

shinyUI(fluidPage(
  
  titlePanel("How Unsafe I am?"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      strong(h4("Please enter your travel details:", style = "color:green")),
      
      selectInput("location" ,  label =  "Select Location", choices = location, selected = default_location, multi = TRUE),
      
      sliderInput("time", 
                  label = strong("i'll be visiting between :"),
                  min = 0, max = 23, value = c(0,23)),
      
      radioButtons("transport", label = strong("I'll be travelling by:"),choices = list("Metro"=1,"Public bus"=2,"Personnel car"=3,"Cab"=4,"Auto-rickshaw"=5,"Foot"=6), selected = 3)),

    mainPanel(
      tabsetPanel(
        tabPanel("Summary", textOutput("text1"),
                 textOutput("text2"),
                 textOutput("text3"),
                 textOutput("text4")),
         
        tabPanel("Documentation", verbatimTextOutput("Documentation"))
      )
    )
  )
))
