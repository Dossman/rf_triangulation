## process_data.r : code takes raw data from receivers and processes to for using in the 
## bearing_estimator function. This code gets applied across time steps (t) and, for each tower
## that detects the tag, will pull out the strongest recieved signal strengths from two
## neighboring antennas. Output will consist of t (timestep), towers (for which a tag was 
## detected), antenna bearing with max signal strength, signal strength for that antenna, 
## antenna bearing with next strongest singal, and signal strength for that antenna.


process_data <- function(df=data, model.fit=fit){
	require(plyr)
	
	df$tt <- paste(df$ts, df$tower, sep="_") # creates unique identifier at each ts 
											 # for each tower
	
	df <- split(df, df$tt) # splits dataset into list with sections identified by tt
						
	df <-  lapply(df, strongest_signal) # smashes things back into a data frame
	
	#df <- ldply(df)
	
	#df <- ldply(lapply(df, function(x) bearing_estimator(model.fit=fit, df=x)))
	
	#df <- df[order(df$ts),]
	
	return(df)
	
}


strongest_signal <- function(df){
	
	pairs <- cbind(1:nrow(df), c(2:nrow(df), 1))

    best.row <- which.max(df$sig[pairs[,1]] + df$sig[pairs[,2]])
	
    df <- df[sort(pairs[best.row,]),]

    df[order(df$sig, decreasing=T),]

}


## Alternative method...likely to be more robust if I can get it to work correctly.

# process_data <- function(df=data){
	# n.ants = unique(df$ant.bearing)
	# pairs  = cbind(n.ants[1:length(n.ants)], c(n.ants[2:length(n.ants)], n.ants[1]))
	
	# best.row <- which.max(df[df$ant.bearing %in% pairs[,1], "sig"] + df[df$ant.bearing %in% pairs[,2], "sig"])

	# df[df$ant.bearing %in% pairs[best.row,],]

# }



