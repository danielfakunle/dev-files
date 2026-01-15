return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notification = {
      wo = { wrap = true }, -- Wrap notifications
    },
    styles = {
      float = {
        backdrop = false,
      },
    },
    dashboard = {
      preset = { header = [[Lazyvim :: by Daniel]] },
      sections = {
        { section = "header" },
        {
          section = "keys",
          indent = 1,
          padding = 1,
        },
        { section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
        { section = "startup" },
      },
    },
  },
}
