flights <- unite(flights, 'AIR_FLIGHT', c('AIRLINE','FLIGHT_NUMBER'), remove=FALSE)
delaysdb <- subset(flights, select = c('AIRLINE','MONTH','DAY','DAY_OF_WEEK','DEPARTURE_TIME','DEPARTURE_DELAY','ELAPSED_TIME','AIR_TIME','DISTANCE','ARRIVAL_DELAY','SECURITY_DELAY','WEATHER_DELAY','AIRLINE_DELAY'))
delaysdb[is.na(delaysdb)] <- 0
delaysdb['flight_instance'] <- 1
delaysdb <- delaysdb[delaysdb['AIRLINE_DELAY']!=0,]

cancellationsdb <- subset(flights,select = c('AIRLINE','MONTH','DAY','DAY_OF_WEEK','SCHEDULED_DEPARTURE','CANCELLED','CANCELLATION_REASON','WEATHER_DELAY'))
cancellationsdb[is.na(cancellationsdb)] <- 0
cancellationsdb['flight_instance'] <- 1
cancellationsdb <- cancellationsdb[cancellationsdb['CANCELLED']!=0,]

