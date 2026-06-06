#' Compute the P value
#'
#' @description Compute the P value of a cumulative distribution function (cdf).
#'
#' @param cdf The cumulative distribution function. For normal distribution, \code{cdf = pnorm}.
#'
#' @param x A given value to compute the P value.
#'
#' @param paramet The parameter of the corresponding distribution. For normal distribution, \code{paramet = c(mu, sigma)}. 
#'
#' @param side A parameter indicating whether to compute one sided or two sided P value. When inputting \code{side = -1} (or a number < 0), the function computes a left side P value; when inputting \code{side = 1} (or a number > 0), the function computes a right side P value; when inputting \code{side = 0} (default), the function computes a two sided P value.
#'
#' @return The P value.
#'
#' @references Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an R funtion,
#' \doi{10.2991/asshm-13.2013.29}.
#'
#' @author Ying-Ying Zhang (Robert) \email{robertzhangyying@qq.com} 
#'
#'
#' @examples
#' p_value(pnorm, x = 0, side = 1)
#' p_value(pt, x = 0, paramet = 5, side = 1)
#'
#' @export
p_value<-function(cdf, x, paramet=numeric(0), side=0){
   n<-length(paramet)
   P<-switch(n+1,
      cdf(x), 
      cdf(x, paramet), 
      cdf(x, paramet[1], paramet[2]),
      cdf(x, paramet[1], paramet[2], paramet[3])
   )
   if (side<0)         P
   else if (side>0)  1-P
   else 
      if (P<1/2)     2*P 
      else           2*(1-P)
}
