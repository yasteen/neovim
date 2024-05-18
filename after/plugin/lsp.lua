local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local default_setup = function(server)
    lspconfig[server].setup({})
end



-------------------------
--  LSP CONFIGURATION  --
-------------------------
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
    },
    handlers = { default_setup },
})

-- INDIVIDUAL LSP CONFIG
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
})

lspconfig.eslint.setup({})
lspconfig.tsserver.setup({})
lspconfig.gopls.setup({})
lspconfig.clangd.setup({})



--------------------
--  KEY-BINDINGS  --
--------------------
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }

        -- Jump to symbols
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)

        -- Diagnostics
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)

        -- Some other shit?
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        -- Refactor and change
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        -- other mappings from lspconfig
        --  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    end
})



-------------------------
--  COMPLETION CONFIG  --
-------------------------
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        -- Enter key confirms completion item
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- Ctrl + space triggers completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})



--------------------
-- FORMAT ON SAVE --
--------------------
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format files on write (based on filetype) using default formatter",
    group = vim.api.nvim_create_augroup("fmt_on_save", { clear = true }),
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "go" then
            vim.lsp.buf.format()
        end
    end
})
