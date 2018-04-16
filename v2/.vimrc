set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'w0ng/vim-hybrid'

Plugin 'mxw/vim-jsx'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'AutoComplPop'

Plugin 'ervandew/supertab'

Plugin 'raimondi/delimitmate'

Plugin 'alvan/vim-closetag'

Plugin 'haya14busa/incsearch.vim'

Plugin 'sirver/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" basic setup
set shell=/bin/bash
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set omnifunc=syntaxcomplete#Complete
set background=dark
colorscheme hybrid


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" delimitmate
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"

" closetag
let g:closetag_filenames = '*.jsx,*.js,*.html,*.xml'

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsEditSplit="vertical"
