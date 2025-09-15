test_that("package loads and has a namespace", {
  expect_true("OneTwoSamples" %in% .packages(all.available = TRUE) || "package:OneTwoSamples" %in% search())
  ns <- asNamespace("OneTwoSamples")
  expect_equal(class(ns), "environment")
})
