return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return str:sub(1, 1)
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				-- section_separators = { left = "█", right = "█" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { filename, "filetype" },
				lualine_z = { "location" },
			},
			extensions = { "fugitive" },
		})
	end,
}
