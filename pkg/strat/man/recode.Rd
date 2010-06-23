\encoding{UTF-8}
\name{recode}
\alias{recode}
\title{Recode occupational and stratification schemas}
\description{
       \code{recode} provides an uniform function for converting different
	   occupational and stratification schemas.
     }
     \usage{
     recode(data, informat="isco88", outformat="egp", detail=0, labels=FALSE)
     }
     \arguments{
       \item{data}{a single value, vector or dataframe containing occupational or
         stratification data that one wishes to recode. See Details.}
       \item{informat}{a string indicating the input format. See 
	     Details for possible values.}
	   \item{outformat}{a string indicating the output format. See 
	     Details for possible values.}
	   \item{detail}{the level of detail in returned classfication. 
	     The default of 0 returns the most detailed form.}
	   \item{labels}{return a factor with value labels instead of the numeric
		 values.}
     }
	 \details{
	   The \code{data} argument can be onedimensional (a single value or vector of values). 
	 
	   Possible \code{informat} values are "isco88".
	   
	   Possible \code{outformat} values are "isei", "siops", "esec" and "egp".
	 }
	 \value{
	  A vector of the same length as the 
	 }
%     \seealso{
%       \code{\link{save}}.
%     }

\examples{
## Recode a vector of ISCO88 occupation unit group indicators to 
## the International Socio-economic Index of Occupational Status (ISEI).
isco <- c(1200, 3131, 9110)
recode(isco, informat="isco88", outformat="isei")
}

\keyword{manip}
