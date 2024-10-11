return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	opts = {},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
			},
			output_panel = {
				enabled = true,
				open = "botright split | resize 15",
			},
			quickfix = {
				open = false,
			},
		})
	end,

	vim.keymap.set(
		"n",
		"<leader>tc",
		"<cmd>lua require('neotest').run.run()<CR>",
		{ desc = "[T]est [R]un function under [C]ursor" }
	),
	vim.keymap.set(
		"n",
		"<leader>ts",
		"<cmd>lua require('neotest').summary.toggle()<CR>",
		{ desc = "[T]est toggle [S]ummary" }
	),
	vim.keymap.set(
		"n",
		"<leader>tp",
		"<cmd>lua require('neotest').output_panel.toggle()<CR>",
		{ desc = "[T]est toggle output [P]anel" }
	),
	vim.keymap.set(
		"n",
		"<leader>tf",
		"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
		{ desc = "[T]est run in [F]ile" }
	),
}
