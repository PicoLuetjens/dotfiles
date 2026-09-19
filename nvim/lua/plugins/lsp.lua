return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },

    config = function()
      local servers = {
        "lua_ls",
        "basedpyright",
        "ts_ls",
        "vue_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "gopls",
        "lemminx",
        "marksman",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = true,
      })
    end,
  },
}
