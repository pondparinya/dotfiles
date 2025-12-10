return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      preset = "default", -- Use the default keymap preset
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback_to_mappings" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" }, -- Optional: navigate with Ctrl-j/k
      ["<C-k>"] = { "select_prev", "fallback" },
    }
  end,
}
