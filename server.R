# server.R

library (shiny)
library (rCharts)
d <- locationdata
m <- incidentdata

shinyServer(
  function(input, output) {
    
    output$text1 <- renderText({ 
      paste("You will be visiting", input$location)
    })
    
    output$text2 <- renderText({ 
      paste("Your time of visit will be from", input$time[1], "to", input$time[2])})
    
    output$text3 <- renderText({ 
      paste("You have selected", input$transport, "number mode of transport")
    })
    
    output$text4 <- renderText({ 
      if(input$transport == 1 | input$transport == 2) {
        if(input$time[1] < 6){
          paste("You won't get public transport at this time. Normally public transport starts at 5")
        } else {
          if(input$time[1] > 7 & input$time[2] <11 | input$time[1] > 16 & input$time[2] <21){
            paste("You are 50% safe. These are peak hours for commuting thus public conveynces are crowded and should be avoided ")}
          else {
            if(input$time[1] >=12 & input$time[2] <18) {
              paste("You are 70% safe")
            } else {
              paste("You are 40% safe")  
            }
          }
        }
      } else {
        if(input$transport == 3){
          if(input$location == "Connaught Place"|input$location == "Delhi Cantonment"|input$location == "Vasant Vihar"|input$location == "Model Town"|input$location == "Punjabi Bagh"|input$location == "Defence Colony"|input$location == "Karol Bagh"|input$location == "Chanakyapuri"|input$location == "Rajouri Garden"|input$location == "Hauz Khas"|input$location == "Saket"){
            "You are 80% safe"
          } else {
            if(input$location == "Narela"|input$location == "Alipur"|input$location == "Kanjhawala"|input$location == "Najafgarh"|input$location == "Seelampur"|input$location == "Shahdara"|input$location == "Seemapuri"){
              "You are 40% safe. This area is an outskirt of Delhi with rural population so caution is needed"
            } else {
              "You are 55% safe"
          }
        }
      } else {
        if(input$transport == 4 | input$transport == 5){
        if(input$location == "Connaught Place"|input$location == "Delhi Cantonment"|input$location == "Vasant Vihar"|input$location == "Model Town"|input$location == "Punjabi Bagh"|input$location == "Defence Colony"|input$location == "Karol Bagh"|input$location == "Chanakyapuri"|input$location == "Rajouri Garden"|input$location == "Hauz Khas"|input$location == "Saket"){
          "You are 65% safe"
        } else {
          if(input$location == "Narela"|input$location == "Alipur"|input$location == "Kanjhawala"|input$location == "Najafgarh"|input$location == "Seelampur"|input$location == "Shahdara"|input$location == "Seemapuri"){
            "You are 32% safe. This area has deserted portion, so be careful while using cab or auto-rickshaw"
          } else {
            "You are 45% safe"
          }
        }
        } else {
          if(input$transport == 6){
            if(input$time[1] < 6){
              "You are 5% safe"
            } else {
              if(input$time[1] < 9){
                "You are 30% safe."
              } else {
                if(input$time[1] > 9 &input$time[2] < 20){
                  "You are 45% safe."
                } else {
                  "You are 30% safe"
              }
            }
          }
      }
      }}}})
    output$Documentation <- renderPrint({"This app allows you to measure safety index basis your time and mode of travel. The details are segmented location-wise. In addition crime trends are also included for past couple of years"})
  })
