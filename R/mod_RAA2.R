#' RAA2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS
mod_RAA2_ui <- function(id){
  ns <- NS(id)
  tagList(
  shiny::centrsidebarLayout(
    shiny::sidebarPanel(
      shiny::textAreaInput(
        inputId = ns("peptide"),
        label = "Peptide sequence",
        width = 300,
        height = 100,
        placeholder = "Insert peptide sequence"
      )
    ),
    shiny::mainPanel(
      shiny::plotOutput(
        outputId = ns("abundance")
      )
    )
  )
)
}

#' RAA2 Server Functions
#'
#' @noRd
mod_RAA2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          centralDogma::plot_abundance() +
          ggplot2::theme(legend.position = "none")
      }
    })

  })
}

## To be copied in the UI
# mod_RAA2_ui("RAA2_1")

## To be copied in the server
# mod_RAA2_server("RAA2_1")
