#' Two sided interval estimation of \code{mu1-mu2} of two normal samples
#'
#' @description Compute the two sided interval estimation of \code{mu1-mu2} of two normal samples when the population variances are known, unknown equal, or unknown unequal.
#'
#' @param x A numeric vector.
#'
#' @param y A numeric vector.
#'
#' @param sigma A numeric vector of length 2, which contains the standard deviations of two populations. When the standard deviations are known, input it, then the function computes the interval endpoints using normal population; when the standard deviations are unknown, ignore it, now we need to consider whether the two populations have equal variances. See \code{var.equal} below.
#'
#' @param var.equal A logical variable indicating whether to treat the two variances as being equal. If \code{TRUE} then the pooled variance is used to estimate the variance otherwise the Welch (or Satterthwaite) approximation to the degrees of freedom is used.
#'
#' @param alpha The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
#'
#' @return A data.frame with variables:
#' 
#' \item{mean }{The difference of sample means xb-yb.}
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
#' y=rnorm(20, mean = 2, sd = 0.3); y
#' 
#' interval_estimate2(x, y, sigma = c(0.2, 0.3))
#' interval_estimate2(x, y, var.equal = TRUE)
#' interval_estimate2(x, y)
#'
#' @export
interval_estimate2<-function(x, y, 
   sigma=c(-1,-1),var.equal=FALSE, alpha=0.05){ 
   n1<-length(x); n2<-length(y)
   xb<-mean(x); yb<-mean(y)
   if (all(sigma>=0)){
      tmp<-qnorm(1-alpha/2)*sqrt(sigma[1]^2/n1+sigma[2]^2/n2)
      df<-n1+n2
   }
   else{
      if (var.equal ==  TRUE){
         Sw<-((n1-1)*var(x)+(n2-1)*var(y))/(n1+n2-2)
         tmp<-sqrt(Sw*(1/n1+1/n2))*qt(1-alpha/2,n1+n2-2)
         df<-n1+n2-2
      }
      else{
         S1<-var(x); S2<-var(y)
         nu<-(S1/n1+S2/n2)^2/(S1^2/n1^2/(n1-1)+S2^2/n2^2/(n2-1))
         tmp<-qt(1-alpha/2, nu)*sqrt(S1/n1+S2/n2)
         df<-nu
      }
   }
   data.frame(mean=xb-yb, df=df, a=xb-yb-tmp, b=xb-yb+tmp)
}
