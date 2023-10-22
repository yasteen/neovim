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

vim.g.mapleader = " "
require("lazy").setup({
    -- Colour
    { "rose-pine/neovim", name = "rose-pine",
        init = function() vim.cmd(":colorscheme rose-pine") end },

    -- Navigation
    { "nvim-telescope/telescope.nvim", tag = "0.1.0",
        dependencies = { "nvim-lua/plenary.nvim" } },
    { "theprimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP
    { "williamboman/mason-lspconfig", dependencies = {
        "williamboman/mason.nvim", "neovim/nvim-lspconfig"
    } },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    "tpope/vim-fugitive"
})
