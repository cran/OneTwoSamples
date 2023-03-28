\name{interval_estimate4}
\alias{interval_estimate4}

\title{
Two sided or one sided interval estimation of \code{mu} of one normal sample
}

\description{
Compute the two sided or one sided interval estimation of \code{mu} of one normal sample when the population variance is known or unknown.
}

\usage{
interval_estimate4(x, sigma = -1, side = 0, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{sigma}{
The standard deviation of the population. \code{sigma>=0} indicates it is known, \code{sigma<0} indicates it is unknown. Default to unknown standard deviation.
}
  \item{side}{
A parameter used to control whether to compute two sided or one sided interval estimation. When computing the one sided upper limit, input \code{side = -1}; when computing the one sided lower limit, input \code{side = 1}; when computing the two sided limits, input \code{side = 0} (default). 
}
  \item{alpha}{
The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
}
}

%% \details{}

\value{
A data.frame with variables:

\item{mean }{The sample mean.}

\item{df }{The degree of freedom.}

\item{a }{The confidence lower limit.}

\item{b }{The confidence upper limit.}
}

\references{
Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion,
\doi{10.2991/asshm-13.2013.29}.
}
\author{
Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} 
}

%%\note{}

%%\seealso{}

\examples{
x=rnorm(10, mean = 1, sd = 0.2); x
interval_estimate4(x, sigma = 0.2, side = -1)
interval_estimate4(x, side = 1)
}
