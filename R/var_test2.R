#' Two sided or one sided test of hypothesis of \code{sigma1^2} and \code{sigma2^2} of two normal samples
#'
#' @description Compute the two sided or one sided test of hypothesis of \code{sigma1^2} and \code{sigma2^2} of two normal samples when the population means are known or unknown.
#'
#' @param x A numeric vector.
#'
#' @param y A numeric vector.
#'
#' @param mu The population means. When it is known, input it, and the function computes the F value using an F distribution with degree of freedom \code{(n1, n2)}. When it is unknown, ignore it, and the function computes the F value using an F distribution with degree of freedom \code{(n1-1, n2-1)}.
#'
#' @param side A parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: sigma1^2 != sigma2^2}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: sigma1^2 < sigma2^2}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: sigma1^2 > sigma2^2}.
#'
#' @return A data.frame with variables:
#' 
#' \item{rate }{The estimate of the ratio of population variances, \code{rate = Sx2/Sy2}. When the population means \code{mu} is known, \code{Sx2 = 1/n1*sum((x-mu[1])^2)} and 
#'              \code{Sy2 = 1/n2*sum((y-mu[2])^2}. When \code{mu} is unknown, \code{Sx2 = var(x)} and \code{Sy2 = var(y)}.}
#' 
#' \item{df1 }{The first degree of freedom.}
#' 
#' \item{df2 }{The second degree of freedom.}
#' 
#' \item{F }{The F statistic.}
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
#' var_test2(x, y, mu = c(1, 2), side = 1)
#' var_test2(x, y, side = 1)
#'
#' @export
var_test2<-function(x, y, mu=c(Inf, Inf), side=0){
   ## source("p_value.R")
   n1<-length(x); n2<-length(y)
   if (all(mu<Inf)){
      Sx2<-sum((x-mu[1])^2)/n1; Sy2<-sum((y-mu[2])^2)/n2
      df1=n1; df2=n2
   }
   else{
      Sx2<-var(x); Sy2<-var(y); df1=n1-1; df2=n2-1
   }
   r<-Sx2/Sy2
   P<-p_value(pf, r, paramet=c(df1, df2), side=side)
   data.frame(rate=r, df1=df1, df2=df2, F=r, P_value=P)
}

