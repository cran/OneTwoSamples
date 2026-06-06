#' Two sided or one sided test of hypothesis of \code{sigma^2} of one normal sample
#'
#' @description Compute the two sided or one sided test of hypothesis of \code{sigma^2} of one normal sample when the population mean is known or unknown.
#'
#' @param x A numeric vector.
#'
#' @param sigma2 \code{sigma2} is \code{sigma0^2} in the null hypothesis. Default is 1, i.e., \code{H0: sigma^2 = 1}.
#'
#' @param mu The population mean. \code{mu < Inf} indicates it is known, \code{mu == Inf} indicates it is unknown. Default to unknown population mean.
#'
#' @param side A parameter used to control two sided or one sided test of hypothesis. When inputting \code{side = 0} (default), the function computes two sided test of hypothesis, and \code{H1: sigma^2 != sigma0^2}; when inputting \code{side = -1} (or a number < 0), the function computes one sided test of hypothesis, and \code{H1: sigma^2 < sigma0^2}; when inputting \code{side = 1} (or a number > 0), the function computes one sided test of hypothesis, and \code{H1: sigma^2 > sigma0^2}.
#'
#' @return A data.frame with variables:
#' 
#' \item{var }{The estimate of the population variance. When the population mean \code{mu} is known, \code{var = mean((x-mu)^2)}. When \code{mu} is unknown, \code{var = var(x)}.}
#' 
#' \item{df }{The degree of freedom.}
#' 
#' \item{chisq2 }{The chisquare statistic.}
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
#' var_test1(x, sigma2 = 0.2^2, mu = 1, side = 1)
#' var_test1(x, sigma2 = 0.2^2, side = 1)
#'
#' @export
var_test1<-function(x, sigma2=1, mu=Inf, side=0){
   ## source("p_value.R")
   n<-length(x)
   if (mu<Inf){
      S2<-sum((x-mu)^2)/n; df=n
   }
   else{
      S2<-var(x); df=n-1
   }
   chi2<-df*S2/sigma2;
   P<-p_value(pchisq, chi2, paramet=df, side=side)
   data.frame(var=S2, df=df, chisq2=chi2, P_value=P)
}
