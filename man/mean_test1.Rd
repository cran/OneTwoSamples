\name{mean_test1}
\alias{mean_test1}

\title{
Two sided or one sided test of hypothesis of \code{mu} of one normal sample
}
\description{
Compute the two sided or one sided test of hypothesis of \code{mu} of one normal sample when the population variance is known or unknown.
}
\usage{
mean_test1(x, mu = 0, sigma = -1, side = 0)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{mu}{
\code{mu} is \code{mu0} in the null hypothesis. Default is 0, i.e., \code{H0: mu = 0}.
}
  \item{sigma}{
The standard deviation of the population. \code{sigma>=0} indicates it is known, \code{sigma<0} indicates it is unknown. Default to unknown standard deviation.
}
  \item{side}{
A parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: mu != mu0}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: mu < mu0}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: mu > mu0}.
}
}

%% \details{}

\value{
A data.frame with variables:

\item{mean }{The sample mean.}

\item{df }{The degree of freedom.}

\item{statistic }{The statistic, when \code{sigma>=0}, \code{statistic = Z = (xb-mu)/(sigma/sqrt(n))}; when \code{sigma<0}, \code{statistic = T = (xb-mu)/(sd(x)/sqrt(n))}.}

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
mean_test1(x, mu = 1, sigma = 0.2, side = 1)
mean_test1(x, mu = 1)
}

