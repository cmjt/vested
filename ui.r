## ui.R ##
## Virtual Experiments to Teach Experimental Design
fluidPage(
    ## set up shinyjs
    useShinyjs(),
    title = "VEsTED",
    ## CSS style file
    includeCSS("www/style.css"),
    div(id = "landing_page",
        ## title
        h1("Choose your virtual experiment"),
        ## R package for typed.js
        typed::typed(list(h2("randomisation"),h2("blocking"),h2("replication")), typeSpeed = 100, loop = TRUE),
        ## Buttons for each experiment
        div(id = "tomato", class = "mid",
            actionButton("tomato_butt",div(class = "container",img(src = "img/tomato.png"),
                                           div(class = "overlay",
                                               h3("Is horse manure"), h3("the age-old miracle"), h3("grow?"))),
                         class = "tomato_btn")),
        div(id = "egg", class = "mid",
            actionButton("chick_butt",div(class = "container",img(src = "img/chick.png"),
                                          div(class = "overlay",
                                              h3("Miracle grow for"), h3("chooks"))),
                         class = "egg_btn")),
        div(id = "pumpkin", class = "mid",
            actionButton("pump_butt", div(class = "container",img(src = "img/pumpkin.png"),
                                          div(class = "overlay",
                                              h3("Esther and Gwenllian"), h3("want to know who"),
                                              h3("reigns supreme"), h3("pumpkin growing"))),
                         class = "pumpkin_btn"))
        ),
    ## Hidden experiment pages
    ## Tomato
    shinyjs::hidden(div(id = "experiment_page_tomato",
               div(id = "back_to_landing_tom", 
                   tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
               h1("Who's the Head Tomato?"),
               h2(textOutput("tomtxt")),
               h2(textOutput("tomtxt2")),
               div(class = "info-tom",dropdownButton(label = h2("Setup experiment"),
                                                     tagList(
                                                         radioButtons("tray", h3(icon("seedling"),"Tray"), 1:12, inline = TRUE),
                                                         h3("Drag and drop the plants you want to use onto the greenhouse floor"),
                                                         conditionalPanel(condition = "input.tray == '1'", uiOutput("tray1")),
                                                         conditionalPanel(condition = "input.tray == '2'", uiOutput("tray2")),
                                                         conditionalPanel(condition = "input.tray == '3'", uiOutput("tray3")),
                                                         conditionalPanel(condition = "input.tray == '4'", uiOutput("tray4")),
                                                         conditionalPanel(condition = "input.tray == '5'", uiOutput("tray5")),
                                                         conditionalPanel(condition = "input.tray == '6'", uiOutput("tray6")),
                                                         conditionalPanel(condition = "input.tray == '7'", uiOutput("tray7")),
                                                         conditionalPanel(condition = "input.tray == '8'", uiOutput("tray8")),
                                                         conditionalPanel(condition = "input.tray == '9'", uiOutput("tray9")),
                                                         conditionalPanel(condition = "input.tray == '10'", uiOutput("tray10")),
                                                         conditionalPanel(condition = "input.tray == '11'", uiOutput("tray11")),
                                                         conditionalPanel(condition = "input.tray == '12'", uiOutput("tray12"))
                                                         ),
                                                     status = 'info', icon = icon('clipboard'), circle = FALSE)),
               br(),
               h2("Drag and drop to arrange your plants on the greenhouse floor"),
               br(),
               div(class = "bgtom-wrap",
                   div(class = "tomato-bck", dropUI("greenhouse", style = "display:table; background-color: darkgrey;",row_n = 12, col_n = 12))
                   ),
               br(),
               textOutput("foo"),
               br(),
               div(class = "mid",
                   shinyjs::hidden(downloadButton("download_tomato",
                                                  tagList(h3("Let Tomatoes Grow"), h4(" & download data"))))),
               hr(),
               h4(class = "foot","Virtual experiment based on The Greenhouse Experiment in"),
               h4(tags$a(href = "https://www.jstor.org/stable/41509871?seq=6#metadata_info_tab_contents", "Darius, P., Portier, K., & Schrevens, E. (2007). Virtual Experiments and Their Use in Teaching Experimental Design."))
                   )),
    ## Chicks
    shinyjs::hidden(div(id = "experiment_page_chick",
                        div(id = "back_to_landing_chick", 
                            tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
                        h1("Time for an eggsperiment?"),
                        h2(textOutput("chicktxt")),
                        h2(textOutput("chicktxt1")),
                        h2(textOutput("chicktxt2")),
                        div(class = "info-chick",dropdownButton(label = h2("Setup experiment"),
                                                                tagList(
                                                                    radioButtons("brood", h3(icon("egg"),"Brooder"),
                                                                                 1:4, inline = TRUE),
                                                                    conditionalPanel(condition = "input.brood == '1'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                radioMatrixInput(inputId = "diet1",
                                                                                                                 rowIds = paste(letters[1:8],1,sep = ""),
                                                                                                                 minLabels =  1:8,
                                                                                                                 maxLabels = rep("Brooder 1",8),
                                                                                                                 choices = c("Maize","Wheat"),
                                                                                                                 selected = NULL)),
                                                                                         column(width = 6,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("a1","Nest 1",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("b1","Nest 2",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("c1","Nest 3",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("d1","Nest 4",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("e1","Nest 5",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("f1","Nest 6",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("g1","Nest 7",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("h1","Nest 8",0,700,1))
                                                                                                    )))),
                                                                    conditionalPanel(condition = "input.brood == '2'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                radioMatrixInput(inputId = "diet2",
                                                                                                                 rowIds = paste(letters[1:8],2,sep = ""),
                                                                                                                 minLabels =  9:16,
                                                                                                                 maxLabels = rep("Brooder 2",8),
                                                                                                                 choices = c("Maize","Wheat"),
                                                                                                                 selected = NULL)),
                                                                                         column(width = 6,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("a2","Nest 9",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("b2","Nest 10",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("c2","Nest 11",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("d2","Nest 12",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("e2","Nest 13",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("f2","Nest 14",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("g2","Nest 15",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("h2","Nest 16",0,700,1))
                                                                                                    )))),
                                                                    conditionalPanel(condition = "input.brood == '3'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                radioMatrixInput(inputId = "diet3",
                                                                                                                 rowIds = paste(letters[1:8],3,sep = ""),
                                                                                                                 minLabels =  17:24,
                                                                                                                 maxLabels = rep("Brooder 3",8),
                                                                                                                 choices = c("Maize","Wheat"),
                                                                                                                 selected = NULL)),
                                                                                         column(width = 6,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("a3","Nest 17",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("b3","Nest 18",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("c3","Nest 19",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("d3","Nest 20",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("e3","Nest 21",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("f3","Nest 22",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("g3","Nest 23",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("h3","Nest 24",0,700,1))
                                                                                                    )))),
                                                                    conditionalPanel(condition = "input.brood == '4'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                radioMatrixInput(inputId = "diet4",
                                                                                                                 rowIds = paste(letters[1:8],4,sep = ""),
                                                                                                                 minLabels =  25:32,
                                                                                                                 maxLabels = rep("Brooder 4",8),
                                                                                                                 choices = c("Maize","Wheat"),
                                                                                                                 selected = NULL)),
                                                                                         column(width = 6,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("a4","Nest 25",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("b4","Nest 26",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("c4","Nest 27",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("d4","Nest 28",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("e4","Nest 29",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("f4","Nest 30",0,700,1))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           numericInput("g4","Nest 31",0,700,1)),
                                                                                                    column(width = 6,
                                                                                                           numericInput("h4","Nest 32",0,700,1))
                                                                                                    ))))
                                                                ), status = 'info', icon = icon('clipboard'), circle = FALSE)),
                        br(),
                        br(),
                        div(class = "bgchick-wrap",
                            div(class="chick_wrapper",
                                ## names
                                h3("Brooder 1"),
                                h3(""),
                                h3("Brooder 2"),
                                h3(""),
                                h3("Brooder 3"),
                                h3(""),
                                h3("Brooder 4"),
                                ## brooder 1
                                div(id="innerchick-grid",
                                    div(h3(class = "boxed","1"),uiOutput("a1")),div(h3(class = "boxed","2"),uiOutput("b1")),
                                    div(h3(class = "boxed","3"),uiOutput("c1")),div(h3(class = "boxed","4"),uiOutput("d1")),
                                    div(h3(class = "boxed","5"),uiOutput("e1")),div(h3(class = "boxed","6"),uiOutput("f1")),
                                    div(h3(class = "boxed","7"),uiOutput("g1")),div(h3(class = "boxed","8"),uiOutput("h1"))),
                                div(id = "tiers",
                                    div(br(), br(),br(),h4("Tier 1")), div(br(), br(),br(),h4("Tier 2")),
                                    div(br(), br(),br(),h4("Tier 3")), div(br(), br(),br(),h4("Tier 4"))),
                                ## brooder 2
                                div(id="innerchick-grid",
                                    div(h3(class = "boxed","9"),uiOutput("a2")),div(h3(class = "boxed","10"),uiOutput("b2")),
                                    div(h3(class = "boxed","11"),uiOutput("c2")),div(h3(class = "boxed","12"),uiOutput("d2")),
                                    div(h3(class = "boxed","13"),uiOutput("e2")),div(h3(class = "boxed","14"),uiOutput("f2")),
                                    div(h3(class = "boxed","15"),uiOutput("g2")),div(h3(class = "boxed","16"),uiOutput("h2"))),
                                 div(id = "tiers",
                                    div(br(), br(),br(),h4("Tier 1")), div(br(), br(),br(),h4("Tier 2")),
                                    div(br(), br(),br(),h4("Tier 3")), div(br(), br(),br(),h4("Tier 4"))),
                                ## brooder 3
                                div(id="innerchick-grid",
                                    div(h3(class = "boxed","17"),uiOutput("a3")),div(h3(class = "boxed","18"),uiOutput("b3")),
                                    div(h3(class = "boxed","19"),uiOutput("c3")),div(h3(class = "boxed","20"),uiOutput("d3")),
                                    div(h3(class = "boxed","21"),uiOutput("e3")),div(h3(class = "boxed","22"),uiOutput("f3")),
                                    div(h3(class = "boxed","23"),uiOutput("g3")),div(h3(class = "boxed","24"),uiOutput("h3"))),
                                 div(id = "tiers",
                                    div(br(), br(),br(),h4("Tier 1")), div(br(), br(),br(),h4("Tier 2")),
                                    div(br(), br(),br(),h4("Tier 3")), div(br(), br(),br(),h4("Tier 4"))),
                                ## brooder 4
                                div(id ="innerchick-grid",
                                    div(h3(class = "boxed","25"),uiOutput("a4")),div(h3(class = "boxed","26"),uiOutput("b4")),
                                    div(h3(class = "boxed","27"),uiOutput("c4")),div(h3(class = "boxed","28"),uiOutput("d4")),
                                    div(h3(class = "boxed","29"),uiOutput("e4")),div(h3(class = "boxed","30"),uiOutput("f4")),
                                    div(h3(class = "boxed","31"),uiOutput("g4")),div(h3(class = "boxed","32"),uiOutput("h4"))))
                            ),
                        br(),
                        br(),
                        div(class = "mid",
                            shinyjs::hidden(downloadButton("download_chick",
                                                            tagList(h3("Feed chicks"), h4(" & download data"))))),
                        hr(),
                        h4(class = "foot","Virtual experiment based on CHICK in"),
                        h4(tags$a(href = "https://www.jstor.org/stable/2683224?seq=1#metadata_info_tab_contents", "Pollock, K., Ross-Parker, H., & Mead, R. (1979). A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students."))
                        )),
    ## Pumpkin
    shinyjs::hidden(div(id = "experiment_page_pump",
                        div(id = "back_to_landing_pump", 
                            tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
                        h1("Country Pumpkin?"),
                        h2(textOutput("txt")),
                        h2(textOutput("txt2")),
                        div(class = "info",dropdownButton(label = h2("Setup experiment"),
                                               tagList(h3(icon("seedling"),
                                                          tags$b("Variety")),
                                                       radioMatrixInput(inputId = "variety", rowIds = LETTERS[1:12],
                                                                        minLabels =  LETTERS[1:12],
                                                                        maxLabels = c(rep(c("N.","S."),each = 6)),
                                                                        choices = c("Kumi Kumi","Buttercup"),
                                                                        selected = NULL),
                                                       h3(icon("solar-panel"),tags$b("Supplemented heat")),
                                                       checkboxGroupInput("heat","",
                                                                          c("A","B","C","D","E","F",
                                                                            "G","H","I","J","K","L"), inline = TRUE),
                                                       h3(icon("sun"),tags$b("Controlled light")),
                                                       checkboxGroupInput("light","",
                                                                          c("A","B","C","D","E","F",
                                                                            "G","H","I","J","K","L"), inline = TRUE)),
                                               status = 'info', icon = icon('clipboard'), circle = FALSE)),
                        br(),
                        br(),
                        div(class="bg-wrap",
                            div(class="pump_wrapper",
                                div(class="box an", h2("A"),
                                    uiOutput("A")),
                                div(class="box bn", h2("B"),
                                    uiOutput("B")),
                                div(class="box cn", h2("C"),
                                    uiOutput("C")),
                                div(class="box dn", h2("D"),
                                    uiOutput("D")),
                                div(class="box en", h2("E"),
                                    uiOutput("E")),
                                div(class="box fn", h2("F"),
                                    uiOutput("F")),
                                div(class="box as", h2("G"),
                                    uiOutput("G")),
                                div(class="box bs", h2("H"),
                                    uiOutput("H")),
                                div(class="box cs", h2("I") ,
                                    uiOutput("I")),
                                div(class="box ds", h2("J"),
                                    uiOutput("J")),
                                div(class="box es", h2("K"),
                                    uiOutput("K")),
                                div(class="box fs", h2("L"),
                                    uiOutput("L"))
                                )),
                        br(),
                        br(),
                        div(class = "mid",
                            shinyjs::hidden(downloadButton("download_pumpkin",
                                                            tagList(h3("Let Pumpkins Grow"), h4(" & download data"))))),
                        hr(),
                        h4(class = "foot","Virtual experiment based on TOMATO in"),
                        h4(tags$a(href = "https://www.jstor.org/stable/2683224?seq=1#metadata_info_tab_contents", "Pollock, K., Ross-Parker, H., & Mead, R. (1979). A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students."))
                        ))
)
