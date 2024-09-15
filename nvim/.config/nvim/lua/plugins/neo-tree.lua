return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- If you want icons for diagnostic errors, you'll need to define them somewhere:
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			popup_border_style = "rounded",
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_hidden = true,
					hide_by_name = {
						-- add extension names you want to explicitly exclude
						".git",
						"node_modules",
						".DS_Store",
						-- 'thumbs.db',
					},
					never_show = {},
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle float<CR>", {})
		vim.keymap.set("n", "<leader>E", ":Neotree filesystem toggle right<CR>", {})
	end,
}
