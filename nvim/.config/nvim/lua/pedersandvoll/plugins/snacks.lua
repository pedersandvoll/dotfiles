return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        dashboard = {
            sections = {
                {
                    section = "terminal",
                    cmd =
                    "chafa ~/Pictures/wallpapers/totoro.jpeg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
                    height = 17,
                    padding = 1,
                },
                {
                    pane = 2,
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
        },
    }
}
