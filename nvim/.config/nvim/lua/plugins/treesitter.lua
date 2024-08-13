return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',  -- This will run the :TSUpdate command after installation
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "rust", "c_sharp", "help", "bash", "fish" }, -- Add languages that you use
      sync_install = false,
      auto_install = true,
      ignore_install = { "help" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
