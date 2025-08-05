return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim'
  },
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
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }
    }
    require("telescope").load_extension("ui-select")
  end,
}

