return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"vrischmann/tree-sitter-templ",
		},
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "templ" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
