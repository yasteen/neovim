local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/vimfiles/plugged')

-- Git
-- Plug 'tpop/vim-fugitive'
-- Plug 'airblade/vim-gitgutter'

-- Trees | Navigation
-- Plug 'preservim/nerdtree'
-- Plug 'easymotion/vim-easymotion'


-- Fancy Shit
Plug 'bling/vim-airline'
-- Plug 'vimsence/vimsence' -- Does not work
-- Plug 'andweeb/presence.nvim' -- Also does not work

-- Languages / Syntax
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'

-- C/C++
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'

-- Golang
-- Plug 'fatih/vim-go'

-- Json
-- Plug 'elzr/vim-json'

vim.call('plug#end')

