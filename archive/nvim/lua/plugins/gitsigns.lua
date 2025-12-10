return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "<leader>ghr", gs.reset_hunk, "Git Reset hunk")
        map("v", "<leader>ghr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Git Reset hunk (Visual)")
        map("n", "<leader>ghR", gs.reset_buffer, "Git Reset buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Git Preview hunk")
      end,
    },
  },
}
