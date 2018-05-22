# CSX415 Project : Airline FLight Delays and Cancellation Analysis 
# DEPLOYMENT INSTRUCTIONS

## Description:
The deployment package consists of packrat bundle within which is bundled
"predictFlightDelayCancellation.R" APP r-script and "flights.tar.gz" library package.
"predictFlightDelayCancellation.R" script loads "flights.tar.gz" library
and the library contains the trained Tree model and required data.

## Deployment Assets 
### Deployment Package
	Deploy Tarball: csx415-project/AirlineDelayAndCancellationsAnalysis/deploy/app/packrat/bundles

### Deployment App
	Deploy App: csx415-project/AirlineDelayAndCancellationsAnalysis/deploy/app/predictFlightDelayCancellation.R 

## Deployment App Usage
### App Usage: 
	rscript ./predictFlightDelayCancellation.R --airline IATA_CODE
		--origin IATA_CODE --destination IATA_CODE
		--month <1-12> --day_of_week <1-7> --time <0000-2359> 
### App Usage Example:
	rscript ./predictFlightDelayCancellation.R  --airline "UA"
		--origin "SJC" --destination "DEN" --month 10
		--day_of_week 5 --time 1500

