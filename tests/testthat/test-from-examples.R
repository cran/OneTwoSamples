tol <- 1e-8

test_that("Examples 1–4: one normal sample with various known/unknown params", {
  set.seed(1)
  x <- rnorm(10, mean = 1, sd = 0.2)

  ## Example 1: mu known, sigma known
  r_meant1 <- mean_test1(x, mu = 1, sigma = 0.2)
  z <- (mean(x) - 1) / (0.2 / sqrt(length(x)))
  pz <- 2 * (1 - pnorm(abs(z)))
  expect_s3_class(r_meant1, "data.frame")
  expect_equal(r_meant1$df[1], length(x))
  expect_equal(as.numeric(r_meant1$Z[1]), as.numeric(z), tolerance = tol)
  expect_equal(as.numeric(r_meant1$p_value[1]), as.numeric(pz), tolerance = tol)

  r_ci4 <- interval_estimate4(x, sigma = 0.2)
  z975 <- qnorm(1 - 0.05/2)
  a <- mean(x) - z975 * 0.2 / sqrt(length(x))
  b <- mean(x) + z975 * 0.2 / sqrt(length(x))
  expect_s3_class(r_ci4, "data.frame")
  expect_named(r_ci4, c("mean","df","a","b"))
  expect_equal(r_ci4$a[1], a, tolerance = tol)
  expect_equal(r_ci4$b[1], b, tolerance = tol)

  r_var_int <- interval_var3(x, mu = 1)
  S2 <- mean( (x - 1)^2 )
  df <- length(x)
  a_var <- df * S2 / qchisq(1 - 0.05/2, df)
  b_var <- df * S2 / qchisq(0.05/2, df)
  expect_s3_class(r_var_int, "data.frame")
  expect_equal(r_var_int$df[1], df)
  expect_equal(r_var_int$a[1], a_var, tolerance = tol)
  expect_equal(r_var_int$b[1], b_var, tolerance = tol)

  r_var_t <- var_test1(x, sigma2 = 0.2^2, mu = 1)
  chi2 <- df * S2 / (0.2^2)
  pchi <- {
    P <- pchisq(chi2, df = df)
    if (P < 0.5) 2*P else 2*(1-P)
  }
  expect_s3_class(r_var_t, "data.frame")
  expect_equal(r_var_t$chisq2[1], chi2, tolerance = tol)
  expect_equal(r_var_t$P_value[1], pchi, tolerance = tol)

  ## Example 2: mu unknown, sigma known
  r_meant1_b <- mean_test1(x, sigma = 0.2)  # H0: mu = 0 (default)
  z0 <- (mean(x) - 0) / (0.2 / sqrt(length(x)))
  pz0 <- 2 * (1 - pnorm(abs(z0)))
  expect_equal(as.numeric(r_meant1_b$Z[1]), as.numeric(z0), tolerance = tol)
  expect_equal(as.numeric(r_meant1_b$p_value[1]), as.numeric(pz0), tolerance = tol)

  r_var_int_b <- interval_var3(x)  # mu unknown
  S2b <- var(x); dfb <- length(x) - 1
  a_var_b <- dfb * S2b / qchisq(1 - 0.05/2, dfb)
  b_var_b <- dfb * S2b / qchisq(0.05/2, dfb)
  expect_equal(r_var_int_b$df[1], dfb)
  expect_equal(r_var_int_b$a[1], a_var_b, tolerance = tol)
  expect_equal(r_var_int_b$b[1], b_var_b, tolerance = tol)

  r_var_t_b <- var_test1(x, sigma2 = 0.2^2)
  chi2b <- dfb * S2b / (0.2^2)
  P <- pchisq(chi2b, df = dfb); pchi_b <- if (P < 0.5) 2*P else 2*(1-P)
  expect_equal(r_var_t_b$chisq2[1], chi2b, tolerance = tol)
  expect_equal(r_var_t_b$P_value[1], pchi_b, tolerance = tol)

  ## Example 3: mu known, sigma unknown
  r_meant1_c <- mean_test1(x, mu = 1)
  tt <- t.test(x, mu = 1)
  expect_equal(as.numeric(r_meant1_c$T[1]), as.numeric(tt$statistic), tolerance = tol)
  expect_equal(as.numeric(r_meant1_c$p_value[1]), as.numeric(tt$p.value), tolerance = tol)

  r_var_int_c <- interval_var3(x, mu = 1)
  expect_equal(r_var_int_c$df[1], df)  # using df = n when mu known

  r_var_t_c <- var_test1(x, mu = 1)
  expect_true(is.finite(r_var_t_c$P_value[1]))

  ## Example 4: mu unknown, sigma unknown
  tt0 <- t.test(x)  # H0: mu = 0 by default
  r_var_int_d <- interval_var3(x)
  expect_equal(r_var_int_d$df[1], dfb)
  r_var_t_d <- var_test1(x)
  expect_true(is.finite(r_var_t_d$P_value[1]))
})

test_that("Examples 5–6: one non-normal sample (exp)", {
  set.seed(1)
  x <- rexp(10, rate = 1)

  ## sigma known
  r_ci3 <- interval_estimate3(x, sigma = 1)
  z975 <- qnorm(1 - 0.05/2)
  a <- mean(x) - z975 / sqrt(length(x))
  b <- mean(x) + z975 / sqrt(length(x))
  expect_s3_class(r_ci3, "data.frame")
  expect_equal(r_ci3$a[1], a, tolerance = tol)
  expect_equal(r_ci3$b[1], b, tolerance = tol)

  ## sigma unknown
  r_ci3_b <- interval_estimate3(x)
  a2 <- mean(x) - z975 * sd(x) / sqrt(length(x))
  b2 <- mean(x) + z975 * sd(x) / sqrt(length(x))
  expect_equal(r_ci3_b$a[1], a2, tolerance = tol)
  expect_equal(r_ci3_b$b[1], b2, tolerance = tol)
})

test_that("Examples 7–12: two-sample scenarios", {
  set.seed(1)
  x <- rnorm(10, mean = 1, sd = 0.2)
  y <- rnorm(20, mean = 2, sd = 0.3)
  y2 <- rnorm(20, mean = 2, sd = 0.2)

  n1 <- length(x); n2 <- length(y)

  ## Example 7: sigma1, sigma2 known; mu1, mu2 known
  r_ci5 <- interval_estimate5(x, y, sigma = c(0.2, 0.3))
  zb <- mean(x) - mean(y)
  z975 <- qnorm(1 - 0.05/2)
  tmp <- z975 * sqrt(0.2^2/n1 + 0.3^2/n2)
  expect_equal(r_ci5$a[1], zb - tmp, tolerance = tol)
  expect_equal(r_ci5$b[1], zb + tmp, tolerance = tol)

  r_mt2 <- mean_test2(x, y, sigma = c(0.2, 0.3))
  z <- zb / sqrt(0.2**2/n1 + 0.3**2/n2)
  pz <- 2 * (1 - pnorm(abs(z)))
  expect_equal(as.numeric(r_mt2$Z[1]), as.numeric(z), tolerance = tol)
  expect_equal(as.numeric(r_mt2$p_value[1]), as.numeric(pz), tolerance = tol)

  r_iv4 <- interval_var4(x, y, mu = c(1, 2))
  Sx2 <- mean( (x - 1)^2 ); Sy2 <- mean( (y - 2)^2 )
  rtrue <- Sx2 / Sy2
  aF <- rtrue / qf(1 - 0.05/2, df1 = n1, df2 = n2)
  bF <- rtrue / qf(0.05/2, df1 = n1, df2 = n2)
  expect_equal(r_iv4$a[1], aF, tolerance = tol)
  expect_equal(r_iv4$b[1], bF, tolerance = tol)

  r_vt2 <- var_test2(x, y, mu = c(1, 2))
  Pf <- {
    P <- pf(rtrue, df1 = n1, df2 = n2)
    if (P < 0.5) 2*P else 2*(1-P)
  }
  expect_equal(as.numeric(r_vt2$F[1]), as.numeric(rtrue), tolerance = tol)
  expect_equal(as.numeric(r_vt2$P_value[1]), as.numeric(Pf), tolerance = tol)

  ## Example 8: equal variances unknown; mu known
  r_mt2_eq <- mean_test2(x, y2, var.equal = TRUE)
  tt_eq <- t.test(x, y2, var.equal = TRUE)
  expect_equal(as.numeric(r_mt2_eq$T[1]), as.numeric(tt_eq$statistic), tolerance = tol)
  expect_equal(as.numeric(r_mt2_eq$p_value[1]), as.numeric(tt_eq$p.value), tolerance = tol)

  r_iv4_eq <- interval_var4(x, y2, mu = c(1, 2))
  Sx2 <- mean( (x - 1)^2 ); Sy2b <- mean( (y2 - 2)^2 )
  rtrue2 <- Sx2 / Sy2b
  aF2 <- rtrue2 / qf(1 - 0.05/2, df1 = n1, df2 = n2)
  bF2 <- rtrue2 / qf(0.05/2, df1 = n1, df2 = n2)
  expect_equal(r_iv4_eq$a[1], aF2, tolerance = tol)
  expect_equal(r_iv4_eq$b[1], bF2, tolerance = tol)

  r_vt2_eq <- var_test2(x, y2, mu = c(1, 2))
  expect_equal(as.numeric(r_vt2_eq$rate[1]), as.numeric(rtrue2), tolerance = tol)

  ## Example 9: unequal variances unknown; mu known
  r_mt2_uneq <- mean_test2(x, y)  # Welch
  tt_w <- t.test(x, y)
  expect_equal(as.numeric(r_mt2_uneq$T[1]), as.numeric(tt_w$statistic), tolerance = tol)
  expect_equal(as.numeric(r_mt2_uneq$p_value[1]), as.numeric(tt_w$p.value), tolerance = tol)

  r_iv4_uneq <- interval_var4(x, y, mu = c(1, 2))
  expect_s3_class(r_iv4_uneq, "data.frame")
  r_vt2_uneq <- var_test2(x, y, mu = c(1, 2))
  expect_true(is.numeric(r_vt2_uneq$P_value[1]))

  ## Example 10: sigma known; mu unknown
  r_ci5_b <- interval_estimate5(x, y, sigma = c(0.2, 0.3))
  expect_equal(r_ci5_b$a[1], zb - tmp, tolerance = tol)
  expect_equal(r_ci5_b$b[1], zb + tmp, tolerance = tol)
  r_mt2_b <- mean_test2(x, y, sigma = c(0.2, 0.3))
  expect_equal(as.numeric(r_mt2_b$Z[1]), as.numeric(z), tolerance = tol)

  ## Example 11: equal variances unknown; mu unknown
  r_mt2_eq_b <- mean_test2(x, y2, var.equal = TRUE)
  tt_eq_b <- t.test(x, y2, var.equal = TRUE)
  expect_equal(as.numeric(r_mt2_eq_b$T[1]), as.numeric(tt_eq_b$statistic), tolerance = tol)
  expect_equal(as.numeric(r_mt2_eq_b$p_value[1]), as.numeric(tt_eq_b$p.value), tolerance = tol)

  ## Example 12: unequal variances unknown; mu unknown
  r_mt2_uneq_b <- mean_test2(x, y)
  tt_w_b <- t.test(x, y)
  expect_equal(as.numeric(r_mt2_uneq_b$T[1]), as.numeric(tt_w_b$statistic), tolerance = tol)
  expect_equal(as.numeric(r_mt2_uneq_b$p_value[1]), as.numeric(tt_w_b$p.value), tolerance = tol)
})

test_that("Women dataset scenario", {
  data(women, package = "datasets")
  x <- women$height; y <- women$weight

  res <- one_two_sample(x, y)
  expect_type(res, "list")
  expect_true(all(c("res.ks","res.binom","res.wilcox") %in% names(res)))

  # Mirror base R calls
  ks_b <- ks.test(x, y)
  bin_b <- binom.test(sum(x < y), length(x))
  wil_b <- wilcox.test(x, y, paired = TRUE)

  expect_equal(as.numeric(res$res.ks$p.value), as.numeric(ks_b$p.value), tolerance = 1e-10)
  expect_equal(as.numeric(res$res.binom$p.value), as.numeric(bin_b$p.value), tolerance = 1e-10)
  expect_equal(as.numeric(res$res.wilcox$p.value), as.numeric(wil_b$p.value), tolerance = 1e-10)

  # Correlations (n1 == n2 path)
  if (!is.null(res$cor.pearson)) {
    cp <- cor.test(x, y, method = "pearson")
    ck <- cor.test(x, y, method = "kendall")
    cs <- cor.test(x, y, method = "spearman")
    expect_equal(as.numeric(res$cor.pearson$p.value), as.numeric(cp$p.value), tolerance = 1e-10)
    expect_equal(as.numeric(res$cor.kendall$p.value), as.numeric(ck$p.value), tolerance = 1e-10)
    expect_equal(as.numeric(res$cor.spearman$p.value), as.numeric(cs$p.value), tolerance = 1e-10)
  }
})
