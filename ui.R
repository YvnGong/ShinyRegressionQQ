library(shiny)
library(shinyBS)
library(plotrix)
library("shinydashboard", lib.loc="/usr/lib64/R/library")
library(rlocker)

#Skin Section
shinyUI(dashboardPage(skin = "blue",
        dashboardHeader(title = "Q-Q Plot",
                        tags$li(class="dropdown",
                                tags$a(href="https://shinyapps.science.psu.edu/",
                                       icon("home", lib="font-awesome"))),
                        # tags$li(class="dropdown",
                        #         actionLink("info", icon("info"), class="myClass")),
                        titleWidth = 200),
        dashboardSidebar(
          sidebarMenu(
            id="tabs",
            menuItem("Overview", tabName = "intro", icon = icon("dashboard")),
            menuItem("Explore", tabName = "qqplots", icon = icon("wpexplorer"))
            )
          ),
       
        #Add style sheet               
        dashboardBody(
          tags$head( 
            tags$link(rel = "stylesheet",
                      type = "text/css",
                      href = "feature.css"),
            tags$style(HTML('#start{background-color: #ffb6c1}')),
            tags$style(HTML('#start{border-color: #ffb6c1}')),
            tags$style(HTML('#start{color: white}')),
            tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-3 .irs-single, .js-irs-3 .irs-bar-edge, .js-irs-3 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-4 .irs-single, .js-irs-4 .irs-bar-edge, .js-irs-4 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-5 .irs-single, .js-irs-5 .irs-bar-edge, .js-irs-5 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-6 .irs-single, .js-irs-6 .irs-bar-edge, .js-irs-6 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-7 .irs-single, .js-irs-7 .irs-bar-edge, .js-irs-7 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-8 .irs-single, .js-irs-8 .irs-bar-edge, .js-irs-8 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-9 .irs-single, .js-irs-9 .irs-bar-edge, .js-irs-9 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-10 .irs-single, .js-irs-10 .irs-bar-edge, .js-irs-10 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-11 .irs-single, .js-irs-11 .irs-bar-edge, .js-irs-11 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-12 .irs-single, .js-irs-12 .irs-bar-edge, .js-irs-12 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-13 .irs-single, .js-irs-13 .irs-bar-edge, .js-irs-13 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-14 .irs-single, .js-irs-14 .irs-bar-edge, .js-irs-14 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".js-irs-15 .irs-single, .js-irs-15 .irs-bar-edge, .js-irs-15 .irs-bar {background: #ffb6c1}")),
            tags$style(HTML(".shiny-notification{height: 100px; width: 800px; 
                            position: fixed; top: calc(50%-50px);; left: calc(50%-400px);;}"))
            ),
            
        tabItems(
          # First tab content
          tabItem(tabName = "intro",
                  
                  tags$a(href='http://stat.psu.edu/',tags$img(src='PS-HOR-RGB-2C.png', align = "left", width = 180)),
                  br(),br(),br(),
                  h3(tags$b("About:")),
                  h4("This application is designed to examine normal Q-Q (Quantile-Quantile) plots. 
                       The Q-Q plot, or quantile-quantile plot, is a graphical tool to help us assess if a set of data plausibly came from some theoretical distribution such as a Normal in use for this app."),
                  br(),
                  h3(strong("Instructions:")),
                  h4(tags$li("There are five population types: left-skewed, right-skewed, symmetric, bimodel and normal.")),
                  h4(tags$li("For each population type, you can change the corresponding parameters and change the population density as shown in the population graph.")),
                  h4(tags$li("A quantile-quantile plot for a random sample from the population is shown on the right.")),
                  h4(tags$li("Move the slider to explore how sample size affects the normal q-q plot and see how this varies from sample to sample using the # of paths slider.")),
                  #h4("You can also look at the population density below the q-q plot."),
                  
                  h4(tags$li("Click 'GO!' to start.")),
                  h4(""),
                  h4(tags$li("Play with it and have fun!")),
                  
                  div(style = "text-align: center; color: white" ,bsButton("start", "Explore", size = "large", icon = icon("bolt"), class="circle grow")),
                  br(),
                  h3(strong("Acknowledgements:")),
                  h4("This app was developed and coded by Jiajun Gao.")
                  ),
          #second tab item
          tabItem(tabName = "qqplots",
                  sidebarLayout(
                    sidebarPanel(
                      #Population Type Side bar part
                      selectInput("dist", "Population Type",
                                  list( 
                                    "Left-skewed" = "leftskewed",
                                    "Right-skewed" = "rightskewed",
                                    "Symmetric" = "symmetric",
                                    "Bimodal" = "bimodal",
                                    "Normal" = "normal"), 
                                  selected = "leftskewed"
                      ),
                     
                      br(),
                      
                      #Skewness slider condition based on population type selections
                      conditionalPanel(
                        condition="input.dist=='leftskewed'",
                        sliderInput("leftskew", " Skewness:",min = 1, max = 10, value = 1, step= 0.1)
                      ),
                      conditionalPanel(
                        condition="input.dist=='rightskewed'",
                        sliderInput("rightskew", "Skewness:",min = 1, max = 10, value = 1, step= 0.1)
                      ), 
                      conditionalPanel(
                        condition="input.dist=='symmetric'",
                        sliderInput("inverse","Peakedness:", min = 0.5, max = 10, value = 1, step= 0.1)
                      ),
                      conditionalPanel(
                        condition="input.dist=='bimodal'",
                        sliderInput("prop","% under right mode:",min = 0, max = 1, value = 0.2)
                      ),
                      conditionalPanel(
                        condition = "input.dist == 'normal'",
                        sliderInput("normmean", "Mean:", min = -5, max = 5, value = 0, step = 0.1),
                        sliderInput("normsd", "Standard Deviation:", min = 1, max = 5, value = 1, step = 0.1)
                      ),
                      
                      # #of path condition side bar section base on population type selection
                      conditionalPanel(
                        condition ="input.dist == 'leftskewed'", 
                        sliderInput("leftpath",
                                    "# of paths",
                                    min = 1,
                                    max = 3,
                                    value = 1),
                        sliderInput("leftsize",
                                    "sample size (n)",
                                    min = 10,
                                    max = 500,
                                    value = 100)
                        
                      ),
                      conditionalPanel(
                        condition = "input.dist == 'rightskewed'", 
                        # choose the number of sample means
                        sliderInput("rightpath",
                                    "# of paths",
                                    min = 1,
                                    max = 3,
                                    value = 1),
                        # choose the number of sample means
                        sliderInput("rightsize",
                                    "sample size (n)",
                                    min = 10,
                                    max = 500,
                                    value = 100)
                      ),
                      conditionalPanel(
                        condition= "input.dist == 'symmetric'",
                        #choose the number of sample means
                        sliderInput("sympath",
                                    "# of paths",
                                    min = 1,
                                    max = 3,
                                    value = 1),
                        #choose the number of sample means
                        sliderInput("symsize",
                                    "sample size (n)",
                                    min = 10,
                                    max = 500,
                                    value = 100)
                      ),
                      conditionalPanel(
                        condition= "input.dist == 'bimodal'",
                        #choose the number of sample means
                        sliderInput("bipath",
                                    "# of paths",
                                    min = 1,
                                    max = 3,
                                    value = 1),
                        #choose the number of sample means
                        sliderInput("bisize",
                                    " sample size (n)",
                                    min = 10,
                                    max = 500,
                                    value = 100)
                      ),
                      conditionalPanel(
                        condition= "input.dist == 'normal'",
                        #choose the number of sample means
                        sliderInput("normpath",
                                    "# of paths",
                                    min = 1,
                                    max = 3,
                                    value = 1),
                        #choose the number of sample means
                        sliderInput("normsize",
                                    " sample size (n)",
                                    min = 10,
                                    max = 500,
                                    value = 100)
                      ),
                      
                      br(),
                      
                      checkboxInput("reportMode", "Report Mode"),
                      
                      conditionalPanel(
                        condition = "input.reportMode == true",
                        textInput(
                          inputId = "plot_title",
                          label = "Edit Normal Q-Q Plot Title",
                          value = "Normal Q-Q Plot"
                        )),
                      
                      conditionalPanel(
                        condition = "input.reportMode == true",
                        textInput(
                          inputId = "pp_plot_title",
                          label = "Edit Population Graph Title",
                          value = "Population Graph"
                        )),
                      
                      conditionalPanel(
                        condition = "input.reportMode == true",
                        textAreaInput(
                          inputId = "user_comment",
                          label = "Add Comment",
                          placeholder = "Leave your comment here"
                        ))
                      
                    ),

                                 
                    mainPanel(
                      
                      conditionalPanel(
                        condition ="input.dist == 'leftskewed'",
                        plotOutput('plotleft2')),
                      conditionalPanel(
                        condition = "input.dist == 'rightskewed'",
                        plotOutput('plotright2')),
                      conditionalPanel(
                        condition= "input.dist == 'symmetric'",
                        plotOutput('plotsymmetric2')),
                      conditionalPanel(
                        condition= "input.dist == 'bimodal'",
                        plotOutput('plotbiomodel2')),
                      conditionalPanel(
                        condition= "input.dist == 'normal'",
                        plotOutput('plotnormal2')),
                      br(),
                      conditionalPanel(
                        condition ="input.dist == 'leftskewed'",
                        plotOutput('plotleft1')),

                      conditionalPanel(
                        condition = "input.dist == 'rightskewed'",
                        plotOutput('plotright1')),
                      conditionalPanel(
                        condition= "input.dist == 'symmetric'",
                        plotOutput('plotsymmetric1')),
                      conditionalPanel(
                        condition= "input.dist == 'bimodal'",
                        plotOutput('plotbiomodel1')),
                      conditionalPanel(
                        condition= "input.dist == 'normal'",
                        plotOutput('plotnormal1')),
                      
                      #add comment box section
                      br(),
                      h4(textOutput("usercomment"))
                      
                      #generate the report
                      # radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                      #              inline = TRUE),
                      # downloadButton(outputId = "report", label = "Download the Report")
                    )
                                  )
            )
          )
)))

