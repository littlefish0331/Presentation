library(dplyr)
library(tidyr)
library(magrittr)
station<-read.csv("Desktop/加油站資訊.csv",fileEncoding = "big5") %>% filter(縣市=="台北市")
station$站名%<>%as.character()
license<-NULL
sta<-NULL
#生車牌



for(i in 1:15000){
  num<-sample(9000,1,replace = F)+999
  letter<-c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
            'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
            'Y', 'Z')
  l1<-sample(26,2,replace = T)
  license[i]<-paste0(letter[l1[1]],letter[l1[2]],"-",num)
}

length(unique(license))#14987
fre<-sample(length(station$站名),length(unique(license)),replace = T)
df<-data.frame(unique(license),fre)
#每天平均要2500台車
############################



##############################
sim_time <- function(number){
time <- NULL
for(i in 1:number){
hour<-sample(x=0:23,size = 1) %>% as.character()
min<-sample(0:59,size = 1)%>% as.character()
time <- c(time,paste(hour,min,sep = ":"))
}
return(time)
}
####################
prod<-function(){

rr=floor(rnorm(1,2500,300))

day1<-df[sample(14987,rr),]

x<-NULL
m<-day1$fre %>% as.numeric()
for(i in 1 :length(day1$unique.license.)){
  x[i]<-sample(x=c(rep(m[i],114),c(1:58)[-m[i]]),1)

  }


day1.1<-data.frame(day1,x,sim_time(length(x)),
              abs(rnorm(n = length(x),mean = 30,sd = 4 )))


return(day1.1)
}
#############################
sim <- NULL
for(i in 1:31){
temp1 <- cbind(paste0("12/",i),prod())
sim <- rbind(sim,temp1)
}

View(
  sim
)

hour<-sample(x=0:23,size = 1) %>% as.character()
min<-sample(0:59,size = 1)%>% as.character()
paste(hour,min,sep = ":")
sim<-sim[,-3]
colnames(sim)<-c("加油日期","車牌號碼",
                 "實際會去的加油站","記錄時間點","加油公升數")

write.csv(sim,"~/Desktop/模擬資料.csv",fileEncoding = "big5")
