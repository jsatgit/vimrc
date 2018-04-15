" =================== Vundle Begin =================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'

Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-surround'

Plugin 'bling/vim-airline'

" Plugin 'Valloric/YouCompleteMe'

Plugin 'SirVer/ultisnips'

Plugin 'easymotion/vim-easymotion'

Plugin 'majutsushi/tagbar'

Plugin 'reedes/vim-lexical'

Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on
" ================== Vundle End ==================

" ================== Custom Config =================

" colour scheme
syntax enable
set background=dark
colorscheme solarized

" linenumber
set number

" indents
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" highlight search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ============= Plugin Options =============

" nerd tree
map <C-n> :NERDTreeToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_include_dirs = ['/usr/local/include']
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

let g:syntastic_tex_checkers = [] 
let g:syntastic_javascript_checkers = ['eslint'] 

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
nnoremap gt :YcmCompleter GoTo<CR>

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
  
" UltiSnips with YouCompleteMe 
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Easy motion search highlighting 
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Control p searches for current directory only
let g:ctrlp_working_path_mode = 2 
" Control p custom searcher
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Lexical
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_ca']
let g:lexical#spell_key = '<leader>s'

" latex
map <C-l> :!ltxopen %<CR><CR>
