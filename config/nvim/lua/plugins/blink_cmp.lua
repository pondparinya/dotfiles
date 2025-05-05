return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      preset = "default", -- Use the default keymap preset
      ["<CR>"] = { "accept", "fallback" },
      ["<C-e>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
      ["<Tab>"] = { "select_next", "fallback_to_mappings" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    }
  end,
}
