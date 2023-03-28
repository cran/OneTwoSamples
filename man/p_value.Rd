\name{p_value}
\alias{p_value}

\title{
Compute the P value
}
\description{
Compute the P value of a cumulative distribution function (cdf).
}
\usage{
p_value(cdf, x, paramet = numeric(0), side = 0)
}

\arguments{
  \item{cdf}{
The cumulative distribution function. For normal distribution, \code{cdf = pnorm}.
}
  \item{x}{
A given value to compute the P value.
}
  \item{paramet}{
The parameter of the corresponding distribution. For normal distribution, \code{paramet = c(mu, sigma)}. 
}
  \item{side}{
A parameter indicating whether to compute one sided or two sided P value. When inputting \code{side = -1} (or a number < 0), the function computes a left side P value; when inputting \code{side = 1} (or a number > 0), the function computes a right side P value; when inputting \code{side = 0} (default), the function computes a two sided P value.
}
}

%% \details{}

\value{
The P value.
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
p_value(pnorm, x = 0, side = 1)
p_value(pt, x = 0, paramet = 5, side = 1)
}

