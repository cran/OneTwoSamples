\name{data_outline}
\alias{data_outline}

\title{
Compute various descriptive statistics
}
\description{
Compute various descriptive statistics of x, such as mean, median, skewness, and kurtosis, etc.
}
\usage{
data_outline(x)
}

\arguments{
  \item{x}{
A numeric vector.
}
}

%% \details{}

\value{
A data.frame with variables:

\item{N }{The length.}

\item{Mean }{The mean.}

\item{Var }{The variance.}

\item{std_dev }{Standard deviation.}

\item{Median }{The median.}

\item{std_mean }{The standard error of the sample mean.}

\item{CV }{The coefficient of variation.}

\item{CSS }{The corrected sum of squares.}

\item{USS }{The uncorrected sum of squares.}

\item{R }{The extreme difference.}

\item{R1 }{The half extreme difference, or the difference of upper quartile and lower quartile.}

\item{Skewness }{The coefficient of skewness.}

\item{Kurtosis }{The coefficient of kurtosis.}

\item{row.names }{1.}
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
data_outline(x)
}

%% \keyword{ ~kwd1 }
