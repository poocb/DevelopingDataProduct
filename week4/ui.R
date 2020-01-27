library(shiny)
library(shinyWidgets)
library(plotly)
shinyUI(fluidPage(
    titlePanel(
       "Coronaviruses (CoV) Outbreak"
    ),
    sidebarLayout(
        sidebarPanel(
            helpText("This shiny app shows Coronavirus outbreak across the world reported by WHO as at 2020-01-26"),
            awesomeCheckboxGroup(
                inputId = "id1", label = "Pick the countries to compare:",
                choices = c("Country name")
            ),
            htmlOutput("sideNote")
        ),
        mainPanel(
            plotlyOutput("plot1")
        )
    )
))