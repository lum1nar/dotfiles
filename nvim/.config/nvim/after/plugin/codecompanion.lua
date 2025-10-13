require("codecompanion").setup {
    adapters = {
        http = {
            deepseek = require("codecompanion.adapters").extend("deepseek", {
                env = {
                    api_key = function()
                        return os.getenv("DEEPSEEK_API_KEY")
                    end,
                },
                schema = {
                    model = {
                        default = "deepseek-chat", --V3 model
                    },
                },
            }),
        },
    },
    strategies = {
        chat = { adapter = "deepseek" },
        inline = { adapter = "deepseek" },
        agent = { adapter = "deepseek" },
    },
}
