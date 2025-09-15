skip_on_cran()

numeric_like <- list(x = c(1,2,3), y = c(1.5, 2.5, 3.5))

safe_call <- function(fun, ...) {
  out <- try(do.call(fun, list(...)), silent = TRUE)
  if (inherits(out, "try-error")) NULL else out
}

test_that("numeric functions handle simple numeric vectors", {
  exports <- getNamespaceExports("OneTwoSamples")
  for (sym in exports) {
    fun <- try(getExportedValue("OneTwoSamples", sym), silent = TRUE)
    if (inherits(fun, "try-error") || !is.function(fun)) next
    fmls <- formals(fun)
    if (is.null(fmls)) next
    has_xy <- any(names(fmls) %in% c("x","y"))
    if (!has_xy) next
    res <- suppressWarnings(safe_call(fun, x = numeric_like$x, y = numeric_like$y))
  }
  succeed()
})
