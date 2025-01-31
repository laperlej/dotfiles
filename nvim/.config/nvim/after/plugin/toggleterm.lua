require("toggleterm").setup({
	direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = "false" })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end
