return {
  'folke/trouble.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = {
    vim.keymap.set('n', '<leader>el', vim.cmd.TroubleToggle)
  }
}
