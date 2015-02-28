\name{utild2filt}
\alias{utild2filt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gaussian Filter for Matrices
}
\description{
The function is applied to a pair of matrices as a lowpass 2d gaussian filter to clean them from high frequency components
}
\usage{
utild2filt(d2arr0, d2arr1, outsize = 2, strong = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d2arr0}{
vector to be filtered
}
  \item{d2arr1}{
vector to be filtered
}
  \item{outsize}{
radius of gaussian filter kernel
}
  \item{strong}{
multiplication factor defining the sigma of gaussian filter kernel as \code{sigma=outsize*strong}
}
}

\value{
\item{filt0 }{matrix being the result of d2arr0 filtration}
\item{filt1 }{matrix being the result of d2arr1 filtration}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{utild1filt}}
}
\examples{
s0<-array(c(1,4,5,8,3), c(6,6))
s1<-array(c(1,1,1,1,1,8,1,1,1,1,1,1), c(5,6))

s0; s1
utild2filt(d2arr0=s0, d2arr1=s1)
utild2filt(s0, s1, outsize=1)
utild2filt(s0, s1, strong=.2)
}
