\name{OneTwoSamples-package}
\alias{OneTwoSamples-package}
\alias{OneTwoSamples}
\docType{package}

\title{
Deal with One and Two (Normal) Samples
}

\description{
In this package, we introduce an R function one_two_sample() which can deal with one and two (normal) samples, Ying-Ying Zhang, Yi Wei (2012), \doi{10.2991/asshm-13.2013.29}. For one normal sample x, the function reports descriptive statistics, plot, interval estimation and test of hypothesis of x. For two normal samples x and y, the function reports descriptive statistics, plot, interval estimation and test of hypothesis of x and y, respectively. It also reports interval estimation and test of hypothesis of mu1-mu2 (the difference of the means of x and y) and sigma1^2/sigma2^2 (the ratio of the variances of x and y), tests whether x and y are from the same population, finds the correlation coefficient of x and y if x and y have the same length.
}

\details{
\tabular{ll}{
Package: \tab OneTwoSamples\cr
Type: \tab Package\cr
Version: \tab 1.1-0\cr
Date: \tab 2023-03-22\cr
License: \tab GPL (>= 2)\cr
}
The most important functions are: one_two_sample() and one_sample().
}

\author{
Ying-Ying Zhang (Robert)

Maintainer: Frederic Bertrand <frederic.bertrand@utt.fr>
}

\references{
Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion,
\doi{10.2991/asshm-13.2013.29}.
}

\keyword{ package }

%% \seealso{}

\examples{
library("OneTwoSamples")
}
