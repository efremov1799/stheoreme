\name{utild1filt}
\alias{utild1filt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gaussian Filter for Vectors
}
\description{
The function is applied to a pair of vectors as a lowpass gaussian filter to clean them from high frequency components
}
\usage{
utild1filt(arr0, arr1, outsize = 2, strong = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arr0}{
vector to be filtered
}
  \item{arr1}{
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
\item{filt0 }{result of arr0 filtration}
\item{filt1 }{result of arr1 filtration}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}


\seealso{
\code{\link{utild2filt}}
}
\examples{
s1<-sin(c(1:128)*2)+2-c(1:128)*4/128

a<-utild1filt(arr0=s1, arr1=s1)
plot(s1, type='l')
lines(a$filt1, col='red')

s0<-c(rep(0,15), rep(2,12), rep(-2,12), rep(0,25))
s1<-c(rep(0,45), rep(2,4), rep(-2,4), rep(0,25))

a<-utild1filt(s0, s1, outsize=7, strong=.5)
plot(s0, type='l', ylab='s0, s1, a$filt0, a$filt1')
lines(s1, col='gray')
lines(a$filt0, col='red')
lines(a$filt1, col='purple')

}

