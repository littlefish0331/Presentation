library(DT)
library(shiny)
library(magrittr)

setwd("C:/Users/User/Documents/")

runApp("shiny2/")



# install.packages("rsconnect")
# install.packages("shiny")
library(shiny)
library(rsconnect)

# 授權form shinyapps.io帳戶 to Rstudio
rsconnect::setAccountInfo(name='littlefish0331',
                          token='B7613B8330C6506B3C19B59E6A49AB73',
                          secret='fr6QMpjWoCUkr5Vby9WfUJgI5DBM6nYY2K3vYqvt')
# rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")

rsconnect::deployApp("shiny2")




# library(dplyr)
# 
# temp <- read.csv("shiny2/data/finaldata.csv")
# temp <- temp[,-1]
# temp$加油日期 <-  paste0("2017年", temp$加油日期) 
# write.csv(temp, "shiny2/data/finaldata.csv", row.names =F)


