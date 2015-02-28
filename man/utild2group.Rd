\name{utild2group}
\alias{utild2group}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Matrix Framer
}
\description{
The function is applied to a pair of matrices in order to split them into {NxN} pixel frames and calculate respective matrices of frame means, there N is specified by user
}
\usage{
utild2group(d2arr0, d2arr1, radius = 1, method = "split1")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d2arr0}{
original matrix
}
  \item{d2arr1}{
original matrix
}
  \item{radius}{
sets the size of a single frame as N=(2*radius+1) points/pixels
}
  \item{method}{
sets the division of original array by a sequence of frames in different manner

\code{method='split1'} (the default) sets a sequence of frames as: frame11(1...N by 1...N), frame12(1...N by N+1,..2*N), frame21(N+1,..2*N by 1,..N), frame22(N+1,..2*N by N+1,..2*N), frame23(N+1,..2*N by 2*N+1,..3*N),etc 

\code{method='splitN'} sets a sequence of frames as: frame11(1...N by 1...N), frame12(1...N by 2,..N+1), frame21(2,..N+1 by 1...N ), frame22(2,..N+1 by 2,..N+1), frame23(2,..N+1 by 3...N+2 ), etc 
}
}

\value{
\item{group0 }{matrix containing mean values of individual frames the original  d2arr0 was divided by}
\item{group1 }{matrix containing mean values of individual frames the original  d2arr1 was divided by}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{utild1group}}
}
\examples{
s0<-array(c(-1,1,3,7,10),c(14,12))
s1<-array(c(1:156),c(12,13))

s0; s1
a<-utild2group(d2arr0=s0, d2arr1=s1); a
a<-utild2group(s0, s1, radius=2, method='splitN'); a
a<-utild2group(s0, s1, radius=3); a
}
