############################################################################
#             wellPanel(
#               fluidRow(
#                 column(3,
#                        selectInput("dist", "Population Type",
#                                    list( 
#                                          "Left-skewed" = "leftskewed",
#                                          "Right-skewed" = "rightskewed",
#                                          "Symmetric" = "symmetric",
#                                          "Bimodal" = "bimodal",
#                                          "Normal" = "normal"), 
#                                    selected = "leftskewed"
#                        ),
#                        conditionalPanel(
#                          condition="input.dist=='leftskewed'",
#                          sliderInput("leftskew", " Skewness:",min = 1, max = 10, value = 1, step= 0.1)
#                        ),
#                        conditionalPanel(
#                          condition="input.dist=='rightskewed'",
#                          sliderInput("rightskew", "Skewness:",min = 1, max = 10, value = 1, step= 0.1)
#                        ), 
#                        conditionalPanel(
#                         condition="input.dist=='symmetric'",
#                         sliderInput("inverse","Peakedness:", min = 0.5, max = 10, value = 1, step= 0.1)
#                         ),
#                          conditionalPanel(
#                          condition="input.dist=='bimodal'",
#                          
#                          sliderInput("prop","% under right mode:",min = 0, max = 1, value = 0.2)
#                        ),
#                        conditionalPanel(
#                          condition = "input.dist == 'normal'",
#                          sliderInput("normmean", "Mean:", min = -5, max = 5, value = 0, step = 0.1),
#                          sliderInput("normsd", "Standard Deviation:", min = 1, max = 5, value = 1, step = 0.1)
#                        )
#                        ),
#                          
#                        column(3,
#                               #left skewed
#                               conditionalPanel(
#                                 condition ="input.dist == 'leftskewed'", 
#                                 sliderInput("leftpath",
#                                             "# of paths",
#                                             min = 1,
#                                             max = 3,
#                                             value = 1),
#                                 sliderInput("leftsize",
#                                             "sample size (n)",
#                                             min = 10,
#                                             max = 1000,
#                                             value = 100)
#                                 
#                               ),
#                               conditionalPanel(
#                                 condition = "input.dist == 'rightskewed'", 
#                                 
#                                 # choose the number of sample means
#                                 sliderInput("rightpath",
#                                             "# of paths",
#                                             min = 1,
#                                             max = 3,
#                                             value = 1),
#                                 # choose the number of sample means
#                                 sliderInput("rightsize",
#                                             "sample size (n)",
#                                             min = 10,
#                                             max = 1000,
#                                             value = 100)
#                               ),
#                               
#                               conditionalPanel(
#                                 condition= "input.dist == 'symmetric'",
#                                 
#                                 #choose the number of sample means
#                                 sliderInput("sympath",
#                                             "# of paths",
#                                             min = 1,
#                                             max = 3,
#                                             value = 1),
#                                 #choose the number of sample means
#                                 sliderInput("symsize",
#                                             "sample size (n)",
#                                             min = 10,
#                                             max = 1000,
#                                             value = 100)
#                                 
#                               ),
#                               conditionalPanel(
#                                   condition= "input.dist == 'bimodal'",
#                                   
#                                   #choose the number of sample means
#                                   sliderInput("bipath",
#                                               "# of paths",
#                                               min = 1,
#                                               max = 3,
#                                               value = 1),
#                                   #choose the number of sample means
#                                   sliderInput("bisize",
#                                               " sample size (n)",
#                                               min = 10,
#                                               max = 1000,
#                                               value = 100)
#                                   
#                                 ),
#                               
#                               conditionalPanel(
#                                 condition= "input.dist == 'normal'",
#                                 
#                                 #choose the number of sample means
#                                 sliderInput("normpath",
#                                             "# of paths",
#                                             min = 1,
#                                             max = 3,
#                                             value = 1),
#                                 #choose the number of sample means
#                                 sliderInput("normsize",
#                                             " sample size (n)",
#                                             min = 10,
#                                             max = 1000,
#                                             value = 100)
#                          )
#                        ),
#                          
#                 column(6,
#                        conditionalPanel(
#                          condition ="input.dist == 'leftskewed'", 
#                          plotOutput('plotleft2')),
#                        conditionalPanel(
#                          condition = "input.dist == 'rightskewed'", 
#                          plotOutput('plotright2')),
#                        conditionalPanel(
#                          condition= "input.dist == 'symmetric'",
#                          plotOutput('plotsymmetric2')),
#                        conditionalPanel(
#                          condition= "input.dist == 'bimodal'",
#                          plotOutput('plotbiomodel2')),
#                        conditionalPanel(
#                          condition= "input.dist == 'normal'",
#                          plotOutput('plotnormal2'))
#                 )
#                 
#                 
#     
#     )
# ),
# br(),
# fluidRow(
#   
#   column(6,
#          conditionalPanel(
#            condition ="input.dist == 'leftskewed'",
#            plotOutput('plotleft1')),
# 
#          conditionalPanel(
#            condition = "input.dist == 'rightskewed'",
#            plotOutput('plotright1')),
#          conditionalPanel(
#            condition= "input.dist == 'symmetric'",
#            plotOutput('plotsymmetric1')),
#          conditionalPanel(
#            condition= "input.dist == 'bimodal'",
#            plotOutput('plotbiomodel1')),
#          conditionalPanel(
#            condition= "input.dist == 'normal'",
#            plotOutput('plotnormal1'))
#   )
#   )
####################################################################
