" {{{ Sensible Defaults 
set mouse=a
set clipboard+=unnamedplus " Requires xclip
set foldmethod=marker
set autoread
" }}}

" Keybindings {{{
let mapleader=" "
nnoremap q :qa<CR>
nnoremap <leader>w <C-w>w
nnoremap <leader>e :Ex!<CR>
nnoremap <leader>v :Vex!<CR>
nnoremap <leader>f za
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>
" }}}

" Plugins {{{
let plug_install = 0
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent execute '!curl -fL --create-dirs -o ' . autoload_plug_path . 
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'dylanaraps/wal.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-commentary'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sirver/ultisnips', { 'do': 'pip3 install --user neovim' }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ap/vim-css-color'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/goyo.vim'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install
" }}}

" Vim Close Tag {{{
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
" }}}

" CocConfig :{{{
inoremap <silent><expr> <C-n> coc#refresh()
set updatetime=300
command! -nargs=0 Format :call CocAction('format')
nnoremap <leader>p :Format<cr>
" }}}

" Colors {{{
colorscheme wal
"}}}
