\name{one_sample}
\alias{one_sample}

\title{
Deal with one (normal) sample
}
\description{
Deal with one sample \code{x}, especially normal. Report descriptive statistics, plot, interval estimation and test of hypothesis of \code{x}.
}
\usage{
one_sample(x, mu = Inf, sigma = -1, side = 0, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}

  \item{mu}{
\code{mu} plays two roles. 

In two sided or one sided interval estimation of \code{sigma^2} of one normal sample, \code{mu} is the population mean. When it is known, input it, and the function computes the interval endpoints using a chi-square distribution with degree of freedom \code{n}. When it is unknown, ignore it, and the function computes the interval endpoints using a chi-square distribution with degree of freedom \code{n-1}.

In two sided or one sided test of hypothesis of \code{mu} of one normal sample, \code{mu} is \code{mu0} in the null hypothesis, and \code{mu0 = if (mu < Inf) mu else 0}.
}

  \item{sigma}{
\code{sigma} plays two roles. 

In two sided or one sided interval estimation of \code{mu} of one normal sample, \code{sigma} is the standard deviation of the population. \code{sigma>=0} indicates it is known, \code{sigma<0} indicates it is unknown. Default to unknown standard deviation.

In two sided or one sided test of hypothesis of \code{sigma^2} of one normal sample, \code{sigma} is \code{sigma0} in the null hypothesis. Default is 1, i.e., \code{H0: sigma^2 = 1}.
}

  \item{side}{
\code{side} plays four roles. 

In two sided or one sided interval estimation of \code{mu} of one normal sample, \code{side} is a parameter used to control whether to compute two sided or one sided interval estimation. When computing the one sided upper limit, input \code{side = -1}; when computing the one sided lower limit, input \code{side = 1}; when computing the two sided limits, input \code{side = 0} (default). 

In two sided or one sided interval estimation of \code{sigma^2} of one normal sample, {side} is a parameter used to control whether to compute two sided or one sided interval estimation. When computing the one sided upper limit, input \code{side = -1}; when computing the one sided lower limit, input \code{side = 1}; when computing the two sided limits, input \code{side = 0} (default).

In two sided or one sided test of hypothesis of \code{mu} of one normal sample, \code{side} is a parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: mu != mu0}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: mu < mu0}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: mu > mu0}.

In two sided or one sided test of hypothesis of \code{sigma^2} of one normal sample, \code{side} is a parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: sigma^2 != sigma0^2}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: sigma^2 < sigma0^2}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: sigma^2 > sigma0^2}.
}

  \item{alpha}{
The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
}
}

%% \details{}

\value{
A list with the following components:

\item{mu_interval }{It contains the results of interval estimation of \code{mu}.}

\item{mu_hypothesis }{It contains the results of test of hypothesis of \code{mu}.}

\item{sigma_interval }{It contains the results of interval estimation of \code{sigma}.}

\item{sigma_hypothesis }{It contains the results of test of hypothesis of \code{sigma}.}
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
one_sample(x, mu = 1, sigma = 0.2, side = 1)
one_sample(x, sigma = 0.2, side = 1)
one_sample(x, mu = 1, side = 1)
one_sample(x)
}