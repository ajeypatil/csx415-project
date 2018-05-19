#For EDA and Feature Selection
delaysdb <- flights
delaysdb[is.na(delaysdb)] <- 0
delaysdb['flight_instance'] <- 1
delaysdb <- delaysdb[delaysdb['AIRLINE_DELAY']!=0,]

#For EDA and Feature Selection
cancellationsdb <- flights
cancellationsdb[is.na(cancellationsdb)] <- 0
cancellationsdb['flight_instance'] <- 1
cancellationsdb <- cancellationsdb[cancellationsdb['CANCELLED']!=0,]

#For Model Construction based on Classification whether flight delayed>60min or cancelled
DelaysAndCancellations <- subset(flights, select = c('AIRLINE','ORIGIN_AIRPORT','DESTINATION_AIRPORT','MONTH','DAY_OF_WEEK','DEPARTURE_TIME', 'AIRLINE_DELAY', 'CANCELLED'))
DelaysAndCancellations[is.na(DelaysAndCancellations)] <- 0
DelaysAndCancellationsYes <- DelaysAndCancellations[((DelaysAndCancellations$AIRLINE_DELAY >= 60) | (DelaysAndCancellations$CANCELLED != 0)),]
DelaysAndCancellationsYes['DelayedOrCancelled'] <- 1
DelaysAndCancellationsNo <- DelaysAndCancellations[((DelaysAndCancellations$AIRLINE_DELAY < 60) & (DelaysAndCancellations$CANCELLED == 0)),]
DelaysAndCancellationsNo['DelayedOrCancelled'] <- 0
DelaysAndCancellationsNo <- DelaysAndCancellationsNo[sample(nrow(DelaysAndCancellationsNo), size=nrow(DelaysAndCancellationsYes), replace = TRUE),]
DelaysAndCancellations <- rbind(DelaysAndCancellationsYes, DelaysAndCancellationsNo)
DelaysAndCancellations <- DelaysAndCancellations[sample(nrow(DelaysAndCancellations)),]
write.csv(DelaysAndCancellations,file="flights_summary.csv",row.names = FALSE)
rm(DelaysAndCancellationsNo)
rm(DelaysAndCancellationsYes)
DelaysAndCancellations['CANCELLED'] <- NULL
DelaysAndCancellations['AIRLINE_DELAY'] <- NULL

