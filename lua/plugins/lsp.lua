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

        local require_installed = { "clangd", "lua_ls", "cmake" }
        require("mason-lspconfig").setup {
            ensure_installed = require_installed
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
                { name = "vsnip" },
                { name = "buffer" }
            })
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false

        local lsp = require("lspconfig")

        for k,v in pairs(require_installed) do
            if v == "cmake" then
                lsp[v].setup { capabilities = capabilities, filetypes = { "cmake", "CMakeLists.txt" } }
            else
                lsp[v].setup { capabilities = capabilities }
            end
        end
    end
}
