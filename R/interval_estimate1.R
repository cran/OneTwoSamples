#' Two sided interval estimation of \code{mu} of one normal sample
#'
#' @description Compute the two sided interval estimation of \code{mu} of one normal sample when the population variance is known or unknown.
#'
#' @param x A numeric vector.
#'
#' @param sigma The standard deviation of the population. \code{sigma>=0} indicates it is known, \code{sigma<0} indicates it is unknown. Default to unknown standard deviation.
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
#' interval_estimate1(x, sigma = 0.2)
#' interval_estimate1(x)
#'
#' @export
interval_estimate1<-function(x,sigma=-1,alpha=0.05){ 
   n<-length(x); xb<-mean(x)
   if (sigma>=0){
      tmp<-sigma/sqrt(n)*qnorm(1-alpha/2); df<-n
   }
   else{
      tmp<-sd(x)/sqrt(n)*qt(1-alpha/2,n-1); df<-n-1
   }
   data.frame(mean=xb, df=df, a=xb-tmp, b=xb+tmp)
}
