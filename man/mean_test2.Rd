\name{mean_test2}
\alias{mean_test2}

\title{
Two sided or one sided test of hypothesis of \code{mu1} and \code{mu2} of two normal samples
}
\description{
Compute the two sided or one sided test of hypothesis of \code{mu1} and \code{mu2} of two normal samples when the population variances are known, unknown equal, or unknown unequal.
}
\usage{
mean_test2(x, y, sigma = c(-1, -1), var.equal = FALSE, side = 0)
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
A parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: mu1 != mu2}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: mu1 < mu2}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: mu1 > mu2}.
}
}

%% \details{}

\value{
A data.frame with variables:

\item{mean }{The difference of sample means xb-yb.}

\item{df }{The degree of freedom.}

\item{statistic }{The statistic, when \code{all(sigma>=0)}, \code{statistic = Z}; otherwise, \code{statistic = T}.}

\item{p_value }{The P value.}
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
mean_test2(x, y, sigma = c(0.2, 0.3), side = 1)
mean_test2(x, y, var.equal = TRUE, side = 1)
mean_test2(x, y, side = 1)
}


