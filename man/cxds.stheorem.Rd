\name{cxds.stheorem}
\alias{cxds.stheorem}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Renormalized Entropy Shift Estimation
}
\description{
Function \code{cxds.stheorem} is applied to a pair of probability vectors or to a pair of vector of counts associated with two states of the same open thermodynamic system in order to estimate renormalized entropy shift as the system evolves.
}
\usage{
cxds.stheorem(distribution0, distribution1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{distribution0}{
vector of counts representing distribution function of state0 of the (open thermodynamic) system
}
  \item{distribution1}{
vector of counts representing distribution function of state1 of the (open thermodynamic) system
}
}
\details{
The function implements the second part of the algorithm based on Klimontovich's S-theorem (the first part is implemented by \code{crit.stheorem}). More detailes can be found in Klimontovich (1989) and Anischenko (1994). 

Let the open thermodynamic system be characterized by probability density function \eqn{f(x)} and evolving from state0 to state1. Entropies corresponding to state0 and state1 are respectively:
\deqn{H_{0} = -\int {f_{0}(x)lnf_{0}(x)dx}, H_{1} = -\int {f_{1}(x)lnf_{1}(x)dx}}
This is known Shannon entropy formulation which is most comprehensive indicator of degree of order of the system at the certain state. Shannon entropy shift depends on both external (energy/entropy in-/out-flows) and internal (noise and self-organization processes) changes happened to the system. However, it doesn't make it possible to differentiate between two and estimate, for instance, the role of self-organization processes in the evolution. The quantifier proposed by Klimontovich (1987) is called renormalized entropy
\deqn{dS_{0\rightarrow 1} = -\int {f_{1}(x)lnf_{1}(x)dx} + \int {f^{*}(x)ln f^{*}(x)dx}}
where \eqn{f^{*}(x)} is a new probability density function being the result of Gibbs distribution function tranformation of \eqn{f_{0}(x)} for energy balancing (see the 'details' section for \code{\link{crit.stheorem}}). The formula allows for the final entropy shift to be written in a form 
\deqn{dH_{0\rightarrow 1}=H_{1}-H_{0} = dS_{0\rightarrow 1} + dI_{0\rightarrow 1}}
where \eqn{dI} is the entropy change caused by external reasons. If direct evolution from the state0 to state1 is thermodynamically forbidden (\eqn{r^{2}<1}) the medium state2 of the system evolution is to be found and the final formula for entropy shift will contain additional equation:
\deqn{dS_{0\rightarrow 1} = dS_{0\rightarrow 2}+dS_{2\rightarrow 1}} 
representing the pass of the system through an indirect medium state.

It is recommended to apply the function alongside with Klimontovich's S-theorem convergence criterion function \code{\link{crit.stheorem}}

}
\value{
\item{dH_val }{Shannon entropy shift}
\item{dS_val }{renormalized entropy shift}
\item{dH_ext }{entropy inflow to the system from outside}
\item{dS_02 }{renormalized entropy shift from state0 to medium state2}
\item{dS_21 }{renormalized entropy shift from medium state2 to state1}

}
\references{
Y.L.Klimontovich. S-theorem. Zeitschrift fur Physik B Condensed Matter. 1987, Volume 66, Issue 1, pp 125-127.

Yu.L.Klimontovich. Problems of open system statistical theory: criteria of relative  state ordering at processes of self-organization. 1989. Usp. Fiz. Nauk. v.158(1) (in Russian)

V.S.Anishchenko, T.G.Anishchenko. On the criterion of the relative degree of order for self-oscillating regimes. Illustration of Klimontovich's S-theorem. Proc.SPIE, v.2098, pp.130-136, 1994.

K.Kopizki, P.C.Warnke, P.Saparin, j.Kurths, J.Timmer. Comment on 'Kullback-Leiber and renormalized entropies: Application to electroencephalograms of epilepsy patients'. PHYSICAL REVIEW E 66, 043902 (2002).

}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}

\seealso{
\code{\link{crit.stheorem}},
\code{\link{d1nat}},
\code{\link{pvalign}}
}
\examples{
#quazi-gaussian probability vectors with equal means & different variances
f0 <- c(0.0,0.1,0.4,0.4,0.1,0.0)
f1 <- c(0.1,0.15,0.25,0.25,0.15,0.1)
cxds.stheorem(distribution0=f0, distribution1=f1)

#quazi-gaussian bin counts with shift between means
h0 <- c(2,2,17,6,1,1,1,0)
h1 <- c(2,3,5,7,7,4,1,0)
crit.stheorem(h0, h1)
cxds.stheorem(h0, h1)

#example of 2-step analysis with Klimontovich's S-theorem for 2 
# arrays of outcomes {s0,s1}:
s0<-rep(c(1:11,2),256)
s1<-rep(c(2,3,3,4,5,5,5),55)
# step a. Create probability vectors
b<-d1nat(s0,s1,brks=12); b
# step b. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

#example of 3-step analysis with Klimontovich's S-theorem to study two gratings
# random vs regular
s0<-array(c(rep(0,640),rep(1,640)), c(320,320))
s1<-array(runif(5120,0,1), c(64,80))
# step a. Binarize (to make s1 comparable with s0 by its nature as a grating)
a<-utild2bin(s0, s1, method='med')
# step b. Create probability vectors as for angular space (anisotropy study)
# There is no doubt s0 is more regular
b<-d2spec(s0, s1, brks=36, method='ang90'); b
# step c. Compare gratings with Klimontovich's S-theorem. Renormalized entropy shift
# is negligible compared to Shannon's. Evolution from state0 to state1 is possible
# but clearly with external entropy (or energy) inflow
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

#example of 2-step analysis with Klimontovich's S-theorem for
#two following char arrays:
s0<-c("a","b",rep("c",9),rep("d",2),"e","f","g",rep("h",2),"i","j"); s0
s1<-c(rep("a",16), rep("c",35), rep("i",13)); s1
# step a. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher)
b<-d1char.d1nat(s0,s1); b
# step b. Compare samples with Klimontovich's S-theorem. Renormalized entropy indicates 
# the opposite: s0 is more ordered and difference in Shannon entropy values was 
# due to just "thermodynamic noise"
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)

#example of 3-step analysis with Klimontovich's S-theorem for 2 random 
# arrays of outcomes  {s0,s1}:
s0<-runif(128,0,1)^2
s1<-runif(64,0,1)^2.3
# step a. Convert samples to arrays of sequential 17-point means
a<-utild1group(s0, s1, radius=8, method='splitN')
# step b. Create probability vectors
b<-d1nat(a$group0,a$group1,brks=12,band=c(0,0.8)); b
# step c. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)
}
