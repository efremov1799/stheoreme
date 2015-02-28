\name{d2nat.d1nat}
\alias{d2nat.d1nat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability Mass Function Calculator for Matrices
}
\description{
Function \code{d2nat.d1nat} is applied to a pair of matrices and generates then the pair of corresponding probability mass functions by calling \code{d1nat}  
}
\usage{
d2nat.d1nat(d2arr0, d2arr1, band = c(0, 0), brks = 64, method = "default")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d2arr0}{
sample matrix 
}
  \item{d2arr1}{
sample matrix 
}
  \item{band}{
two border values to set a range of considered values in matrices. The default c(0,0) sets full entire range i.e. \code{range(d2arr0, d2arr1)}  
}
  \item{brks}{
value giving a number of bins (in a same manner as the number of cells for the histogram). The default value sets the number of bins automatically equal to 64.
}
  \item{method}{
  specifies selection of matrix elements
  
\code{method='default'} simply to call \code{d1nat} and apply it to ensemble of all matrix elements as to 1d vector of outcomes

\code{method='cols'} to create 1d array with elements being the mean values of original matrix columns and then simply to call \code{d1nat} function

\code{method='rows'} to create 1d array with elements being the mean values of original matrix rows and then simply to call \code{d1nat} function
}
}
\details{
It works similarly to \code{d1nat} function but for pair of matrices. It is recommended for use as a data preparation step before following Klimontovich's S-theorem based analysis. For instance, it can be used for image analysis.
}
\value{
\item{f0 }{probability vector representing state0 of a system}
\item{f1 }{probability vector representing state1 of a system}
\item{midpoints }{vector of the centres of bins where probability values are calculated}
}
\references{
A.N.Herega. On One Criterion of the Relative Degree of Ordering in Images. Technical Physics, 2010, Vol.55, No.5, pp.741-742. 

G.B.Bagci, U.Tirnakli. Self-organization in dissipative optical lattices. CHAOS. 19, 033113. 2009.
}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}
\seealso{
\code{\link{crit.stheorem}},
\code{\link{cxds.stheorem}},
\code{\link{d1nat}},
\code{\link{utild2group}}
}
\examples{
#two modelling arrays: random with randomness distorted by power
s0<-array(runif(256,0,1)^2, c(16,16))
s1<-array(runif(512,0,1)^3, c(16,8))

b<-d2nat.d1nat(d2arr0=s0,d2arr1=s1); b
b<-d2nat.d1nat(s0,s1,brks=256); b
b<-d2nat.d1nat(s0,s1,brks=18,band=c(0.1,0.5),method='rows'); b

#example of 3-step data analysis with Klimontovich's S-theorem
# step a. Split matrices to regions with radius 1, create new matrices 
# of region means 
a<-utild2group(s0, s1, radius=1)
# step b. Create probability vectors
b<-d1nat(a$group0,a$group1,brks=8,band=c(0.1,0.8))
# step c. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)
}

