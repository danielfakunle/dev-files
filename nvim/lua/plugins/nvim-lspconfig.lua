return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      tailwindcss = function(_, opts)
        local util = require("lspconfig.util")
        opts.settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
              },
            },
          },
        }
        opts.root_dir = util.root_pattern(
          ".git",
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts"
        )
      end,
    },
  },
}
