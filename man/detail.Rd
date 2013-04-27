\name{detail}
\alias{detail}

\title{
Show details of an object
}
\description{
Show details of an object.
}
\usage{
detail(x)
}

\arguments{
  \item{x}{
Any \code{R} object to be tested.
}
}
%% \details{}
\value{
A list with components:

\item{x }{The argument \code{x}.}

\item{isS4 }{Logical, indicates whether \code{x} is an S4 object.}

\item{isObject }{Logical, indicates whether \code{x} is an object, i.e., with a class attribute.}

\item{class }{The class of \code{x}.}

\item{attributes }{The attributes of \code{x}. Usually \code{result$attributes} is also a list.}

}
\references{
Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion.
}

\author{ Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} }

\seealso{
\code{\link{isS4}}, \code{\link{is.object}}, \code{\link{class}}, \code{\link{attributes}}
}

\examples{
x=rnorm(10, mean = 1, sd = 0.2); x
t = t.test(x); t
detail(t)
}


