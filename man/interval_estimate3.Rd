\name{interval_estimate3}
\alias{interval_estimate3}

\title{
Two sided interval estimation of \code{mu} of one non-normal sample with large sample size
}

\description{
Compute the two sided interval estimation of \code{mu} of one non-normal sample with large sample size when the population variance is known or unknown.
}

\usage{
interval_estimate3(x, sigma = -1, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{sigma}{
The standard deviation of the population. \code{sigma>=0} indicates it is known, \code{sigma<0} indicates it is unknown. Default to unknown standard deviation.
}
  \item{alpha}{
The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
}
}

%% \details{}

\value{
A data.frame with variables:

\item{mean }{The sample mean.}

\item{a }{The confidence lower limit.}

\item{b }{The confidence upper limit.}
}

\references{
Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion.
}
\author{
Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} 
}

%%\note{}

%%\seealso{}

\examples{
x = rexp(50, 1/2); x
interval_estimate3(x)
}
