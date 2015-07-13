## model_selection.R - takes either ground-truth'd data or simulated data, antenna array 
## configurations, and attempts to build a model that relates the ratio of signal strength on 
## on neighboring antennas to an angle between them. This model structure is then passed on
## to bearing_estimator.R to predict a bearing from processed real data. 
##
##
## @param simulate=T: set to false if using ground truthing data
## @param data = NULL: set to df with ground truth'd data
##
##
## TODO: 1) Add simulation capability with general antenna setups
##		 2) incorporate groundtruthing functionality

model_selection <- function(simulate=T, data=NULL){
		
	df = data # rename datafile
		
	if (simulate=T)
		 ## create new dataset from simulated data
	 
	tmp <- process_data(df)			## split ground truthing data set into a list of dataframes
									## seperated by timestamps
					        			## for each ts, subset the data by the 2 strongest antennas
	
	tmp <- ldply(lapply(tmp, function(x) bearing_estimator(model.fit=NULL, df=x, GroundTruthing=F)))

	
	
}
