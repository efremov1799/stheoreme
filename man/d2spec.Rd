\name{d2spec}
\alias{d2spec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Power Spectrum Probability Vector Calculator for Matrices
}
\description{
Function \code{d2spec} is applied to a pair of matrices (2d arrays) and generates the pair of corresponding 1d spectral power density functions (to be used then as probability vectors) specified by the \code{method} argument
}
\usage{
d2spec(d2arr0, d2arr1, band=c(0,0), brks=0, method='rad', meansub=TRUE)
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
two border values to set a range of considered frequencies. The default c(0,0) sets full entire range from 0 to 0.5 Hz (where 1 Hz = [1/sampling_interval]) for radial method and from 0 to 180 degrees for both angular methods
}
  \item{brks}{
value used in a same manner as the number of cells for the histogram. The default brks=0 sets the number of cells equal to \code{min(length(sample0), length(sample1))/2} for radial method and equal to 180 for both angular methods
}
  \item{method}{
specifies the method of using the power spectrum as a probability vector. The default value 'rad' defines the calculation of spectral power density for spatial frequency space \code{{u,v}} as a function of spectral radius \code{sqrt(u^2+v^2)}.

\code{method='ang'} to calculate spectral power density as a function of spectral angle \code{atan(u/v)}

\code{method='ang90'} to calculate spectral power density as a function of shifted spectral angle \code{atan(v/u)}

}
  \item{meansub}{
logical item defining if individual baselines (as mean value) are subtracted from original matrices before application of 2d Fourier transform 
}
}
\details{
Spectral power density is often being used as probability vector/matrix characterizing a state of a system, e.g. in image analysis. Here 2d fast Fourier transform algorithm is utilized to calculate power spectrum matrix \eqn{P(u,v)} and then the 1d spectral power density:
\deqn{f(k_{i})=\sum_{k_{min}}^{k_{max}}{ P(k: k_{i}<k<k_{i+1})}}
where \eqn{k} is a metrics of frequency space defined with one of the following options:
\eqn{k=\sqrt{u^{2}+v^{2}}} (as radius where \code{method='rad'}); \eqn{k = atan(u/v)} (as angle where \code{method='ang'}) or \eqn{k = atan(v/u)} (as angle where \code{method='ang90'}) 

and where \eqn{{k_{min},k_{max}}} are defined by \code{band} argument

In general the function works similarly to \code{d1nat}. As a bonus it prints basic statistics summary for spectral power density functions alongside with technical plot. It is recommended for use as a data preparation step before following Klimontovich's S-theorem based analysis. 

}
\value{
\item{f0 }{spectral power density function as a probability vector representing state0 of a system}
\item{f1 }{spectral power density function as a probability vector representing state1 of a system}
\item{efs }{vector of corresponding metrics/bin values (radial frequency or spectral angle)}
}
\references{
N.F.Zhang, A.E.Vladar, M.T.Postek, R.D.Larrabee.Spectral density-based statistical measures for image sharpness. Metrologia, 42(2005), 351-359

E.J.Groth. Probability distributions related to power spectra. Astrophysical Journal, 1975. Suppl. Ser., Vol.29, No.286, p. 285-302.
}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{crit.stheorem}},
\code{\link{cxds.stheorem}},
\code{\link{d1spec}},
\code{\link{d1nat}}
}
\examples{
# compare (harmonic+background) with (harmonic noisy period) matrices
s0<-array(2+sin(c(1:256)/3), c(16,16))
s1<-array(sin(c(1:512)+runif(512,0,2)), c(16,32))

# as radial:
b<-d2spec(d2arr0=s0, d2arr1=s1); b
b<-d2spec(s0, s1, brks=29, band=c(0.15,0.5)); b
# as angular:
b<-d2spec(s0, s1, method='ang', meansub=FALSE); b

#example of 3-step data analysis with Klimontovich's S-theorem
# Study two gratings: random vs regular
s0<-array(c(rep(0,640),rep(1,640)), c(320,320))
s1<-array(runif(5120,0,1), c(64,80))
# step a. Binarize (to make s1 comparable with s0 by its nature as a grating)
a<-utild2bin(s0, s1, method='med')
# step b. Create probability vectors as for angular space (anisotropy study)
# There is no doubt s0 is more regular
b<-d2spec(a$bin0, a$bin1, brks=36, method='ang90'); b
# step c. Compare gratings with Klimontovich's S-theorem. Renormalized entropy shift
# is negligible compared to Shannon's. Evolution from state0 to state1 is possible
# but clearly with external entropy (or energy) inflow
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)
}

