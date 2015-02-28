\name{stheoreme-package}
\alias{stheoreme-package}
\alias{stheoreme}
\docType{package}
\title{
Klimontovich's S-Theorem Algorithm Implementation and Data Preparation Tools
}
\description{Functions in this package implement the procedure based on Klimontovich's S-theorem. This procedure compares relative degree of order between two data arrays. Klimontovich's S-theorem was originally proposed by Klimontovich (1987) as analytical modeling tool for open thermodynamic systems, and it sets the "renormalized entropy" as a criterion of relative degree of order for two probability density functions associated with two states of the thermodynamic system by equating the  mean effective energies. Anishchenko (1994) extended the original concept and designed the algorithm for numerical comparison of two data samples. It has been used for many models such as heart rate variability time series by Wessel (1994) & Anishchenko (1995), variability of electroencephalograms of epilepsy patients by Kopizki (2002), relative degree of ordering in images by Herega (2010), self-organization of dissipative optical lattices by Bagci (2009) etc.
}
\details{
\tabular{ll}{
Package: \tab stheoreme\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2015-02-25\cr
License: \tab  GPL-2\cr
}
Two functions are directly related to Klimontovich's S-theorem algorithm. Function \code{\link{crit.stheorem}} checks the method applicability for certain pair of sample distributions and function \code{\link{cxds.stheorem}} estimates the renormalized entropy difference between two sample distributions after equating the mean energies. The package also contains data preparation tools (for cleaning, formatting, filtering etc.) which can also be used separately, e.g. for descriptive statistics and/or as helpful instruments for time-series analysis, signal and image processing.
}

\author{
Vitaly Efremov <vitaly.efremov@dcu.ie>

}
\note{
It has been created with support of the Science Foundation Ireland under Grant No. 13/TIDA/B2688
}


\references{
Y.L.Klimontovich. S-theorem. Zeitschrift fur Physik B Condensed Matter. 1987, Volume 66, Issue 1, pp 125-127.

Yu.L.Klimontovich. Problems of open system statistical theory: criteria of relative  state ordering at processes of self-organization. 1989. Usp. Fiz. Nauk. v.158(1) (in Russian)

V.S.Anishchenko, T.G.Anishchenko. On the criterion of the relative degree of order for self-oscillating regimes. Illustration of Klimontovich's S-theorem. Proc.SPIE, v.2098, pp.130-136, 1994.

T.G.Anishchenko, P.I.Saparin, N.B.Igosheva, V.S.Anishchenko. Sex differences in human cardiovascular responses to external excitation. Il Nuovo Cimento D. Luglio-Agosto 1995, Volume17, Issue7-8, pp.699-707.

T.Anishchenko, N.Igosheva, T.Yakusheva, O.Glushkovskaya-Semyachkina, O.Khokhlova. Normalized entropy applied to the analysis of interindividual and gender-related differences in the cardiovascular effects of stress. Eur J Appl Physiol. 2001 Aug; 85(3-4):287-98.

A.N.Herega. On One Criterion of the Relative Degree of Ordering in Images. Technical Physics, 2010, Vol.55, No.5, pp.741-742. 

N.Wessel, A.Voss, J.Kurths, P.Saparin, A.Witt, H.J.Kleiner, R.Dietz. Renormalised entropy: a new method of non-linear dynamics for the analysis of heart rate variability. Computers in Cardiology Conf. Proc., 1994, pp.137-140.

G.B.Bagci, U.Tirnakli. Self-organization in dissipative optical lattices. CHAOS. 19, 033113. 2009.

K.Kopizki, P.C.Warnke, P.Saparin, j.Kurths, J.Timmer. Comment on 'Kullback-Leiber and renormalized entropies: Application to electroencephalograms of epilepsy patients'. PHYSICAL REVIEW E 66, 043902 (2002).

}
