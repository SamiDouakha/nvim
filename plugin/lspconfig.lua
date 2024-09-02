-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
-- lspconfig.html.setup {}
lspconfig['bashls'].setup {}
lspconfig['lua_ls'].setup {
        settings = {
                Lua = {
                        diagnostics = { globals = { 'vim' } }
                }
        }
}
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
        -- on_attach = on_attach,
        -- capabilities = capabilities,
        filetypes = {"template", "css", "html", "less", "php", "sass", "scss", "javascript", "javascriptreact", "typescriptreact" },
        --  init_options = {
        --   html = {
        --    options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        --     ["bem.enabled"] = true,
        --  },
        -- },
        --}
})

lspconfig.rust_analyzer.setup {
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
                ['rust-analyzer'] = {},
        },
}


lspconfig.intelephense.setup({
        root_dir = vim.loop.cwd,
        --  on_attach = function(_,bufnr)
        -- Enable (omnifunc) completion triggered by <c-x><c-o>
        --  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        --  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")--, opts)
        -- Here we should add additional keymaps and configuration options.
        --end,

        flags = {
                debounce_text_changes = 150,
        }
})

lspconfig.clangd.setup {}
lspconfig.yamlls.setup {}

lspconfig.gopls.setup({
        settings = {
                gopls = {
                        analyses = {
                                unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                },
        },
})


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                end, opts)
        end,
})
