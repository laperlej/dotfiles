vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

require("avante").setup()
require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<C-j>",
		clear_suggestion = "<C-]>",
		accept_word = "<Tab>",
	},
})

require("parrot").setup({
	-- Providers must be explicitly added to make them available.
	providers = {
		anthropic = {
			api_key = os.getenv("ANTHROPIC_API_KEY"),
		},
		openai = {
			api_key = os.getenv("OPENAI_API_KEY"),
		},
	},
	online_model_selection = true,
})
