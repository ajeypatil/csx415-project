delaysdb <- subset(flights, select = c('YEAR','MONTH','DAY','DAY_OF_WEEK','AIRLINE','DEPARTURE_TIME','DEPARTURE_DELAY','ELAPSED_TIME','AIR_TIME','DISTANCE','ARRIVAL_DELAY','AIR_SYSTEM_DELAY','SECURITY_DELAY','AIRLINE_DELAY','LATE_AIRCRAFT_DELAY','WEATHER_DELAY'))
delaysdb[is.na(delaysdb)] <- 0
delaysdb['flight_instance'] <- 1

cancellationsdb <- subset(flights,select = c('YEAR','MONTH','DAY','DAY_OF_WEEK','AIRLINE','ORIGIN_AIRPORT','SCHEDULED_DEPARTURE','CANCELLED','CANCELLATION_REASON','WEATHER_DELAY'))
cancellationsdb[is.na(cancellationsdb)] <- 0
cancellationsdb['flight_instance'] <- 1
