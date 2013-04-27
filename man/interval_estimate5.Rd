\name{interval_estimate5}
\alias{interval_estimate5}

\title{
Two sided or one sided interval estimation of \code{mu1-mu2} of two normal samples
}

\description{
Compute the two sided or one sided interval estimation of \code{mu1-mu2} of two normal samples when the population variances are known, unknown equal, or unknown unequal.
}

\usage{
interval_estimate5(x, y, sigma = c(-1, -1), var.equal = FALSE, side = 0, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{y}{
A numeric vector.
}
  \item{sigma}{
A numeric vector of length 2, which contains the standard deviations of two populations. When the standard deviations are known, input it, then the function computes the interval endpoints using normal population; when the standard deviations are unknown, ignore it, now we need to consider whether the two populations have equal variances. See \code{var.equal} below.
}
  \item{var.equal}{
A logical variable indicating whether to treat the two variances as being equal. If \code{TRUE} then the pooled variance is used to estimate the variance otherwise the Welch (or Satterthwaite) approximation to the degrees of freedom is used.
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

\item{mean }{The difference of sample means xb-yb.}

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
y=rnorm(20, mean = 2, sd = 0.3); y

interval_estimate5(x, y, sigma = c(0.2, 0.3), side = -1)
interval_estimate5(x, y, var.equal = TRUE)
interval_estimate5(x, y)
}

