\name{utild2bin}
\alias{utild2bin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Matrix Binarizer
}
\description{
Function \code{utild2bin} is applied to a pair of matrices and convert them to matrices of binaries with a rule specified by user
}
\usage{
utild2bin(d2arr0, d2arr1, method = "mean", trsh = 0, inverted = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d2arr0}{
matrix to be binarized
}
  \item{d2arr1}{
matrix to be binarized
}
  \item{method}{
method of setting a threshold:

\code{method='mean'} threshold is \code{mean(c(d2arr0, d2arr1))} for both matrices (used as default)

\code{method='imean'} setting individual thresholds as mean values  

\code{method='imed'} setting individual thresholds as median values  

\code{method='i1stQ'} setting individual thresholds as 1st quartile values  

\code{method='i3rdQ'} setting individual thresholds as 3rd quartile values  

\code{method='isubsd'} setting individual thresholds as (\code{mean(d2arrN)-sd(d2arrN)})

\code{method='iaddsd'} setting individual thresholds as (\code{mean(d2arrN)+sd(d2arrN)})

\code{method='med'} threshold is \code{median(c(d2arr0, d2arr1))} for both

\code{method='med0'} threshold is \code{median(c(d2arr0))} for both

\code{method='med1'} threshold is \code{median(c(d2arr1))} for both

\code{method='mean0'} threshold is \code{mean(c(d2arr0))} for both

\code{method='mean1'} threshold is \code{mean(c(d2arr1))} for both

\code{method='spec'} threshold is specified by the 2 numbers of argument \code{trsh} individually for matrices

}
  \item{trsh}{
specifies the individual threshold values for binarizations when \code{method='spec'} is chosen. If it contains one number it will be interpreted as one threshold for both matrices
}
  \item{inverted}{
logical item specifying if the result will be inverted (zeros replaced by ones and ones replaced by zeros) after bianrization
}
}

\value{
\item{bin0 }{result of d2arr0 binarization}
\item{bin1 }{result of d2arr1 binarization}
\item{counts }{summary/report of how the arrays were binarized}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{utild1bin}}
}
\examples{
s0<-array(c(-1,1,3,7,10),c(2,5))
s1<-array(c(1:7), c(7,2))

s0; s1
a<-utild2bin(d2arr0=s0, d2arr1=s1); a
a<-utild2bin(s0, s1, method='isubsd', inverted=TRUE); a
a<-utild2bin(s0, s1, method='spec', trsh=c(-1,2)); a
}
