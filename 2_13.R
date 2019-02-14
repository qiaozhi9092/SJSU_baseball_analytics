library(dplyr)
library(ggplot2) 


##loading two cvs files
scrimmage2_8_19 <- read.csv("Trackman - Scrimmage 2.8.19.csv", header = TRUE)
scrimmage2_9_19 <- read.csv("Trackman - Scrimmage 2.9.19.csv", header = TRUE)

#combine two files
scrimmage2_8to9_19 <- rbind(scrimmage2_9_19, scrimmage2_8_19)

#subset for pitcher and spinrate
scrimmage2_8to9_19_spinRate <- scrimmage2_8to9_19[,c('Pitcher', 'TaggedPitchType','SpinRate')]

#omit the NA values in spinrate
scrimmage2_8to9_19_spinRate <- scrimmage2_8to9_19_spinRate[complete.cases(scrimmage2_8to9_19_spinRate$SpinRate), ]

#group by the pitcher and pitch type
by_pitcher_type <- group_by(scrimmage2_8to9_19_spinRate, Pitcher, TaggedPitchType)

#mean and variance for different pitch type by pitchers
View(by_pitcher_type %>% summarise(mean = mean(SpinRate), variance = var(SpinRate, na.rm=TRUE)))

#make subset for each pitcher
Cadola <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Cadola', ]
Ertz <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Ertz', ]
Miller <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Miller', ]
Shima <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Shima', ]
Clark <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Clark', ]
Finn <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Finn', ]
MitchelAndrew <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Mitchel, Andrew', ]
Polack <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Polack', ]
WallaceZach <- scrimmage2_8to9_19_spinRate[scrimmage2_8to9_19_spinRate$Pitcher=='Wallace, Zach', ]

#boxplot of spinrate for different pitcher by pitch type
Cadola_boxplot <- qplot(Cadola$TaggedPitchType, Cadola$SpinRate, data=Cadola, geom=c("boxplot", "jitter"), fill=Cadola$TaggedPitchType, main="Cadola's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
Ertz_boxplot <- qplot(Ertz$TaggedPitchType, Ertz$SpinRate, data=Ertz, geom=c("boxplot", "jitter"), fill=Ertz$TaggedPitchType, main="Ertz's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
Miller_boxplot <- qplot(Miller$TaggedPitchType, Miller$SpinRate, data=Miller, geom=c("boxplot", "jitter"), fill=Miller$TaggedPitchType, main="Miller's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
Shima_boxplot <- qplot(Shima$TaggedPitchType, Shima$SpinRate, data=Shima, geom=c("boxplot", "jitter"), fill=Shima$TaggedPitchType, main="Shima's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
Clark_boxplot <- qplot(Clark$TaggedPitchType, Clark$SpinRate, data=Clark, geom=c("boxplot", "jitter"), fill=Clark$TaggedPitchType, main="Clark's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
Finn_boxplot <- qplot(Finn$TaggedPitchType, Finn$SpinRate, data=Finn, geom=c("boxplot", "jitter"), fill=Finn$TaggedPitchType, main="Finn's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
MitchelAndrew_boxplot <- qplot(MitchelAndrew$TaggedPitchType, MitchelAndrew$SpinRate, data=MitchelAndrew, geom=c("boxplot", "jitter"), fill=MitchelAndrew$TaggedPitchType, main="Mitchel Andrew's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
Polack_boxplot <- qplot(Polack$TaggedPitchType, Polack$SpinRate, data=Polack, geom=c("boxplot", "jitter"), fill=Polack$TaggedPitchType, main="Polack's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")
WallaceZach_boxplot <- qplot(WallaceZach$TaggedPitchType, WallaceZach$SpinRate, data=WallaceZach, geom=c("boxplot", "jitter"), fill=WallaceZach$TaggedPitchType, main="Wallace Zach's Spin Rate by Pitch Type",xlab="Pitch Type", ylab="Spin Rate")










