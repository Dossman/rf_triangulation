## process_data.r : code takes raw data from receivers and processes to for using in the 
## bearing_estimator function. This code gets applied across time steps (t) and, for each tower
## that detects the tag, will pull out the strongest recieved signal strengths from two
## neighboring antennas. Output will consist of t (timestep), towers (for which a tag was 
## detected), antenna bearing with max signal strength, signal strength for that antenna, 
## antenna bearing with next strongest singal, and signal strength for that antenna.

process_data <- function(df=data){
	
}