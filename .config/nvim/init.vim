" {{{ Sensible Defaults 
set mouse=a
set clipboard+=unnamedplus " Requires xclip
set foldmethod=marker
set autoread
set backupcopy=yes
" }}}

" Keybindings {{{
let mapleader=" "
nnoremap q :qa<CR>
nnoremap <leader>e :Ex!<CR>
nnoremap <leader>v :Vex!<CR>
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>
nnoremap <C-f> za
nnoremap <C-w> <C-w>w
nnoremap <C-g> <ESC>
cnoremap <C-g> <ESC>
inoremap <C-g> <ESC>
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
    Plug 'alvan/vim-closetag'
    Plug 'ap/vim-css-color'
    Plug 'dense-analysis/ale'
    Plug 'dylanaraps/wal.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/goyo.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/jsonc.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'sirver/ultisnips'
    Plug 'tpope/vim-commentary'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install
" }}}

" Vim Close Tag {{{
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
" }}}

" UltiSnips {{{
" let g:python3_host_prog = "/usr/bin/python3"
" }}}

" CocConfig :{{{
inoremap <silent><expr> <C-n> coc#refresh()
set updatetime=300
command! -nargs=0 Format :call CocAction('format')
nnoremap <leader>p :Format<cr>
" }}}

" jsonc {{{
augroup jsonc_autocmd
  autocmd!
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
  autocmd BufRead,BufNewFile rush.json set filetype=jsonc
  autocmd BufRead,BufNewFile command-line.json set filetype=jsonc
augroup END
"}}}

" env {{{
augroup env_autocmd
  autocmd!
  autocmd BufRead,BufNewFile .env.local set filetype=sh
  autocmd BufRead,BufNewFile .env.development set filetype=sh
  autocmd BufRead,BufNewFile .env.production set filetype=sh
  autocmd BufRead,BufNewFile .env set filetype=sh
augroup END

" }}}

" Colors {{{
colorscheme wal
"}}}
