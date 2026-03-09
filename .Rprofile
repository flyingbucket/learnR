if (interactive() && requireNamespace("httpgd", quietly = TRUE)) {
  httpgd::hgd(port = 8889, host = "127.0.0.1", token = "my_r_plots")

  options(device = function(...) {
    httpgd::hgd_new()
  })

  cat("httpgd 已经启动，请在浏览器访问: http://127.0.0.1:8889/live?token=my_r_plots\n")
}
