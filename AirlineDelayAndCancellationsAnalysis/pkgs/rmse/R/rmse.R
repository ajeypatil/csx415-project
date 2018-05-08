#' Find Root Mean Square Error
#'
#' This function finds root mean square error between
#' actual observations and predicted values. The actual
#' and predicted input vectors must have same number of
#' rows
#'
#' @param actual Actual observations
#' @param predicted Predicted Values
#' @return rmse root mean squared error
#' @export
rmse <- function(actual, predicted) {
    (mean((actual - predicted)^2))^0.5
}
