--local lsps = {"ts_ls","pyright","clangd"};


return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

			--lspconfig[server].setup({capabilities = capabilities})
			lspconfig.ts_ls.setup({capabilities = capabilities})
			lspconfig.pyright.setup({capabilities = capabilities})
			lspconfig.clangd.setup({capabilities = capabilities})
			lspconfig.lua_ls.setup({capabilities = capabilities})
			lspconfig.rust_analyzer.setup({capabilities = capabilities})


      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
    end,
  },
}
