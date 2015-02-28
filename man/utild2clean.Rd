\name{utild2clean}
\alias{utild2clean}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Matrix Cleaner
}
\description{
Function \code{utild2clean} is applied to a pair of matrices and clean them from outliers with a rule specified by user (outliers will be replaced by the threshold values)
}
\usage{
utild2clean(d2arr0, d2arr1, method = "bothends", nsigma = 3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d2arr0}{
matrix to be cleaned
}
  \item{d2arr1}{
matrix to be cleaned
}
  \item{method}{
specifies if outliers are to be removed from one or both side of matrix value distribution

\code{method='bothends'} remove outliers from both side of a distribution (default)

\code{method='left'} remove outliers from left side

\code{method='right'} remove outliers from right side
}
  \item{nsigma}{
number of sigmas to be considered as threshold for outlier removal
}
}

\value{
\item{clean0 }{result of d2arr0 cleaning}
\item{clean1 }{result of d2arr1 cleaning}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}


\seealso{
\code{\link{utild1clean}}
}
\examples{
s0<-array(c(-1,1,3,7,10),c(2,5))
s1<-array(c(rep(c(1,2),7),20), c(5,3))

s0;s1
a<-utild2clean(d2arr0=s0, d2arr1=s1); a
a<-utild2clean(s0, s1, method='left', nsigma=0.3); a
}

