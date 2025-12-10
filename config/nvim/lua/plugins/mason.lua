return {
  -- tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Shell scripts
        "shellcheck",
        "shfmt",
        "bash-language-server",
        "beautysh",
      })
    end,
  },
}
