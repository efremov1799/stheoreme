\name{utild1clean}
\alias{utild1clean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Vector Cleaner
}
\description{
Function \code{utild1clean} is applied to a pair of vectors and clean them from outliers with a rule specified by user (outliers will be replaced by the threshold values)
}
\usage{
utild1clean(arr0, arr1, method = "bothends", nsigma = 3, d2=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arr0}{
vector of values/outcomes to be cleaned
}
  \item{arr1}{
vector of values/outcomes to be cleaned
}
  \item{method}{
specifies if outliers are to be removed from one or both side of array value distribution

\code{method='bothends'} remove otliers from both side of a distributon (default)

\code{method='left'} remove otliers from left side

\code{method='right'} remove otliers from right side

}
  \item{nsigma}{
number of sigmas to be considered as threshold for outlier removal
}
  \item{d2}{
works exactly as \code{utild2clean} when TRUE
}
}

\value{
\item{clean0 }{result of arr0 cleaning}
\item{clean1 }{result of arr1 cleaning}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{utild2clean}}
}
\examples{

s0<-c(rep(c(1,3,7,10),3), -23)
s1<-c(1:7)

s0; s1
a<-utild1clean(arr0=s0, arr1=s1); a
a<-utild1clean(s0, s1, method='right', nsigma=0.8); a
}

