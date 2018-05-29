delaysagg <- aggregate(delaysdb$AIRLINE_DELAY, by=list(delaysdb$AIRLINE), FUN=sum )
delaysagg <- delaysagg[order(-delaysagg$x),]
delaysagg <- plyr::rename(delaysagg,c("Group.1"="IATA_CODE","x"="Total Delays"))

cancellationsagg <- aggregate(cancellationsdb$CANCELLED, by=list(cancellationsdb$AIRLINE), FUN=sum )
cancellationsagg <- cancellationsagg[order(-cancellationsagg$x),]
cancellationsagg <- plyr::rename(cancellationsagg,c("Group.1"="IATA_CODE","x"="Total Cancellations"))

flights['FLIGHT_INSTANCE'] <- 1
allflights <- aggregate(flights$FLIGHT_INSTANCE, by=list(flights$AIRLINE), FUN=sum )


allflights <- plyr::rename(allflights, c("Group.1"="IATA_CODE","x"="NumFlights"))
alldelays = merge(x=allflights, y=delaysagg, by="IATA_CODE",all=TRUE)
alldelays$AVERAGE_DELAY <- (alldelays$`Total Delays` * 1.0) / alldelays$NumFlights
alldelays <- alldelays[order(-alldelays$AVERAGE_DELAY),]

allcancellations = merge(x=allflights, y=cancellationsagg, by="IATA_CODE",all=TRUE)
allcancellations$AVERAGE_CANCELLATIONS <- (allcancellations$'Total Cancellations' * 1.0) / allcancellations$NumFlights
allcancellations <- allcancellations[order(-allcancellations$AVERAGE_CANCELLATIONS),]

ggplot(alldelays, aes(x=IATA_CODE, y=AVERAGE_DELAY)) + geom_bar(stat='identity') +
    ggtitle("Average Delays") +
    scale_fill_manual('Dly',values=c('red')) +
    ggsave(file.path('graphs/CSX415_Project_Data_visualizations', 'average_delays.bar.png'))

ggplot(allcancellations, aes(x=IATA_CODE, y=AVERAGE_CANCELLATIONS)) + geom_bar(stat='identity') +
    ggtitle("Average Cancellations") +
    scale_fill_manual('Cncl',values=c("red")) +
    ggsave(file.path('graphs/CSX415_Project_Data_visualizations','average_cancellations.bar.png'))

ggplot(DelaysAndCancellations,aes(factor(MONTH),group=DelayedOrCancelled, fill=factor(DelayedOrCancelled))) + geom_bar() +
    ggtitle("Delayed or Cancellations Per Month") +
    scale_fill_manual('Dly',values=c("blue","red")) +
    ggsave(file.path('graphs/CSX415_Project_Data_visualizations','cancellations_per_month.png'))

ggplot(DelaysAndCancellations,aes(factor(DAY_OF_WEEK),group=DelayedOrCancelled, fill=factor(DelayedOrCancelled))) + geom_bar() +
    ggtitle("Delayed or Cancellations Per Day of Week") +
    scale_fill_manual('Dly',values=c("blue","red")) +
    ggsave(file.path('graphs/CSX415_Project_Data_visualizations','cancellations_per_day_of_week.png'))

DlyCnclDb <- DelaysAndCancellations[DelaysAndCancellations$DEPARTURE_TIME != 0,]
ggplot(DlyCnclDb,aes(DEPARTURE_TIME,group=DelayedOrCancelled, fill=factor(DelayedOrCancelled))) + geom_histogram() +
    ggtitle("Delayed or Cancellations Per Time of Day") +
    scale_fill_manual('Dly',values=c("blue","red")) +
    ggsave(file.path('graphs/CSX415_Project_Data_visualizations','cancellations_time_of_day.png'))

#rm(DlyCnclDb)
#rm(cancellationsdb)
#rm(flights)
#rm(allcancellations)
#rm(alldelays)
#rm(cancellationsagg)
#rm(delaysdb)
#rm(cancellationsdb)


