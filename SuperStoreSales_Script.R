1.
# Loading the raw Data
SuperStoreSales=read.csv('C:/Users/harsha/Desktop/Stats+R/CSV Files/SuperStoreSales.csv',
                         na.strings = c(""," ","NA","NULL"), stringsAsFactors = T)
SuperStoreSales
View(SuperStoreSales)

2.
# number of observations and variable
dim(SuperStoreSales)
class(SuperStoreSales)

3.
#Converting the data.frame into a time-series object

SalesTimeSeries=ts(data = SuperStoreSales$Quantity, start = c(2014,1), end = c(2017,12),
                   frequency = 12)

SalesTimeSeries
class(SalesTimeSeries)

#Assigning to the variable for Time Series analysis

TimeSeries=SalesTimeSeries

#Decomposed TS

DecomposeTS <- decompose(x=TimeSeries, type = c('multiplicative'))
plot(DecomposeTS)

library(forecast)

TSfit=auto.arima(TimeSeries)
TSfit

TSforecast=predict(TSfit,24)
TSforecast

#creating upper and lower confidence intervals to plot the time series

Ulimit <- TSforecast$pred + TSforecast$se
Llimit <- TSforecast$pred + TSforecast$se

# Visualizing the forecast 

ts.plot(TimeSeries, TSforecast$pred, Ulimit, Llimit, col=c(1,2,4,4), lty = c(1,1,2,2))


################################################################################
########### Airpassanger Data ##################

AirPassengers
 
TimeSeriesData=AirPassengers
class(TimeSeriesData)

#Decompose 

DecomposeTS <- decompose(x=TimeSeriesData, type = c('multiplicative'))
plot(DecomposeTS)
plot(AirPassengers)
