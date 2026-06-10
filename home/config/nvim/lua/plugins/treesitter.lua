return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "windwp/nvim-ts-autotag" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    sync_install = true,
    ignore_install = {},
    modules = {},
    incremental_selection = { enable = false },
  },
  -- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
  init = function()
    -- ensure installed
    local ensureInstalled = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "astro",
      "css",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
      "rust",
    }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim
      .iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)

    -- enable highlight & indent
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
