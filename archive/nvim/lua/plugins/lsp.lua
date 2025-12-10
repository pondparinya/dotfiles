return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Lua
        "stylua",
        "luacheck",

        -- Shell
        "shellcheck",
        "shfmt",
        "bash-language-server",
        "beautysh",

        -- Go
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",

        -- Web/JS
        "prettier",

        -- YAML/Docker
        "yaml-language-server",
        "hadolint",
      })
    end,
  },
}
