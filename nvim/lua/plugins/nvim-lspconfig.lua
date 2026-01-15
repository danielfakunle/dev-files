local util = require("lspconfig.util")
return {
  "neovim/nvim-lspconfig",
  opts = {
    -- servers = {
    --   tailwindcss = {
    --     root_dir = function(bufnr, on_dir)
    --       local root_files = {
    --         -- Fallback for tailwind v4, where tailwind.config.* is not required anymore
    --         ".git",
    --       }
    --       local fname = vim.api.nvim_buf_get_name(bufnr)
    --       root_files = util.insert_package_json(root_files, "tailwindcss", fname)
    --       root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)
    --       on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
    --     end,
    --   },
    -- },
    setup = {
      tailwindcss = function(_, opts)
        opts.settings = {
          tailwindCSS = {
            classFunctions = { "cva", "cx" },
            experimental = {
              classRegex = {
                { '[cls|className]\\s\\:\\=\\s"([^"]*)' },
              },
            },
            lint = {
              suggestCanonicalClasses = "ignore",
            },
            -- experimental = {
            --   classRegex = {
            --     { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
            --   },
            -- },
          },
        }
        opts.root_dir = function(bufnr, on_dir)
          local root_files = {
            -- Generic
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.cjs",
            "postcss.config.mjs",
            "postcss.config.ts",
            -- Django
            "theme/static_src/tailwind.config.js",
            "theme/static_src/tailwind.config.cjs",
            "theme/static_src/tailwind.config.mjs",
            "theme/static_src/tailwind.config.ts",
            "theme/static_src/postcss.config.js",
            -- Fallback for tailwind v4, where tailwind.config.* is not required anymore
            ".git",
          }
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local monorepo_root = vim.fs.find(
            { "bun.lock", "pnpm-workspace.yaml", "turbo.json", "nx.json", "lerna.json", ".git" },
            { path = fname, upward = true }
          )[1]

          if monorepo_root then
            on_dir(vim.fs.dirname(monorepo_root))
            return
          end
          root_files = util.insert_package_json(root_files, "tailwindcss", fname)
          root_files = util.root_markers_with_field(root_files, { "mix.lock", "Gemfile.lock" }, "tailwind", fname)
          on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
        end
      end,
    },
  },
}
