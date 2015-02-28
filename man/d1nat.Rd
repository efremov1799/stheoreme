\name{d1nat}
\alias{d1nat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability Mass Function Calculator
}
\description{
Function \code{d1nat} is applied to a pair of vectors or 1d arrays (sample outcomes, observation data values, time series data, 1d signal values, etc.) and generates the pair of corresponding probability mass functions (normalized vectors of counts).   
}
\usage{
d1nat(sample0, sample1, band=c(0,0), brks=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sample0}{
vector of values (sample outcomes)
}
  \item{sample1}{
vector of values (sample outcomes)
}
  \item{band}{
two border values to set a range of considered sample values. The default c(0,0) sets full entire range i.e. \code{range(sample0, sample1)}  
}
  \item{brks}{
value giving a number of bins (in a same manner as the number of cells for the histogram). The default brks=0 sets the number of bins chosen automatically as a square root of sample0 size.
}
}
\details{
It works similarly to \code{hist} function but for pair of vectors with sample outcomes. As a bonus it prints basic statistics summary for distributions alongside with technical plot. It is recommended for use as a data preparation step before following Klimontovich's S-theorem based analysis. 
}
\value{

\item{f0 }{probability vector representing state0 of a system}
\item{f1 }{probability vector representing state1 of a system}
\item{midpoints }{vector of the centres of bins where probability values are calculated}
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{crit.stheorem}},
\code{\link{cxds.stheorem}},
\code{\link{d2nat.d1nat}},
\code{\link{d1char.d1nat}}
}

\examples{

#two modelling arrays: random with randomness distorted by power
s0<-runif(128,0,1)^2
s1<-runif(64,0,1)^2.3

b<-d1nat(sample0=s0,sample1=s1); b
b<-d1nat(s0,s1,brks=12,band=c(0.2,1)); b
   
#example of 3-step data analysis with Klimontovich's S-theorem
# step a. Convert samples to arrays of sequential 17-point means
a<-utild1group(s0, s1, radius=8, method='splitN')
# step b. Create probability vectors
b<-d1nat(a$group0,a$group1,brks=12,band=c(0,0.8)); b
# step c. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

}
