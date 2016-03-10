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

" Preview colors in source code while editing
Plugin 'ap/vim-css-color'

" Flake8 plugin for Vim
Plugin 'nvie/vim-flake8'

" A vim script to provide CamelCase motion through words
Plugin 'bkad/CamelCaseMotion'

" Enhanced javascript syntax file for Vim
" Plugin 'jelera/vim-javascript-syntax'

" vastly improved JavaScript indentation and syntax support in Vim
Plugin 'pangloss/vim-javascript'

" A vim plugin for highlighting and indenting JST/EJS syntax
Plugin 'briancollins/vim-jst'

" A better JSON for Vim
Plugin 'elzr/vim-json'

" Add additional support for Ansible in VIM
Plugin 'chase/vim-ansible-yaml'

" Syntax for Fountain screenplay files
Plugin 'vim-scripts/fountain.vim'

" Vim/Ruby configuration files
Plugin 'vim-ruby/vim-ruby'

" Ruby on Rails power tools
Plugin 'tpope/vim-rails'

" React JSX syntax highlighting and indenting for vim.
Plugin 'mxw/vim-jsx'

" Syntax for JavaScript libraries
Plugin 'othree/javascript-libraries-syntax.vim'

" Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
Plugin 'hail2u/vim-css3-syntax'

" mustache and handlebars mode for vim
Plugin 'mustache/vim-mustache-handlebars'

call vundle#end() " required
filetype plugin indent on " required

" vim syntax files live in /usr/share/vim/vim73/syntax/
syntax enable    " show syntax highlighting
set cursorline   " highlight current line
set cursorcolumn " highlight current column
set incsearch    " search as characters are entered
set hlsearch     " highlight search matches
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

" move vertically by visual line
nnoremap j gj
nnoremap k gk


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
let g:flake8_show_in_gutter=1 " show flake8 signs in gutter

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
    " \ set autoindent

au BufNewFile,BufRead *.html,*.css,*.scss,*.xml,*.ejs,*.jst
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set expandtab
    " \ set autoindent

au BufNewFile,BufRead *.js
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set expandtab
    " \ set autoindent

let g:jsx_ext_required = 0 " allow JSX syntax in JavaScript files

autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"" au BufNewFile,BufRead *.ejs set filetype=html

set sw=4 " set shiftwidth to four spaces everywhere
set ts=4 " set tabstop to four spaces everywhere
set expandtab " insert spaces whenever tab is pressed

set encoding=utf-8
set clipboard=unnamed " access OS X system clipboard

" autocmd FileType html set sw=2 " set shiftwidth to two spaces in html
" autocmd FileType html set ts=2 " set tabstop to two spaces in html

autocmd! Filetype c,cpp,java,php call CSyntaxAfter()

" enable code folding with the spacebar
nnoremap <space> za

" show docstrings of folded Python classes and functions
let g:SimpylFold_docstring_preview = 1

" turn on all Go syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" used JavaScript libraries
let g:used_javascript_libs = 'jquery,angularjs,react'

" add keymapping to move through CamelCase and snake_case words
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

set showcmd
