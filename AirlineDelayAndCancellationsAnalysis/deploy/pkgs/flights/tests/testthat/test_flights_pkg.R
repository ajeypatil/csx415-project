is.installed <- function(mypkg) is.element(mypkg, installed.packages()[,1])
if (!is.installed("testthat")){
  invisible(install.packages('testthat'))
}
library(testthat)
if (!is.installed("flights")){
  invisible(devtools::install_github("ajeypatil/flights"))
}
library(flights)

#Check Tree Models
test_that("tree model object is the correct model type", {
  expect_is(tree.model,'rpart')
})

test_that("Airline IATA_CODE input", {
  expect_equal(predictDelayCancellation("UnitedAirlines","SFO","DEN",factor(10),factor(4),1500),
               "[Unknown Airline IATA_CODE]")
  expect_equal(predictDelayCancellation(1234,"SFO","DEN",factor(10),factor(4),1500),
               "[Unknown Airline IATA_CODE]")
})

test_that("Origin Airport IATA_CODE input", {
  expect_equal(predictDelayCancellation("UA","SanFrancisco","DEN",10,4,1500),
               "[Unknown Origin Airport IATA_CODE]" )
  expect_equal(predictDelayCancellation("UA",1234,"DEN",10,4,1500),
               "[Unknown Origin Airport IATA_CODE]" )
})

test_that("Destination Airport IATA_CODE input", {
  expect_equal(predictDelayCancellation("UA","SFO","Denver",10,4,1500),
               "[Unknown Destination Airport IATA_CODE]")
  expect_equal(predictDelayCancellation("UA","SFO",1234,10,4,1500),
               "[Unknown Destination Airport IATA_CODE]")
})

test_that("month input", {
  expect_equal(predictDelayCancellation("UA","SFO","DEN",22,4,1500),
               "[Month input error]")
  expect_equal(predictDelayCancellation("UA","SFO","DEN","TEN",4,1500),
               "[Month input error]")
})

test_that("Day_of_week input", {
  expect_equal(predictDelayCancellation("UA","SFO","DEN",10,18,1500),
               "[Day of week input error]")
  expect_equal(predictDelayCancellation("UA","SFO","DEN",10,"ONE",1500),
               "[Day of week input error]")
})

