local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- Latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colour
    { "luisiacc/gruvbox-baby",
        init = function()
            vim.cmd(":colorscheme gruvbox-baby")
            vim.cmd(":hi ColorColumn guibg=#444444")
        end
    },

    -- Navigation
    { "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" } },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP
    { "williamboman/mason-lspconfig", dependencies = {
        "williamboman/mason.nvim", "neovim/nvim-lspconfig"
    } },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    -- Other language support
    "tikhomirov/vim-glsl", -- highlighting
    { "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
        ft = { "markdown" }, build = function() vim.fn["mkdp#util#install"]() end },

    -- Git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim"
})
