library(shinydashboard)
library(leaflet)
library(shiny)
library(shinyjs)
library(DT)

header <- dashboardHeader(

  
  title= img(src ="logo.png" ,align= "top", align ="left", height = '40px', width = '180px')   
  
)


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Login",
            login <- box(
              title = "Login",
              textInput("userName", "Username"),
              passwordInput("passwd", "Password"),
              br(),
              actionButton("Login", "Log in")
            )
            
            
            
            
            
            
            
    ),
    tabItem(tabName = "tabA",
      
      
      headerPanel(h1("Recomendation of the Sights for the Medical Tourist")),
      br(),
     
      
      fluidRow(
        column(width = 9,
               box(width = NULL, solidHeader = TRUE,
                   leafletOutput("mymap", height = 500)
                   
               ),
               
               
               
               box(width = NULL,
                   DT::dataTableOutput('legend')
               ),
               br(),
               
               fluidRow(
                 # A static infoBox
                 #infoBox("history", 10 * 2, icon = icon("credit-card")),
                 # Dynamic infoBoxes
                 infoBoxOutput("history"),
                 infoBoxOutput("select"),
                 infoBoxOutput("time")
               ),
               
               
               
               
               
               
               
               box(width = NULL,
                   DT::dataTableOutput('table')
               )
               
        ),
        column(width = 3,
               box(width = NULL, status = "warning",
                   solidHeader = TRUE,
                   title = "Input your information",
                   
                   dateRangeInput("date", "How long do you go to trip?" ), 
                   #start,
                   #end, min, max, format, startview,
                   #weekstart, language, separator
                   
                   selectInput("country", "Select your country", c("중국"="1","러시아"="3","미국"="2","일본"="4","기타"="5")),
                   selectInput("disease", "Select the symptoms of diseases", c("치료"="1","수술"="2","성형수술"="3","피부미용"="4","건강검진"="5")),
                   
                   #h4("if the condition apply for you, check the box."),
                   radioButtons("partner", "Did you come with a partner(or partners)?", c("Yes","No"), selected	 = c("Yes") , FALSE), 
                   radioButtons("seoul", "were you staying in Seoul?", choices =  c("Yes"="서울","No"="지방"), selected	 = c("No"="지방"), FALSE),
                   #checkboxGroupInput("options", "Check the options",
                   #                  c("partners","Seoul"), FALSE),
                   
                   actionButton("confirm", "confirm")
               ),
               
               
               
               box(width = NULL, status = "primary", color ="black",
                   solidHeader = TRUE,
                   title = "Admin Controler",
                   textInput("location", "User Location:", 
                             "38.1233,128.26883")
               ),
               
               box(width = NULL, background = 'yellow',
                   solidHeader = TRUE,
                   title = "Tour Info",
                   h3("거리/시간/택시요금 정보"),
                   
                   textInput("start","출발지", "잠실역"),
                   textInput("onway", "경유지", "석촌역"),
                   textInput("finish", "도착지", "장지역"),
                   actionButton("waytogo", "Search"),
                   br(),
                   box(width = NULL, background = 'yellow',
                       solidHeader = FALSE,
                       h3("검색결과"),
                       br(),
                       h1("총 거리"),
                       br(),
                       img(src ="meter.png" ,align = "top", height = '80px', width = '80px'),
                       textOutput("meter"),
                       p(),
                       img(src ="timer.png" ,align = "top", height = '80px', width = '80px'),
                       textOutput("timer"),
                       p(),
                       img(src ="taxi.png" ,align = "top", height = '80px', width = '80px'),
                       textOutput("taxi")
                      
                   )
               )
        )
      )
  )
))

dashboardPage(skin = "yellow",
  header,
  dashboardSidebar(id="menu",
                   menuItem('Login', tabName = 'Login', icon = icon('user-o')),
                   conditionalPanel(" 'TRUE' === 'TRUE' ",  
                                    sidebarMenu(menuItem("엑셀업로드", tabName = "tabA", icon = icon("file")),
                                                menuItem("주문관리", tabName = "tabB", icon = icon("check")),
                                                menuItem("주문집계", tabName = "tabC", icon = icon("signal"))))),
  body
)

