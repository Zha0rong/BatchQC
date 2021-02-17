#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define server logic required to draw a histogram
    output$distPlot <- renderPlot({

<<<<<<< Updated upstream
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })
=======
### Ingest user data


### Create batch design table when covariate selected


    output$text <- renderText("this is a test")

    observeEvent(input$covariate, {
        req(se)
        output$confoundingTable <- renderTable({
            spcc <<- std_pearson_corr_coef(se, input$covariate)
            cv <<- cramers_v(se, input$covariate)
        })
    })
shinyServer(function(input, output, session) {
 reactivevalue=reactiveValues(counts_location='',metadata_location='',Batch_Variable_Name='')
source('observer.R')
observe({
    # Look for user file upload
    if (!is.null(input$counts) & !is.null(input$md)){
        se <<- ingest_data(input$counts$datapath, input$md$datapath)
    }
    else if (!is.null(input$se)){
        ### THIS NEEDS TO BE TESTED
        se <<- SummarizedExperiment(input$se$datapath)
    }
    else {
        se <<- NULL
    }
    # Populate drop down menu with covariates
    req(se)
    cols <- names(colData(se))
    covs <- cols[cols != 'Batch']
    updateSelectInput(inputId = "covariate", choices = covs)
})
observeEvent(input$covariate, {
    req(se)
    output$summaryTable <- renderTable({
        bd <<- batch_design(se, input$covariate)
    })
})











}
>>>>>>> Stashed changes
