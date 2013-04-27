\name{interval_var3}
\alias{interval_var3}

\title{
Two sided or one sided interval estimation of \code{sigma^2} of one normal sample
}

\description{
Compute the two sided or one sided interval estimation of \code{sigma^2} of one normal sample when the population mean is known or unknown.
}

\usage{
interval_var3(x, mu = Inf, side = 0, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{mu}{
The population mean. When it is known, input it, and the function computes the interval endpoints using a chi-square distribution with degree of freedom \code{n}. When it is unknown, ignore it, and the function computes the interval endpoints using a chi-square distribution with degree of freedom \code{n-1}.
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

\item{var }{The estimate of the population variance. When the population mean \code{mu} is known, \code{var = mean((x-mu)^2)}. When \code{mu} is unknown, \code{var = var(x)}.}

\item{df }{The degree of freedom.}

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
x=rnorm(10, mean = 1, sd = 0.2); x
interval_var3(x, mu = 1, side = -1)
interval_var3(x)
}


