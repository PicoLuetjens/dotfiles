return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local languages = {
	      "angular",
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "scss",
        "tsx",
        "typescript",
        "vue",
        "xml",
        "yaml",
      }

      require("nvim-treesitter").setup()

      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
	        "angular",
          "bash",
          "c",
          "cpp",
          "css",
          "go",
          "html",
          "java",
          "javascript",
          "javascriptreact",
          "json",
          "json5",
	        "jsonc",
          "lua",
          "md",
          "markdown",
          "python",
          "rust",
          "scss",
          "typescript",
          "typescriptreact",
          "vue",
          "xml",
          "yml",
          "yaml",
        },

        callback = function()
          vim.treesitter.start()

          -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- vim.wo.foldmethod = "expr"

          vim.bo.indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
