\name{one_two_sample}
\alias{one_two_sample}

\title{
Deal with one and two (normal) samples
}
\description{
Deal with one and two (normal) samples. For one normal sample x, the function reports descriptive statistics, plot, interval estimation and test of hypothesis of x. For two normal samples x and y, the function reports descriptive statistics, plot, interval estimation and test of hypothesis of x and y, respectively. It also reports interval estimation and test of hypothesis of mu1-mu2 (the difference of the means of x and y) and sigma1^2/sigma2^2 (the ratio of the variances of x and y), tests whether x and y are from the same population, finds the correlation coefficient of x and y if x and y have the same length.
}
\usage{
one_two_sample(x, y = NULL, mu = c(Inf, Inf), sigma = c(-1, -1), 
               var.equal = FALSE, ratio = 1, side = 0, alpha = 0.05)
}

\arguments{
  \item{x}{
A numeric vector.
}
  \item{y}{
A numeric vector.
}
  \item{mu}{
If \code{y = NULL}, i.e., there is only one sample. See the argument \code{mu} in \code{\link{one_sample}}. For two normal samples \code{x} and \code{y}, \code{mu} plays one role: the population means. However, \code{mu} is used in two places: one is the two sided or one sided interval estimation of \code{sigma1^2 / sigma2^2} of two normal samples, another is the two sided or one sided test of hypothesis of \code{sigma1^2} and \code{sigma2^2} of two normal samples. When \code{mu} is known, input it, and the function computes the interval endpoints (or the F value) using an F distribution with degree of freedom \code{(n1, n2)}. When it is unknown, ignore it, and the function computes the interval endpoints (or the F value) using an F distribution with degree of freedom \code{(n1-1, n2-1)}.
}
  \item{sigma}{
If \code{y = NULL}, i.e., there is only one sample. See the argument \code{sigma} in \code{\link{one_sample}}. For two normal samples \code{x} and \code{y}, \code{sigma} plays one role: the population standard deviations. However, \code{sigma} is used in two places: one is the two sided or one sided interval estimation of \code{mu1-mu2} of two normal samples, another is the two sided or one sided test of hypothesis of \code{mu1} and \code{mu2} of two normal samples. When the standard deviations are known, input it, then the function computes the interval endpoints using normal population; when the standard deviations are unknown, ignore it, now we need to consider whether the two populations have equal variances. See \code{var.equal} below.
}
  \item{var.equal}{
A logical variable indicating whether to treat the two variances as being equal. If \code{TRUE} then the pooled variance is used to estimate the variance otherwise the Welch (or Satterthwaite) approximation to the degrees of freedom is used.
}
  \item{ratio}{
The hypothesized ratio of the population variances of \code{x} and \code{y}. It is used in \code{var.test(x, y, ratio = ratio, ...)}, i.e., when computing the interval estimation and test of hypothesis of \code{sigma1^2 / sigma2^2} when \code{mu1} or \code{mu2} is unknown.
}
  \item{side}{
If \code{y = NULL}, i.e., there is only one sample. See the argument \code{side} in \code{\link{one_sample}}. For two normal samples \code{x} and \code{y}, \code{sigma} is used in four places: interval estimation of \code{mu1-mu2}, test of hypothesis of \code{mu1} and \code{mu2}, interval estimation of \code{sigma1^2 / sigma2^2}, test of hypothesis of \code{sigma1^2} and \code{sigma2^2}. In interval estimation of \code{mu1-mu2} or \code{sigma1^2 / sigma2^2}, \code{side} is a parameter used to control whether to compute two sided or one sided interval estimation. When computing the one sided upper limit, input \code{side = -1}; when computing the one sided lower limit, input \code{side = 1}; when computing the two sided limits, input \code{side = 0} (default). In test of hypothesis of \code{mu1} and \code{mu2} or \code{sigma1^2} and \code{sigma2^2}, \code{side} is a parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: mu1 != mu2} or \code{H1: sigma1^2 != sigma2^2}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: mu1 < mu2} or \code{H1: sigma1^2 < sigma2^2}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: mu1 > mu2} or \code{H1: sigma1^2 > sigma2^2}.
}.
  \item{alpha}{
The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
}
}

%% \details{}

\value{
A list with the following components:

\item{one_sample_x }{It contains the results by \code{one_sample(x, ...)}. }

\item{one_sample_y }{It contains the results by \code{one_sample(y, ...)}. }

\item{mu1_mu2_interval }{It contains the results of interval estimation of \code{mu1-mu2}.}

\item{mu1_mu2_hypothesis }{It contains the results of test of hypothesis of \code{mu1-mu2}.}

\item{sigma_ratio_interval }{It contains the results of interval estimation of \code{sigma1^2 / sigma2^2}.}

\item{sigma_ratio_hypothesis }{It contains the results of test of hypothesis of \code{sigma1^2 / sigma2^2}.}

\item{res.ks }{It contains the results of \code{ks.test(x,y)}.}

\item{res.binom }{It contains the results of \code{binom.test(sum(x<y), length(x))}.}

\item{res.wilcox }{It contains the results of \code{wilcox.test(x, y, ...)}.}

\item{cor.pearson }{It contains the results of \code{cor.test(x, y, method = "pearson", ...)}.}

\item{cor.kendall }{It contains the results of \code{cor.test(x, y, method = "kendall", ...)}.}

\item{cor.spearman }{It contains the results of \code{cor.test(x, y, method = "spearman", ...)}.}
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
## One sample
x=rnorm(10, mean = 1, sd = 0.2); x

## one_sample(x, ...) == one_two_sample(x, ...)
one_sample(x, mu = 1, sigma = 0.2, side = 1)
one_two_sample(x, mu = 1, sigma = 0.2, side = 1)

one_sample(x, sigma = 0.2, side = 1)
one_two_sample(x, sigma = 0.2, side = 1)

one_sample(x, mu = 1, side = 1)
one_two_sample(x, mu = 1, side = 1)

one_sample(x)
one_two_sample(x)

## Two samples
set.seed(1)
x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y
y2=rnorm(20, mean = 2, sd = 0.2); y2

## sigma1, sigma2 known; mu1, mu2 known
one_two_sample(x, y, sigma = c(0.2, 0.3), mu = c(1, 2))

## sigma1 = sigma2 unknown; mu1, mu2 known
one_two_sample(x, y2, var.equal = TRUE, mu = c(1, 2))

## sigma1 != sigma2 unknown; mu1, mu2 known
one_two_sample(x, y, mu = c(1, 2))

## sigma1, sigma2 known; mu1, mu2 unknown
one_two_sample(x, y, sigma = c(0.2, 0.3))

## sigma1 = sigma2 unknown; mu1, mu2 unknown
one_two_sample(x, y2, var.equal = TRUE)

## sigma1 != sigma2 unknown; mu1, mu2 unknown
one_two_sample(x, y)

}












