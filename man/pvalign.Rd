\name{pvalign}
\alias{pvalign}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability Vector Formatting Tool
}
\description{
The fuction is applied to a pair of probability vectors or to a pair of vector with counts in order to format them for adequate use at Klimontovich's S-theorem based analysis
}
\usage{
pvalign(distribution0, distribution1,
outcomes0=c(0), outcomes1=c(0), tolerance=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distribution0}{
vector of counts / probability vector
}
  \item{distribution1}{
vector of counts / probability vector
}
  \item{outcomes0}{
optionally used vector of bins/cell numerical identifiers corresponding to counts contained in distribution0 vector 
}
  \item{outcomes1}{
optionally used vector of bins/cell numerical identifiers corresponding to counts contained in distribution1 vector 
}
  \item{tolerance}{
a number to set a level of accuracy at which distributions will be aligned with the default value \code{tolerance=0.001}
}
}
\details{
At some applications a pair of probability vectors or vector of counts are not equal in size. At some applications a pair of probability vectors or vector of counts are not corresponded to the same intervals of outcomes or measured at not equidistant intervals. This makes Klimontovich's S-theorem based analysis not adequate or even not possible at all. The function tries to align vectors and convert them to equidistant ones with the level of accuracy specified by parameter of \code{tolerance}. As a bonus it prints basic statistics summary for distributions alongside with technical plot
}
\value{

\item{new_scale }{new generated vector of bins/cell numerical identifiers corresponding to counts contained in vectors with counts, common for both distributions}
\item{f0 }{aligned and improved probability vector representing state0 of a system}
\item{f1 }{aligned and improved probability vector representing state1 of a system}
}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{crit.stheorem}},
\code{\link{cxds.stheorem}}
}
\examples{
#consider 2 arrays {h0, h1} representing counts for 
#bins where bins are enumerated by corresponding x0 and x1 arrays:  
x0 <- -c(10,9,8,7,6,5,4.01,3)
x1 <- c(2,3,4,5,6,7,8)*(1.01)
h0 <- c(0,0,3,4,0,0,0.2,1)
h1 <- c(2,2,2,6,6,0,1)

#align regardless bin identifiers:
b<-pvalign(distribution0=h0, distribution1=h1); b
#align using bin identifiers:
b<-pvalign(h0, h1, outcomes0=x0, outcomes1=x1, tolerance=0.02); b
b$f0; b$f1; b$new_scale
#set small tolerance and observe an error generated:
 # b<-pvalign(h0, h1, x0, x1, tolerance=0.0001)

#example of 2-step data analysis with Klimontovich's S-theorem
# compare two bin counts:
h0<-c(1,1,1,1,1,1,1,1,1,1,1,1)
h1<-c(1,2,2,3,1,0,8,6)
# step a. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher)
b<-pvalign(h0, h1); b
# step b. Compare with Klimontovich's S-theorem. Renormalized entropy shift
# is negligible compared to Shannon's. Evolution from state0 to state1 is possible
# but clearly with external entropy (or energy) outflow
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)
}

