return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "gofmt", "goimports" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      yaml = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
    },
  },
}
