" YounShin Kang
" original script by Douglas Black
" Colors {{{
syntax enable " enable syntax processing
colorscheme badwolf
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
    let @/=s
    call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
