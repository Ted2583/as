library(shinydashboard)
library(leaflet)
library(dplyr)
library(curl) # make the jsonlite suggested dependency explicit
library(shiny)
library(shinyjs)
library(RSelenium)
library(DT)

#java -Dwebdriver.gecko.driver="geckordriver.exe" -jar selenium-server-standalone-3.8.1.jar -port 4445
#setwd("D:\\CODE\\도메인프로젝트_의료관광_2017\\DomainProject_shiny")

function(input, output, session) {
  runUrl("www.mail.yoochang.com")

  
  
}


