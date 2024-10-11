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
			quickfix = false,
		})
	end,

	vim.keymap.set("n", "<leader>tr", "<cmd>lua require('neotest').run.run()<CR>", { desc = "[T]est [R]un" }),
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
		"<leader>te",
		"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
		{ desc = "[T]est [R]un in file" }
	),
}
