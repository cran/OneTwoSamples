#' Two sided interval estimation of \code{sigma^2} of one normal sample
#'
#' @description Compute the two sided interval estimation of \code{sigma^2} of one normal sample when the population mean is known or unknown.
#'
#' @param x A numeric vector.
#'
#' @param mu The population mean. When it is known, input it, and the function computes the interval endpoints using a chi-square distribution with degree of freedom \code{n}. When it is unknown, ignore it, and the function computes the interval endpoints using a chi-square distribution with degree of freedom \code{n-1}.
#'
#' @param alpha The significance level, a real number in [0, 1]. Default to 0.05. 1-alpha is the degree of confidence.
#'
#' @return A data.frame with variables:
#' 
#' \item{var }{The estimate of the population variance. When the population mean \code{mu} is known, \code{var = mean((x-mu)^2)}. When \code{mu} is unknown, \code{var = var(x)}.}
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
#' interval_var1(x, mu = 1)
#' interval_var1(x)
#'
#' @export
interval_var1<-function(x,mu=Inf,alpha=0.05){ 
   n<-length(x) 
   if (mu<Inf){
      S2 <- sum((x-mu)^2)/n; df <- n
   }
   else{
      S2 <- var(x); df <- n-1
   }
   a<-df*S2/qchisq(1-alpha/2,df)
   b<-df*S2/qchisq(alpha/2,df)
   data.frame(var=S2, df=df, a=a, b=b)
}
