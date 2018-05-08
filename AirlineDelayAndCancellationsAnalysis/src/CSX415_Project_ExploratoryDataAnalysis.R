delaysagg <- aggregate(delaysdb$AIRLINE_DELAY, by=list(delaysdb$AIRLINE), FUN=sum )
delaysagg <- delaysagg[order(-delaysagg$x),]
delaysagg <- plyr::rename(delaysagg,c("Group.1"="IATA_CODE","x"="Total Delays"))

cancellationsagg <- aggregate(cancellationsdb$CANCELLED, by=list(delaysdb$AIRLINE), FUN=sum )
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
  ggsave(file.path('graphs/CSX415_Project_Data_visualizations', 'average_delays.bar.pdf'))

ggplot(allcancellations, aes(x=IATA_CODE, y=AVERAGE_CANCELLATIONS)) + geom_bar(stat='identity') +
  ggsave(file.path('graphs/CSX415_Project_Data_visualizations','average_cancellations.bar.pdf'))

