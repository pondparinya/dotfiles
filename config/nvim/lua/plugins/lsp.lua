return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "luacheck",
        "shellcheck",
        "shfmt",
        "gopls",
        "hadolint",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "prettier",
        "yaml-language-server",
        "beautysh",
        "bash-language-server",
      })
    end,
  },
}
