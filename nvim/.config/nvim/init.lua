vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.scrolloff = 0

vim.o.wrap = false

require("config.lazy")
require("config.keymaps")
-- require('nebulous').setup()
-- require('nebulous.functions').set_variant('twilight')
vim.cmd([[colorscheme tokyonight-night]])

require("lualine").setup({
	options = { theme = "nebulous" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
	ensured_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.black,
	},
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Automatically select the first item
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
		},
	},
})

require("Comment").setup({})
require("mini.surround").setup()

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true -- Enable line wrap
		vim.opt_local.linebreak = true -- Break lines at word boundaries
		vim.opt_local.list = true -- Hide list characters like `↵` vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})

local lspconfig = require("lspconfig")

local function find_nearest_ltex_dict()
	local path = vim.fn.expand("%:p:h")
	local Path = require("plenary.path")

	while path ~= "/" do
		local dict_path = Path:new(path) / ".ltex" / "dictionary.en-US.txt"
		if dict_path:exists() then
			return dict_path:readlines()
		end
		path = Path:new(path):parent().filename
	end
	return {} -- fallback: no dictionary found
end

lspconfig.ltex.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		ltex = {
			dictionary = { ["en-US"] = find_nearest_ltex_dict() },
			disabledRules = {
				["en-US"] = { "PHRASE_REPETITION" },
			},
		},
	},
})
