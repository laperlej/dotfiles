local detail = false
require("oil").setup({
	keymaps = {
		["gd"] = {
			desc = "Toggle file detail view",
			callback = function()
				detail = not detail
				if detail then
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				else
					require("oil").set_columns({ "icon" })
				end
			end,
		},
	},
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, bufnr)
			return name == ".."
		end,
	},
	git = {
		-- Return true to automatically git add/mv/rm files
		add = function(path)
			return true
		end,
		mv = function(src_path, dest_path)
			return true
		end,
		rm = function(path)
			return true
		end,
	},
})
