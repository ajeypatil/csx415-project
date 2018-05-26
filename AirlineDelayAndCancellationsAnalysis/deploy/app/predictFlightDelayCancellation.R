# Usage: 
#  rscript ./predictFlightDelayCancellation --airline IATA_CODE
#   --origin IATA_CODE --destination IATA_CODE
#   --month <1-12> --day_of_week <1-7> --time <0000-2359>
# Example:
#   rscript ./predictFlightDelayCancellation.R  --airline "UA"
#      --origin "SJC" --destination "DEN" --month 10
#      --day_of_week 5 --time 1500

invisible(library(devtools))
invisible(library(optigrab))
invisible(library(magrittr))

# defining a function
is.installed <- function(mypkg) is.element(mypkg, installed.packages()[,1]) 

if (!is.installed("flights")){
    invisible(devtools::install_github("ajeypatil/flights"))
}
invisible(library(flights))

airline <- opt_get("airline",required=TRUE,description="AIRLINE IATA_CODE")
origin_airport <- opt_get("origin",required=TRUE,description="ORIGIN AIRPORT IATA_CODE")
destination_airport <- opt_get("destination",required=TRUE,description="ORIGIN AIRPORT IATA_CODE")
month <- opt_get("month",required=TRUE,description="Month 1-12") %>% as.factor()
day_of_week <- opt_get("day_of_week",required=TRUE,description="Day Of Week") %>% as.factor()
time_of_day <- opt_get("time",required=TRUE,description="Time 0000-2359") %>% as.numeric()
#opt_help(name = c("help", "?"), opts = commandArgs())

print(paste("Flight with: ",airline," Origin: ",origin_airport," Dest: ",destination_airport," Month: ",month," Day Of week: ",day_of_week," Time of day: ",time_of_day))
print(" Delay[>60min] Or Cancellation Prediction: ")

predictDelayCancellation(airline, origin_airport, destination_airport,
              month,day_of_week,time_of_day)

