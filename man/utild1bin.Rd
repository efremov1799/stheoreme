\name{utild1bin}
\alias{utild1bin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Vector Binarizer
}
\description{
Function \code{utild1bin} is applied to a pair of vectors and convert them to the pair of binary arrays with a rule specified by user  
}
\usage{
utild1bin(arr0, arr1, method = "mean", trsh = 0, inverted = FALSE, d2=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arr0}{
vector of values/outcomes to be binarized
}
  \item{arr1}{
vector of values/outcomes to be binarized
}
  \item{method}{
method of setting a threshold:

\code{method='mean'} threshold is \code{mean(c(arr0, arr1))} for both arrays (used as default)

\code{method='imean'} setting individual thresholds as mean values  

\code{method='imed'} setting individual thresholds as median values  

\code{method='i1stQ'} setting individual thresholds as 1st quartile values  

\code{method='i3rdQ'} setting individual thresholds as 3rd quartile values  

\code{method='isubsd'} setting individual thresholds as (\code{mean(arrN)-sd(arrN)})

\code{method='iaddsd'} setting individual thresholds as (\code{mean(arrN)+sd(arrN)})

\code{method='med'} threshold is \code{median(c(arr0, arr1))} for both arrays

\code{method='med0'} threshold is \code{median(c(arr0))} for both arrays

\code{method='med1'} threshold is \code{median(c(arr1))} for both arrays

\code{method='mean0'} threshold is \code{mean(c(arr0))} for both arrays

\code{method='mean1'} threshold is \code{mean(c(arr1))} for both arrays

\code{method='spec'} threshold is specified by the 2 numbers of argument \code{trsh} individually for arrays

}
  \item{trsh}{
specifies the individual threshold values for array binarizations when \code{method='spec'} is chosen. If it contains one number it will be interpreted as one threshold for both the arrays
}
  \item{inverted}{
logical item specifying if the result will be inverted (zeros replaced by ones and ones replaced by zeros) after bianrization
}
  \item{d2}{
works exactly as \code{utild2bin} when TRUE
}
}

\value{
\item{bin0 }{result of arr0 binarization}
\item{bin1 }{result of arr1 binarization}
\item{counts }{summary/report of how the arrays were binarized}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{utild2bin}}
}

\examples{
s0<-rep(c(-1,1,3,7,10),2)
s1<-c(1:7)

s0; s1
a<-utild1bin(arr0=s0, arr1=s1); a
a<-utild1bin(s0, s1, method='spec', trsh=c(2,5), inverted=TRUE); a
}
