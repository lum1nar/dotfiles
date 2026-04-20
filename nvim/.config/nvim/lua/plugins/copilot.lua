return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = false,
			hide_during_completion = false,
			debounce = 15,
			trigger_on_accept = false,
			keymap = {
				accept = "<Tab>",
				accept_word = false,
				accept_line = false,
				next = "<C-s>",
				prev = "<M-[>",
				dismiss = "<C-]>",
				toggle_auto_trigger = false,
			},
		},
		nes = {
			enabled = false, -- requires copilot-lsp as a dependency
			auto_trigger = false,
			keymap = {
				accept_and_goto = false,
				accept = false,
				dismiss = false,
			},
		},
		auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
	},
}
