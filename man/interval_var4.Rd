\name{interval_var4}
\alias{interval_var4}

\title{
Two sided or one sided interval estimation of \code{sigma1^2 / sigma2^2} of two normal samples
}
\description{
Compute the two sided or one sided interval estimation of \code{sigma1^2 / sigma2^2} of two normal samples when the population means are known or unknown.
}
\usage{
interval_var4(x, y, mu = c(Inf, Inf), side = 0, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{y}{
A numeric vector.
}
  \item{mu}{
The population means. When it is known, input it, and the function computes the interval endpoints using an F distribution with degree of freedom \code{(n1, n2)}. When it is unknown, ignore it, and the function computes the interval endpoints using an F distribution with degree of freedom \code{(n1-1, n2-1)}.
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

\item{rate }{The estimate of the ratio of population variances, \code{rate = Sx2/Sy2}. When the population means \code{mu} is known, \code{Sx2 = 1/n1*sum((x-mu[1])^2)} and \code{Sy2 = 1/n2*sum((y-mu[2])^2}. When \code{mu} is unknown, \code{Sx2 = var(x)} and \code{Sy2 = var(y)}.}

\item{df1 }{The first degree of freedom.}

\item{df2 }{The second degree of freedom.}

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
y=rnorm(20, mean = 2, sd = 0.3); y
interval_var4(x, y, mu = c(1,2), side = -1)
interval_var4(x, y)
}



