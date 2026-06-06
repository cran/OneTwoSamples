#' Two sided or one sided test of hypothesis of \code{mu1} and \code{mu2} of two normal samples
#'
#' @description Compute the two sided or one sided test of hypothesis of \code{mu1} and \code{mu2} of two normal samples when the population variances are known, unknown equal, or unknown unequal.
#'
#' @param x A numeric vector.
#'
#' @param y A numeric vector.
#'
#' @param sigma A numeric vector of length 2, which contains the standard deviations of two populations. When the standard deviations are known, input it, then the function computes the interval endpoints using normal population; when the standard deviations are unknown, ignore it, now we need to consider whether the two populations have equal variances. See \code{var.equal} below.
#'
#' @param var.equal A logical variable indicating whether to treat the two variances as being equal. If \code{TRUE} then the pooled variance is used to estimate the variance otherwise the Welch (or Satterthwaite) approximation to the degrees of freedom is used.
#'
#' @param side A parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: mu1 != mu2}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: mu1 < mu2}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: mu1 > mu2}.
#'
#' @return A data.frame with variables:
#' 
#' \item{mean }{The difference of sample means xb-yb.}
#' 
#' \item{df }{The degree of freedom.}
#' 
#' \item{statistic }{The statistic, when \code{all(sigma>=0)}, \code{statistic = Z}; otherwise, \code{statistic = T}.}
#' 
#' \item{p_value }{The P value.}
#'
#' @references Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion,
#' \doi{10.2991/asshm-13.2013.29}.
#'
#' @author Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} 
#'
#'
#' @examples
#' x=rnorm(10, mean = 1, sd = 0.2); x
#' y=rnorm(20, mean = 2, sd = 0.3); y
#' mean_test2(x, y, sigma = c(0.2, 0.3), side = 1)
#' mean_test2(x, y, var.equal = TRUE, side = 1)
#' mean_test2(x, y, side = 1)
#'
#' @export
mean_test2<-function(x, y, 
   sigma=c(-1, -1), var.equal=FALSE, side=0){
   ## source("p_value.R")
   n1<-length(x); n2<-length(y)
   xb<-mean(x); yb<-mean(y)
   if (all(sigma>=0)){
      z<-(xb-yb)/sqrt(sigma[1]^2/n1+sigma[2]^2/n2)
      P<-p_value(pnorm, z, side=side)
      data.frame(mean=xb-yb, df=n1+n2, Z=z, p_value=P)
   }
   else{
      if (var.equal ==  TRUE){
         Sw<-sqrt(((n1-1)*var(x)+(n2-1)*var(y))/(n1+n2-2))
         t<-(xb-yb)/(Sw*sqrt(1/n1+1/n2))
         nu<-n1+n2-2
      }
      else{
         S1<-var(x); S2<-var(y)
         nu<-(S1/n1+S2/n2)^2/(S1^2/n1^2/(n1-1)+S2^2/n2^2/(n2-1))
         t<-(xb-yb)/sqrt(S1/n1+S2/n2)
      }
      P<-p_value(pt, t, paramet=nu, side=side)
      data.frame(mean=xb-yb, df=nu, T=t, p_value=P)
   }
}
