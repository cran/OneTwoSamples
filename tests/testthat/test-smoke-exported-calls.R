skip_on_cran()

is_fun <- function(x) is.function(x) && !is.primitive(x)

test_that("exported functions fail gracefully", {
  exports <- getNamespaceExports("OneTwoSamples")
  for (sym in exports) {
    obj <- getExportedValue("OneTwoSamples", sym)
    if (is_fun(obj)) {
      expect_error(do.call(obj, list()), info = sym)
    }
  }
})
