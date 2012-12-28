scripte utf-8

" Language configuration

set nocompatible
call pathogen#infect()
syntax enable
set background=dark
set nu
set ai
set bs=indent,eol,start
set cindent
set smartindent
set ruler
set ts=8
set sts=2
set et
set history=999
set foldmethod=marker

set hlsearch
set sc
set magic
set sol
"set sel=exclusive
set hls
set nows
set scs
set ls=2
set wmnu

set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs2-le

let NERDShutUp=1
set t_Co=256

colorscheme solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif

filetype plugin indent on

filet on

runtime! macros/matchit.vim

augroup rubies
  autocmd!
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
