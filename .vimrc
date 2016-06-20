" Matt Menzenski
" Vundle Plugins {{{
set nocompatible                " be iMproved, required
filetype off                    " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
" Plugin 'davidhalter/jedi-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/cSyntaxAfter'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'fatih/vim-go'
Plugin 'keith/swift.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'eraserhd/vim-ios'
Plugin 'msanders/cocoa.vim'
" Plugin 'klen/python-mode'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ap/vim-css-color'
Plugin 'nvie/vim-flake8'
Plugin 'bkad/CamelCaseMotion'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'elzr/vim-json'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-scripts/fountain.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Shutnik/jshint2.vim'
Plugin 'dag/vim2hs'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'easymotion/vim-easymotion'
Plugin 'groenewege/vim-less'
Plugin 'tfnico/vim-gradle'
Plugin 'mhinz/vim-startify'
Plugin 'farfanoide/vim-kivy'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'
call vundle#end()               " required
filetype plugin indent on       " required
" }}}
" Colors, Highlighting, Visuals {{{
syntax enable                   " show syntax highlighting
set cursorline                  " highlight current line
set cursorcolumn                " highlight current column
set colorcolumn=79              " show 79-character margin
set number                      " show line numbers
set showcmd                     " show command in status bar
set laststatus=2                " always show status bar
set so=999                      " try to always keep cursor in center
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
let g:airline_powerline_fonts=1 " show nice pointy Powerline symbols
set splitbelow                  " :sv opens a new file below current file
" }}}
" Searching {{{
set incsearch                   " search as characters are entered
set hlsearch                    " highlight search matches
" }}}
" Foldings {{{
set foldmethod=indent           " fold based on indentation level
set foldnestmax=10              " maximum fold depth of ten levels
set foldenable                  " don't fold files by default on open
set foldlevelstart=10           " start with fold level of 1
" }}}
" Key Remaps and Commands {{{
call togglebg#map("<F5>")       " toggle dark/light theme with F5 key
" navigate between splits with Ctrl + directional key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" enable code folding with the spacebar
nnoremap <space> za
" add keymapping to move through CamelCase and snake_case words
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
" search for the current visual selection
vnoremap // y/<C-R>"<CR>
" treat uppercase W and Q like their lowercase versions
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>
" }}}
" NERDTree {{{
" open NERDTree with Ctrl + N
map <C-N> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" Language-Specific Configuration {{{
" Python {{{
let python_highlight_all=1      " show all possible Python syntax highlighting
let python_version_2=1          " default to Python 2
let g:flake8_show_in_gutter=1   " show Flake8 signs in left gutter
let g:SimpylFold_docstring_preview=1 " show docstrings of folded class/func
" use colorscheme colors to highlight Flake8 markers
highlight link Flake8_Error Error
highlight link Flake8_Warning WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming WarningMsg
highlight link Flake8_PyFlake WarningMsg
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
autocmd BufWritePost *.py call Flake8() " lint every time file is written
" }}}
" TeX {{{
au BufNewFile,BufRead *.tex
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
" }}}
" HTML, CSS, XML {{{
au BufNewFile,BufRead *.html,*.css,*.scss,*.xml,*.ejs,*.jst,*.nunjucks,*.njk
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
" }}}
" JavaScript {{{
" specify libraries for syntax highlighting
let g:used_javascript_libs = 'jquery,angularjs,react'
au BufNewFile,BufRead *.js
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
let g:jsx_ext_required=0        " allow JSX syntax in JavaScript files
" }}}
" Ruby {{{
au BufNewFile,BufRead *.rb
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
" }}}
" Golang {{{
" turn on all Go syntax highlighting
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_interfaces=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
" }}}
" C-like languages {{{
autocmd! Filetype c,cpp,java,php call CSyntaxAfter()
" }}}
" }}}
" General Configuration {{{
set sw=4                        " set shiftwidth to four spaces
set ts=4                        " set tabstop to four spaces
set expandtab                   " insert spaces when tab is pressed
set modelines=1                 " tell Vim to check the last line of this file
let mapleader=","               " use comma as <leader>
set hidden                      " hide buffers instead of closing them
set encoding=utf8
" edit vimrc with ,ev
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" reload vimrc with ,sv
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
