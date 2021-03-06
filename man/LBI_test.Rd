% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LBI_test.R
\name{LBI_test}
\alias{LBI_test}
\title{Locally best invariant test against a change in persistence}
\usage{
LBI_test(x, trend = c("none", "linear"), tau = 0.2,
  statistic = c("mean", "max", "exp"), simu = 0, M = 10000)
}
\arguments{
\item{x}{the univariate numeric vector to be investigated. Missing values are not allowed.}

\item{trend}{whether the time series exhibits a trend, \code{"none"} implies no trend and \code{"linear"} implies a linear trend.}

\item{tau}{the function tests in the interval \code{[T*tau,T*(1-tau)]} for a break in persistence with T being the length of the time series. It must hold that \code{0<tau<0.5}, default is \code{tau=0.2} as commonly used in the literature. Note that if \code{T*tau<=1+as.numeric(trend=="linear")} the test statistic cannot be calculated.}

\item{statistic}{which type of test statistic should be used, \code{"mean"} corresponds to Hansen's (1991) mean score, \code{"max"} to Andrews' (1993) maximum statistic, and \code{"exp"} to Andrews and Ploberger's (1994) mean-exponential statistic.}

\item{simu}{whether critical values should be simulated or interpolated, \code{simu=1} means simulation, \code{simu=0} means interpolation. See details. Default is \code{simu=0}.}

\item{M}{number of replications in case critical values should be simulated. Default is \code{M=10000}.}
}
\value{
Returns a matrix that consists of test statistic and critical values (corresponding to \code{alpha=0.1,0.05,0.01}) for testing against a change from I(1) to I(0), I(0) to I(1), and against a change in an unknown direction.
}
\description{
This function performs the locally best invariant test against a change in persistence as suggested by Busetti and Taylor (2004). Under the null hypothesis the time series is I(0) throughout and
under the alternative a change from either I(1) to I(0) or I(0) to I(1) has occured.
}
\details{
The critical values of the tests vary with the sample size. If \code{simu=0}, the critical values provided
are based on linear interpolation of the critical values simulated by Busetti and Taylor (2004). These are, however, only valid for \code{tau=0.2}. 
In case that another value is chosen for \code{tau}, it is recommended to set \code{simu=1} which means that critical values are simulated based on the given data using M replications.
For a time series of length \code{T=100} and \code{M=10,000} replications this takes approximately five minutes with increasing duration for higher T or M.  
It should be noted, however, that M smaller than 10,000 make the results unreliable.
}
\examples{
set.seed(410)

# generate dummy-data
series <- c(rnorm(100), cumsum(rnorm(100)))

# test for a break in persistence
LBI_test(series, trend="none", statistic="mean")
}
\references{
Busetti, F. and Taylor, R. (2004): Tests of stationarity against a change in persistence. Journal of Econometrics, 123, pp. 33-66.
}
\seealso{
\code{\link{cusum_test}}, \code{\link{LKSN_test}}, \code{\link{MR_test}}, \code{\link{ratio_test}}.
}
\author{
Janis Becker
}
