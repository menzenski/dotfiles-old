set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" lean & mean status/tabline for vim that's light as air
Plugin 'bling/vim-airline'

" precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized'

" Python syntax highlighting script for Vim
Plugin 'hdima/python-syntax'

" a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" enable an auto-close char feature for ( [ {
Plugin 'Townk/vim-autoclose'

" using the jedi autocompletion library for vim.
" Plugin 'davidhalter/jedi-vim'

" implement TextMate snippets feature in Vim.
" snippets live in ~/.vim/bundle/snipmate.vim/snippets
Plugin 'msanders/snipmate.vim'

" better whitespace highlighting for Vim.
Plugin 'ntpeters/vim-better-whitespace'

" Markdown support for vim
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Operator highlighting for C-like languages
Plugin 'vim-scripts/cSyntaxAfter'

" An up-to-date jinja2 syntax file
Plugin 'Glench/Vim-Jinja2-Syntax'
" there's also this one, is it any better?
" Repository for Jinja support in vim.
" Plugin 'mitsuhiko/vim-jinja'

" Go development plugin for Vim
Plugin 'fatih/vim-go'

" Vim runtime files for Swift
Plugin 'keith/swift.vim'

" Vim plugin that uses clang for completing C/C++ code
Plugin 'Rip-Rip/clang_complete'

" iOS plugin for Vim
Plugin 'eraserhd/vim-ios'

" Vim plugin for Cocoa/Objective-C development
Plugin 'msanders/cocoa.vim'

" Vim python-mode, PyLint, Rope, Pydoc, breakpoints from box
" Plugin 'klen/python-mode'

" No-BS Python code folding for Vim
" Plugin 'tmhedberg/SimpylFold'

" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'

" A plugin of NERDTree showing git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end() " required
filetype plugin indent on " required

" vim syntax files live in /usr/share/vim/vim73/syntax/
syntax enable " show syntax highlighting
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
let g:airline_powerline_fonts = 1 " show nice pointy symbols


" toggle dark/light theme
call togglebg#map("<F5>")

set splitbelow " :sv opens a new file below the current file
" set splitright " :vs opens a new file to the right of the current file

" navigate between splits with Ctrl + directional key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open NERDTree with Ctrl+n
map <C-N> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set colorcolumn=79 " show 79-character margin (79 is per PEP8)
set number " show line numbers
set laststatus=2 " always show status bar
set so=999 " set scrolloff to 999 lines: always keep the cursor in center

let python_highlight_all = 1 " show all possible Python syntax highlighting
let python_version_2 = 1
" autocmd FileType python set sw=4 " set shiftwidth to four spaces in Python
" autocmd FileType python set ts=4 " set tabstop to four spaces in Python
" autocmd FileType python set sts=4 " set softtabstop to four spaces in Python

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    " \ set textwidth=79

au BufNewFile,BufRead *.tex
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set expandtab
    \ set autoindent

set sw=4 " set shiftwidth to four spaces everywhere
set ts=4 " set tabstop to four spaces everywhere
set expandtab " insert spaces whenever tab is pressed

set encoding=utf-8
set clipboard=unnamed " access OS X system clipboard

autocmd FileType html set sw=2 " set shiftwidth to two spaces in html
autocmd FileType html set ts=2 " set tabstop to two spaces in html

autocmd! Filetype c,cpp,java,php call CSyntaxAfter()

" enable code folding with the spacebar
nnoremap <space> za

" show docstrings of folded classes and functions ( 0 = don't show them )
let g:SimpylFold_docstring_preview = 1

set showcmd
