#' Two sided or one sided interval estimation of \code{mu} of one normal sample
#'
#' @description Compute the two sided or one sided interval estimation of \code{mu} of one normal sample when the population variance is known or unknown.
#'
#' @param x A numeric vector.
#'
#' @param sigma The standard deviation of the population. \code{sigma>=0} indicates it is known, \code{sigma<0} indicates it is unknown. Default to unknown standard deviation.
#'
#' @param side A parameter used to control whether to compute two sided or one sided interval estimation. When computing the one sided upper limit, input \code{side = -1}; when computing the one sided lower limit, input \code{side = 1}; when computing the two sided limits, input \code{side = 0} (default). 
#'
#' @param alpha The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
#'
#' @return A data.frame with variables:
#' 
#' \item{mean }{The sample mean.}
#' 
#' \item{df }{The degree of freedom.}
#' 
#' \item{a }{The confidence lower limit.}
#' 
#' \item{b }{The confidence upper limit.}
#'
#' @references Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion,
#' \doi{10.2991/asshm-13.2013.29}.
#'
#' @author Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} 
#'
#'
#' @examples
#' x=rnorm(10, mean = 1, sd = 0.2); x
#' interval_estimate4(x, sigma = 0.2, side = -1)
#' interval_estimate4(x, side = 1)
#'
#' @export
interval_estimate4<-function(x, sigma=-1, side=0, alpha=0.05){ 
   n<-length(x); xb<-mean(x)
   if (sigma>=0){
      if (side<0){
         tmp<-sigma/sqrt(n)*qnorm(1-alpha)
         a <- -Inf; b <- xb+tmp
      }
      else if (side>0){
         tmp<-sigma/sqrt(n)*qnorm(1-alpha)
         a <- xb-tmp; b <- Inf
      }
      else{
         tmp <- sigma/sqrt(n)*qnorm(1-alpha/2)
         a <- xb-tmp; b <- xb+tmp
      }
      df<-n
   }
   else{
      if (side<0){
         tmp <- sd(x)/sqrt(n)*qt(1-alpha,n-1)
         a <- -Inf; b <- xb+tmp
      }
      else if (side>0){
         tmp <- sd(x)/sqrt(n)*qt(1-alpha,n-1)
         a <- xb-tmp; b <- Inf
      }
      else{
         tmp <- sd(x)/sqrt(n)*qt(1-alpha/2,n-1)
         a <- xb-tmp; b <- xb+tmp
      }
      df<-n-1
   }
   data.frame(mean=xb, df=df, a=a, b=b)
}
