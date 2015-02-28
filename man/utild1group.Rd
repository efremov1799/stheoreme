\name{utild1group}
\alias{utild1group}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Vector Framer
}
\description{
The function is applied to a pair of vectors in order to split them into N-point frames and calculate respective arrays of N-point frame means, there N is specified by user
}
\usage{
utild1group(arr0, arr1, radius = 1, method = "split1")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arr0}{
original vector
}
  \item{arr1}{
original vector
}
  \item{radius}{
sets the size of a single frame as N=(2*radius+1) points
}
  \item{method}{
sets the division of original array by a sequence of frames in different manner

\code{method='split1'} (the default) sets a sequence of frames as: frame1(1...N), frame2(N+1,..2*N), etc 

\code{method='splitN'} sets a sequence of frames as: frame1(1...N), frame2(2,..N+1), frame3(3,..N+2), etc 
}
}

\value{
\item{group0 }{array containing mean values of individual frames the original arr0 was divided by}
\item{group1 }{array containing mean values of individual frames the original arr1 was divided by}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{utild2group}}
}
\examples{
s0<-rep(c(-1,1,3,7,10),3)
s1<-c(1:14)

s0; s1
a<-utild1group(arr0=s0, arr1=s1); a
a<-utild1group(s0, s1, radius=2); a
a<-utild1group(s0, s1, radius=2, method='splitN'); a
}
