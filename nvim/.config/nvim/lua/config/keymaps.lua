vim.g.mapleader = ' '

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find File" })
vim.keymap.set('n', '<leader>fF', function() builtin.lsp_document_symbols({ symbols = { 'function', 'method' } }) end,
  { desc = "Find Function" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {desc = "Find Errors"})

vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Go to references" })
vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = "Go to implementation" })
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = "Rename Variable" })
vim.keymap.set('n', '<leader>gq', vim.lsp.buf.format, { desc = "Format Buffer" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })

vim.keymap.set("n", "<leader>yy", '"+yy')
vim.keymap.set("v", "<leader>y", '"+y')

vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float(0, {scope="line"}) end)

