## get_degree.R is a function that takes two points and calculates the bearing between P1 to P2.
## eventually wrap this into more sophisticated function when dealing with latitudes and 
## longitude. This should be used for the simulated world and not for actual location data.
##
##
## @param P1/P2 : location of point 1 and point 2. Bearing estimated is calculated from reference
## 				  of P1 to P2. e.g. if P1 = {0,0} and P2 = {100,100}, then the resulting bearing
##				  will be 45 degrees

get_degree <- function(P1,P2){
	x1 = P1[1]; y1=P1[2]; x2 = P2[2]; y2=P2[1];
	deg(atan2(y2-y1, x2-x1))%%360
}