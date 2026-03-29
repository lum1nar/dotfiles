local presets = require("markview.presets")

require("markview").setup({
	markdown = {
		headings = presets.headings.slanted,
	},
})

--- You can again call `setup()` to modify
--- the options without changing the preset.
-- require("markview").setup({
-- 	markdown = {
-- 		headings = { shift_width = 1 },
-- 	},
-- })
