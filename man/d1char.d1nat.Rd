\name{d1char.d1nat}
\alias{d1char.d1nat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability Mass Function Calculator for Array of Characters
}
\description{
Function \code{d1char.d1nat} is applied to a pair of vectors of characters or to a pair of 1d arrays of characters and generates then the pair of corresponding probability vectors by calling \code{d1nat} function   
}
\usage{
d1char.d1nat(farr0, farr1, reject = c(""))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{farr0}{
vector of characters
}
  \item{farr1}{
vector of characters
}
  \item{reject}{
vector of rejected characters (the characters excluded from original vectors for analysis)
}
}
\details{
First, it assigns the identification number for each individual character met in original vectors. Then it works similarly to \code{hist} function but for the pair of samples with identification numbers as outcomes. It prints the decoding array (listing the identification numbers corresponded for each character) and, as a bonus, it prints basic statistics summary for distributions alongside with technical plot. It is recommended for use as a data preparation step before the following Klimontovich's S-theorem based analysis. 
}
\value{

\item{f0 }{probability vector representing state0 of a system}
\item{f1 }{probability vector representing state1 of a system}
}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{crit.stheorem}},
\code{\link{cxds.stheorem}},
\code{\link{d1nat}}
}

\examples{
s0<-c("?", "!", "1", "a", "b", "b", "s", "x", "y", "z", "z", "z")
s1<-c("1", "1", "2", "b", "b", "s", "s", "x", "y", "z", "z", "z", "z")
b<-d1char.d1nat(farr0=s0,farr1=s1); b

s0<-"three witches watch three swatch watches. which witch watch which swatch watch?"
s1<-"who discovered america five hundred years ago? a brave man! indeed he was! discovered!"
b<-d1char.d1nat(unlist(strsplit(s0,"")),unlist(strsplit(s1,"")), 
                reject=c("."," ","!","d","e")); b

#example of 2-step data analysis with Klimontovich's S-theorem
s0<-c("a","b",rep("c",9),rep("d",2),"e","f","g",rep("h",2),"i","j"); s0
s1<-c(rep("a",16), rep("c",35), rep("i",13)); s1

# step a. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher)
b<-d1char.d1nat(s0,s1); b
# step b. Compare samples with Klimontovich's S-theorem. Renormalized entropy indicates 
# the opposite: s0 is more ordered and difference in Shannon 
# entropy values was due to just "thermodynamic noise"
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)
}