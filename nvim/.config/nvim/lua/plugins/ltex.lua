return {
	"barreiroleo/ltex_extra.nvim",
	ft = { "markdown", "tex" },
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
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
			return {}
		end

		lspconfig.ltex.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			settings = {
				ltex = {
					dictionary = { ["en-US"] = find_nearest_ltex_dict() },
					disabledRules = {
						["en-US"] = { "PHRASE_REPETITION" },
					},
				},
			},
		})
	end,
}