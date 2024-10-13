return {
	"wet-sandwich/hyper.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>ho", require("hyper.view").show, { desc = "[H]yper [O]pen" })
	end,
}
