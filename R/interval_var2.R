#' Two sided interval estimation of \code{sigma1^2 / sigma2^2} of two normal samples
#'
#' @description Compute the two sided interval estimation of \code{sigma1^2 / sigma2^2} of two normal samples when the population means are known or unknown.
#'
#' @param x A numeric vector.
#'
#' @param y A numeric vector.
#'
#' @param mu The population means. When it is known, input it, and the function computes the interval endpoints using an F distribution with degree of freedom \code{(n1, n2)}. When it is unknown, ignore it, and the function computes the interval endpoints using an F distribution with degree of freedom \code{(n1-1, n2-1)}.
#'
#' @param alpha The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
#'
#' @return A data.frame with variables:
#' 
#' \item{rate }{The estimate of the ratio of population variances, \code{rate = Sx2/Sy2}. When the population means \code{mu} is known, \code{Sx2 = 1/n1*sum((x-mu[1])^2)} and \code{Sy2 = 1/n2*sum((y-mu[2])^2}. When \code{mu} is unknown, \code{Sx2 = var(x)} and \code{Sy2 = var(y)}.}
#' 
#' \item{df1 }{The first degree of freedom.}
#' 
#' \item{df2 }{The second degree of freedom.}
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
#' interval_var2(x, y, mu = c(1,2))
#' interval_var2(x, y)
#'
#' @export
interval_var2<-function(x,y, 
   mu=c(Inf, Inf), alpha=0.05){ 
   n1<-length(x); n2<-length(y) 
   if (all(mu<Inf)){
      Sx2<-1/n1*sum((x-mu[1])^2); Sy2<-1/n2*sum((y-mu[2])^2)
      df1<-n1; df2<-n2
   }
   else{
      Sx2<-var(x); Sy2<-var(y); df1<-n1-1; df2<-n2-1
   }
   r<-Sx2/Sy2
   a<-r/qf(1-alpha/2,df1,df2)
   b<-r/qf(alpha/2,df1,df2)
   data.frame(rate=r, df1=df1, df2=df2, a=a, b=b)
}
