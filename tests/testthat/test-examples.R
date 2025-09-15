skip()
test_that("examples run", {
  have_test_examples <- is.function(getFromNamespace("test_examples", "testthat"))
  if (have_test_examples) {
    testthat::test_examples("../../man/")
  } else {
    topics <- tools::Rd_db("OneTwoSamples")
    if (length(topics)) {
      for (nm in names(topics)) {
        try(silent = TRUE, {
          example(topic = nm, package = "OneTwoSamples", ask = FALSE, run.donttest = TRUE)
        })
      }
    } else {
      skip("No Rd topics found")
    }
  }
})
