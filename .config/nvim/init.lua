if vim.g.vscode then
  vim.g.mapleader = " "
  vim.keymap.set("n", "<leader>yy", '"+yy')
  vim.keymap.set("v", "<leader>y", '"+y')
  vim.keymap.set("v", "<Tab>", ">gv")
  vim.keymap.set("v", "<S-Tab>", "<gv")
  print("Loaded VS Code config")
else
  require("config.options")
  require("config.lazy")
  require("config.keymaps")
  require("config.autocmds")

  vim.cmd([[colorscheme tokyonight-night]])
end
