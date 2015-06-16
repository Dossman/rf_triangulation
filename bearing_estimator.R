## bearing_estimator.R: takes ratio of received signal strength on two neighboring antennas
## and estimates a bearing between the two antennas.
## 
## @param model.fits: takes a list of list of two model fits, a positive one in which the Weaker
## 		antenna (B2) lies to the right of the antenna with the strongest signal (B1) and the
##		negative fit when Bw lies to th left
## @param r : ratio of signal strengths between the two strongest pairs of antennas
## @param B1 & B2 : Bs and Bw represent the bearings of the antennas with the strongest (B1) RSS
## 		and second strongest (B2)
## @author Bryant Dossman: bdossman (at) gmail (dot) com
## 



bearing_estimator <- function(model.fit, r, B1, B2){
	tmp <- as.circular(B1-B2, type="angles",
							  units="degrees", 
							  modulo="asis", 
							  template="none", 
							  zero="0", 
							  rotation="counter")
	tmp <- ifelse(abs(tmp)==300, tmp*-1, tmp)
	dir = ifelse(tmp > 0, "right","left")
		
	b.init = ifelse(dir=="left", B1, B2)

	newdata <- data.frame(r = r, dir=dir)

	bearing = b.init + predict(model.fit, newdata = newdata)
	
	data.frame(dir, bearing)
	
}