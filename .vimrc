" YounShin Kang
" original script by Douglas Black
" vim-plug {{{
" from vim-plug README.md
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" sensible.vim
Plug 'tpope/vim-sensible'
" vim-airline
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts=1
" vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Solarized vim
Plug 'altercation/vim-colors-solarized'
" Initialize plugin system
call plug#end()
" }}}
" Colors {{{
syntax enable " enable syntax processing
set background=dark
colorscheme solarized
" }}}
" Misc {{{
set ttyfast " faster redraw
set backspace=indent,eol,start
" }}}
" Space & Tabs {{{
set tabstop=4 " 4 space tab
set expandtab " use spaces for tabs
set softtabstop=4 " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI layout {{{
set number " show line number
set showcmd " show command in bottom bar
set nocursorline " highlight current line
set wildmenu
set showmatch " highlight matching parenthesis
" }}}
" Searching {{{
set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight all matches
" }}}
" Folding {{{
" === folding ===
set foldmethod=indent " fold based on indent level
set foldnestmax=10 " max 10 depth
set foldenable " don't fold files by default on open
set foldlevelstart=10 " start with fold level of 1
" }}}
" MacVim {{{
set guioptions-=r
set guioptions-=L
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Custom Functions {{{
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cusor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
