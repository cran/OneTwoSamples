#' OneTwoSamples: Deal with One and Two (Normal) Samples
#'
#' In this package, we introduce an R function \code{one_two_sample()} which
#' can deal with one and two (normal) samples, Ying-Ying Zhang, Yi Wei (2012),
#' \doi{10.2991/asshm-13.2013.29}. For one normal sample x, the function
#' reports descriptive statistics, plot, interval estimation and test of
#' hypothesis of x. For two normal samples x and y, the function reports
#' descriptive statistics, plot, interval estimation and test of hypothesis of
#' x and y, respectively. It also reports interval estimation and test of
#' hypothesis of mu1-mu2 (the difference of the means of x and y) and
#' sigma1^2/sigma2^2 (the ratio of the variances of x and y), tests whether x
#' and y are from the same population, finds the correlation coefficient of x
#' and y if x and y have the same length.
#'
#' The most important functions are \code{\link{one_two_sample}} and
#' \code{\link{one_sample}}.
#'
#' @references Zhang, Y. Y., Wei, Y. (2013), One and two samples using only an
#' R funtion, \doi{10.2991/asshm-13.2013.29}.
#'
#' @keywords internal
#' @importFrom grDevices dev.new graphics.off
#' @importFrom graphics hist legend lines
#' @importFrom methods show
#' @importFrom stats binom.test cor.test density dnorm ecdf ks.test median
#' pchisq pf pnorm pt qchisq qf qnorm qqline qqnorm qt quantile sd
#' shapiro.test t.test var var.test wilcox.test
"_PACKAGE"
