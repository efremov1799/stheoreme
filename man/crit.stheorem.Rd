\name{crit.stheorem}
\alias{crit.stheorem}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Klimontovich's S-Theorem Convergence Criterion
}
\description{
Function \code{crit.stheorem} is applied to a pair of probability vectors or to a pair of vector of counts associated with two states of the same open thermodynamic system in order to check the Klimontovich's S-theorem applicability.
}
\usage{
crit.stheorem(distribution0, distribution1)
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
The full text of the theorem and associated algorithm was presented by Klimontovich (1989) and Anischenko (1994).  

Let the open thermodynamic system to be characterized by probability density function \eqn{f(x)} and evolving from state0 to state1. Let the state0 be chosen as "chaos". Then the effective Hamiltonian of the system can be written as \eqn{H_{0}(x) = -lnf_{0}(x)} and it must not change at evolution to the state1, namely:
\deqn{\int {f_{0}(x)H_{0}(x)dx} = \int {f_{1}(x)H_{0}(x)dx}}
The latter is "constant Hamiltonian equation" which is not truth for the most of the cases (except the case of identical probability distributions). To make it truth the function \eqn{f_{0}(x)} has to be represented as a subcase of Gibbs distribution for a state of physical chaos, namely:
\deqn{f^{*}(x) = exp(\frac{F_{0}-H_{0}(x)}{D}), \int {f^{*}(x)dx}=1}
where parameter \eqn{F_{0}} is to be defined by procedure of normalization and \eqn{D} is an effective temperature. \eqn{f_{0}(x)} is now to be substituted by the new \eqn{f^{*}(x)} and temperature is to be varied until "constant Hamiltonian equation" becomes truth. The corresponding \eqn{D} value at which system is thermodynamically balanced is now the indicator of the direction of evolution: if \eqn{D>1} state0 is actually more chaotic (need to be "heated" for energy balance). Otherwise, if \eqn{D<1}, state1 is more chaotic and a case of \eqn{D=1} takes place where states are identical. 

The next step is to check if the system evolution can be followed in opposite direction: from state1 back to state0. State1 is to be chosen as "chaos" and all the steps to be repeated from very beginning. Another effective temperature \eqn{D_{bck}} is to be calculated representing energy balance of the system at its way back, from state1 to state0 . There are 2 scenarios possible:

A.\eqn{D>1} and \eqn{D_{bck}<1} or \eqn{D<1} and \eqn{D_{bck}>1} 

B.\eqn{D<1} and \eqn{D_{bck}<1} or \eqn{D>1} and \eqn{D_{bck}>1}

Scenario A (where "way-forward" and "way-back" temperatures have opposite signs) allows for the system evolution to be consistently explained and more chaotic state to be chosen, whereas scenario B makes a direct evolution between states not possible to be followed. 

The actual type of the scenario gives an absolute Klimontovich's S-theorem convergence criterion.   
Let now a null hypothesis be "two sample distributions correspond to the same open thermodynamic system". Null hypothesis is not rejected at scenario A and the general conclusion is "data samples can be considered as outcomes of the same open system and observed differences can be explained by thermodynamic noise". When scenario B is observed, null hypothesis is to be rejected at some level of significance. In order to determine a criterion of rejection the following steps are to be completed:

1. It is assumed the system has probably passed through the medium state2 on its evolution way from state0 to state1. The corresponding probability density function \eqn{f_{2}(x)} can be chosen as 
\deqn{f_{2}(x) = \alpha f_{0}(x)+(1-\alpha)f_{1}(x), {0<=\alpha<=1}, {\int{f_{2}(x)dx}=1}} by varying parameter \eqn{\alpha} until forward-way and back-way effective temperatures have got the opposite signs for all the steps (from state0 to state2 and from state2 to state1 respectively). 

2. When \eqn{\alpha} is detected coefficient of consistency is calculated as
\eqn{r^{2} = (2\alpha-1)^{2}}. It indicates how far state2 is located from the original states of the system. 

3.If \eqn{r^{2}=1} state2 coincides with one of the original states, i.e. scenario A has actually taken place. If \eqn{r^{2}=0} state2 is too far from the original states to follow the system evolution and null hypothesis is surely rejected. Finally, if \eqn{0<r^{2}<1}, the conclusion will depend on significance level chosen.
}

\value{
\item{r2_val }{coefficient of consistency, (\code{0<=r2_val<=1})}

}
\references{
Y.L.Klimontovich. S-theorem. Zeitschrift fur Physik B Condensed Matter. 1987, Volume 66, Issue 1, pp 125-127.

Yu.L.Klimontovich. Problems of open system statistical theory: criteria of relative  state ordering at processes of self-organization. 1989. Usp. Fiz. Nauk. v.158(1) (in Russian)

V.S.Anishchenko, T.G.Anishchenko. On the criterion of the relative degree of order for self-oscillating regimes. Illustration of Klimontovich's S-theorem. Proc.SPIE, v.2098, pp.130-136, 1994.
}
\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{cxds.stheorem}},
\code{\link{d1nat}},
\code{\link{pvalign}}
}
\examples{

#completely different bin counts by their (thermodynamic) nature
h0 <- c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1)
h1 <- c(1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0)
crit.stheorem(distribution0=h0, distribution1=h1)

#quazi-gaussian probability vectors with equal means & different variances
f0 <- c(0.0,0.1,0.4,0.4,0.1,0.0)
f1 <- c(0.1,0.15,0.25,0.25,0.15,0.1)
crit.stheorem(f0, f1)

#multimodal bin counts
h0 <- c(1,6,1,6,5,1,2)
h1 <- c(1,6,1,1,9,1,2)
crit.stheorem(h0, h1)

#quazi-gaussian bin counts with a shift between means
h0 <- c(2,2,17,6,1,1,1,0)
h1 <- c(2,3,5,7,7,4,1,0)
crit.stheorem(h0, h1)

#example of 2-step analysis with Klimontovich's S-theorem for 2 
# arrays of outcomes {s0,s1}:
s0<-rep(c(1:11,2),256)
s1<-rep(c(2,3,3,4,5,5,5),55)
# step a. Create probability vectors
b<-d1nat(s0,s1,brks=12); b
# step b. Compare samples with Klimontovich's S-theorem
crit.stheorem(b$f0,b$f1)

}
