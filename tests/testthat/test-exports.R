test_that("exported objects are present", {
  ns <- asNamespace("OneTwoSamples")
  exports <- getNamespaceExports(ns)
  expect_type(exports, "character")
  expect_gt(length(exports), 0)
  for (sym in exports) {
    obj <- getExportedValue("OneTwoSamples", sym)
    expect_true(!is.null(obj), info = sym)
  }
})
