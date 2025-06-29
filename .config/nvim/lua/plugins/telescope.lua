return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      defaults = {
        file_ignore_patterns = {
          "build/",          -- exclude build directories
          "%.o$",            -- exclude object files
          "%.pyc$",          -- exclude Python bytecode
          "node_modules/",   -- common exclusion
        },
      },
    }
  end,
}

