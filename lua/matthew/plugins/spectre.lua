return {
  'nvim-pack/nvim-spectre',
  opts = {},
  config = function()
    local spectre = require('spectre')
    vim.keymap.set('n', '<leader>sp', spectre.toggle, { desc = 'Open spectre' })
  end
}
