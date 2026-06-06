#' Compute various descriptive statistics
#'
#' @description Compute various descriptive statistics of x, such as mean, median, skewness, and kurtosis, etc.
#'
#' @param x A numeric vector.
#'
#' @return A data.frame with variables:
#' 
#' \item{N }{The length.}
#' 
#' \item{Mean }{The mean.}
#' 
#' \item{Var }{The variance.}
#' 
#' \item{std_dev }{Standard deviation.}
#' 
#' \item{Median }{The median.}
#' 
#' \item{std_mean }{The standard error of the sample mean.}
#' 
#' \item{CV }{The coefficient of variation.}
#' 
#' \item{CSS }{The corrected sum of squares.}
#' 
#' \item{USS }{The uncorrected sum of squares.}
#' 
#' \item{R }{The extreme difference.}
#' 
#' \item{R1 }{The half extreme difference, or the difference of upper quartile and lower quartile.}
#' 
#' \item{Skewness }{The coefficient of skewness.}
#' 
#' \item{Kurtosis }{The coefficient of kurtosis.}
#' 
#' \item{row.names }{1.}
#'
#' @references Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion,
#' \doi{10.2991/asshm-13.2013.29}.
#'
#' @author Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} 
#'
#'
#' @examples
#' x=rnorm(10, mean = 1, sd = 0.2); x
#' data_outline(x)
#'
#' @export
data_outline <- function(x){
   n <- length(x)
   m <- mean(x)
   v <- var(x)
   s <- sd(x)
   me <- median(x)
   cv <- 100*s/m
   css <- sum((x-m)^2)
   uss <- sum(x^2)
   R <-  max(x)-min(x)
   R1 <- quantile(x,3/4)-quantile(x,1/4)
   sm <- s/sqrt(n)
   g1 <- n/((n-1)*(n-2))*sum((x-m)^3)/s^3
   g2 <- ((n*(n+1))/((n-1)*(n-2)*(n-3))*sum((x-m)^4)/s^4
          - (3*(n-1)^2)/((n-2)*(n-3)))
   data.frame(N=n, Mean=m, Var=v, std_dev=s, Median=me, 
        std_mean=sm, CV=cv, CSS=css, USS=uss, R=R, 
        R1=R1, Skewness=g1, Kurtosis=g2, row.names=1)
}
