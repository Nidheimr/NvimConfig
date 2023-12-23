return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip"
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup {
            ensure_installed = { "clangd", "lua_ls" }
        }

        local cmp = require("cmp")
        cmp.setup {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" }
            })
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false

        local lsp = require("lspconfig")

        lsp["clangd"].setup { capabilities = capabilities }
        lsp["cmake"].setup { capabilities = capabilities }
        lsp["lua_ls"].setup { capabilities = capabilities }
    end
}
