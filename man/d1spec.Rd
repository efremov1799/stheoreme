\name{d1spec}
\alias{d1spec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Power Spectrum Probability Vector Calculator
}
\description{
Function \code{d1spec} is applied to a pair of vectors (sample outcomes, observation data values, time series data, 1d signal values, etc.) and generates the pair of corresponding spectral power density functions
}
\usage{
d1spec(sample0, sample1, band=c(0,0), brks=0, meansub=TRUE)
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
two border values to set a range of considered frequencies. The default c(0,0) sets full entire range i.e. from 0 to 0.5 Hz, where 1 Hz = [1/sampling_interval]
}
  \item{brks}{
value used in a same manner as the number of cells for the histogram. The default brks=0 sets the number of cells equal to \code{min(length(sample0), length(sample1))/2}
}
  \item{meansub}{
logical item defining if individual baseline (defined as individual mean value) is subtracted from original vectors before application of Fourier transform 
}
}
\details{
Spectral power density functions are often being used as probability vectors characterizing thermodynamic states of a system. Here fast Fourier transform algorithm is utilized and the frequency values are used as 1 Hz = [1/sampling_interval], i.e. in a range from 0 to 0.5 Hz. In general the function works similarly to \code{d1nat}. As a bonus it prints basic statistics summary for power density functions alongside with technical plot. It is recommended for use as a data preparation step before following Klimontovich's S-theorem based analysis. 
}
\value{
\item{f0 }{spectral power density function as a probability vector representing state0 of a system}
\item{f1 }{spectral power density function as a probability vector representing state1 of a system}
\item{freqs }{vector of coresponding frequency values}
}
\references{
T.G.Anishchenko, P.I.Saparin, N.B.Igosheva, V.S.Anishchenko. Sex differences in human cardiovascular responses to external excitation. Il Nuovo Cimento D. Luglio-Agosto 1995, Volume17, Issue7-8, pp.699-707.

E.J.Groth. Probability distributions related to power spectra. Astrophysical Journal, 1975. Suppl. Ser., Vol.29, No.286, p. 285-302.

T.Anishchenko, N.Igosheva, T.Yakusheva, O.Glushkovskaya-Semyachkina, O.Khokhlova. Normalized entropy applied to the analysis of interindividual and gender-related differences in the cardiovascular effects of stress. Eur J Appl Physiol. 2001 Aug; 85(3-4):287-98.

}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{crit.stheorem}},
\code{\link{cxds.stheorem}},
\code{\link{d2spec}}
}
\examples{
s0 <- 2+sin(c(1:128))
s1<- array(c(rep(0,8),rep(1,8)), c(256))

b<-d1spec(sample0=s0,sample1=s1); b
b<-d1spec(s0, s1, band=c(0,0.25), brks=16, meansub=FALSE); b

#example of 3-step data analysis with Klimontovich's S-theorem
# step a. Clean samples from outliers (points out of 1.4 sigmas)
a<-utild1clean(s0, s1, method='both', nsigma=1.4)
# step b. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher).
b<-d1spec(a$clean0,a$clean1); b
# step c. Compare samples with Klimontovich's S-theorem. Renormalized entropy indicates 
# the opposite: s0 is more ordered and difference in Shannon entropy values was 
# due to just "thermodynamic noise" (discretization noise in this case)
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

}
