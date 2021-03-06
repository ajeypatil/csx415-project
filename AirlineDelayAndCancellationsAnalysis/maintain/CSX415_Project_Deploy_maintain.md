# CSX415 Project : Airline FLight Delays and Cancellation Analysis 
# MAINTAINANCE INSTRUCTIONS

## Description:
	The project analyzes yearly flight data from The U.S. Department of Transportation's (DOT) Bureau of Transportation Statistics and predicts Flight Delay or Cancellation based on predictor vairables of Airline, Origin Airport, Destination Airport, Month of Travel, Day of Week and Time of day.
	The analysis of data and yearly model training is done to create a new app every year for prediction
of delays and cancellation.

## Data
	The yearly data of "flights.csv", "airline.csv", "airports.csv" is stored in 
	csx415-project/AirlineDelayAndCancellationsAnalysis/data directory before Yearly analysis is done

## Assets 
	csx415-project/AirlineDelayAndCancellationsAnalysis/CSX415_Project_flight_delay_cancellation_analysis.Rmd

## Maintainance Instructions 
	1. The yearly data downloaded is first stored in "data" directory and then
	2. CSX415_Project_flight_delay_cancellation_analysis.Rmd analysis is run
	3. The reports of analysis are generated by "knit" of CSX415_Project_flight_delay_cancellation_analysis.Rmd
	4. New app is created from Tree Model and is stored in deploy/app directory
	5. Packrat is used to bundle the new app in "deploy/app" directory
	6. New app from csx415-project/AirlineDelayAndCancellationsAnalysis/deploy/app/packrat/bundles are distributed to users.

