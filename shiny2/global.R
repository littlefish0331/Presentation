library(dplyr)

ffinal <- read.csv("C:/Users/User/Documents/shiny2/data/finaldata.csv")
 # x <- read.csv("file:///C:/Users/User/Documents/x.csv")

ffinal$Lat <- jitter(ffinal$Lat)
ffinal$lLong <- jitter(ffinal$lLong)
ffinal$站代號 <- formatC(ffinal$站代號, width=5, format="d", flag="0")
# row.names(ffinal) <- ffinal$站代號
# 我不知道你在幹嘛

cleantable <- ffinal %>%
    select(
        Date = 加油日期,
        Car_num = 車牌號碼,
        How_much = 加油公升數,
        Loca = 站名,
        Time = 時間,
        Long = 經度,
        Lat = 緯度
    ) %>% 
    mutate(
        Hour = substr( as.character(Time), 1, 2) %>% as.numeric(),
        Min = substr( as.character(Time), 4, 5) %>% as.numeric(),
        Date = as.character(Date),
        Eng = substr( as.character(Car_num), 1, 2),
        Num = substr( as.character(Car_num), 4, 7)
    ) %>% 
    select(
        Date, Car_num, How_much, Loca, 
        Long , Lat, 
        Hour, Min ,
        Eng , Num 
    )

cleantable$Min %>% class()


# cleantable$Car_num %>% class()

####讓我們謝謝葉哥<3
# hour <- NULL
# min <- NULL
# for(i in 1:length(cleantable$time)){
#      hourmin <- strsplit( as.character(cleantable$time[i]) ,split=" ")[[1]][2] 
#      hour <- c(hour,strsplit( hourmin ,split=":")[[1]][1])
#      min <- c(min,strsplit( hourmin ,split=":")[[1]][2])
# }
# 
# cleantable2 <-cbind(cleantable,hour,min) 





