" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'ganterich/vimcolors'
Plugin 'ganterich/cpp.vim'
call vundle#end()
filetype plugin indent on

syntax on
set incsearch

set wrap
set tabstop=4 shiftwidth=4 expandtab smarttab
set linebreak
set hlsearch ignorecase
set backspace=indent,eol,start
set ruler nonumber norelativenumber
"set path+=** wildignore=*.dll,*.exe,*.so,*.a wildmenu
set wildignore=*.dll,*.exe,*.so,*.a wildmenu
set autoread
set cino=l1
set complete-=i

set scrolloff=5
set termguicolors
set nocursorline

set t_md= t_ut= guioptions= belloff=all mouse=a

set guicursor=n-v-c-i:block-Cursor
set guicursor+=i:iCursor
set guicursor+=n-v-c-i:blinkon0

set background=dark
"colorscheme ganterich

set guifont=Liberation\ Mono:h14
if has("win32")
	"set guifont=Consolas:h14
	let &makeprg="cd build && cmake --build ."
elseif has('linux')
	let &makeprg="cd build && make -j4"
    runtime ftplugin/man.vim
    let g:ft_man_open_mode="vert"
endif

let mapleader=" "
nmap <leader>h :noh<CR>
vnoremap // y/<C-R>"<CR>

nmap <leader>w :w<CR>
nmap <leader>W :wa<CR>
nmap <leader>e :e<CR>
nmap <leader>q :q<CR>
nmap <leader>s :sp<CR>
nmap <leader>v :vsp<CR>
nmap <leader>z za
nmap <leader>o :copen<CR>
nmap <leader>m :make<CR>
nmap <leader>n :cn<CR>
nmap <leader>p :cN<CR>
nmap <leader>i :sp<CR>gg:res 10<CR>}}

nmap <S-k> i<CR><Esc>
nmap <F5> :make<CR>

if has('win32')
	nmap <leader>c :vsp ~/_vimrc<CR>
    nmap <leader>t :term ++close powershell<CR>
    nmap <leader>T :vert term ++close powershell<CR>
else
	nmap <leader>c :vsp ~/.vimrc<CR>
    nmap <leader>t :terminal<CR>
    nmap <leader>T :vert terminal<CR>
end

imap <C-BS> <C-W>
imap <C-S-BS> <C-U>
imap <C-P> <C-R>0
inoremap <C-e> <C-d>
inoremap <C-d> <Esc>lDa

nmap Y y$

omap <BS> {
omap <S-h> {
omap <CR> }
omap <S-l> }

" Window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

xnoremap p pgvy
"tnoremap <Esc> <C-\><C-n>


nmap <leader>+ :NERDTreeToggle<CR>
nmap <leader>- :NERDTreeFocus<CR>

let g:ctrlp_by_filename=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore={
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules)$',
    \ 'file': '\v\.(exe|obj|pdb|ipch)',
    \ 'link': ''
    \ }
let g:ctrlp_show_hidden=1
let g:ctrlp_switch_buffer=0






autocmd BufNewFile, BufRead *.bas set ft=vbnet
autocmd FileType typescript set shiftwidth=2 | set tabstop=2 | set expandtab






"""""""""""""""""
"     COLORS
"""""""""""""""""
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
"let g:colors_name = "ganterich"

hi! Normal       gui=NONE guifg=#ccccbc guibg=#1a1919
hi! Statement    gui=NONE guifg=#cab975
hi! link Type Statement
hi! link Identifier Constant
hi! Constant    gui=NONE guifg=#729a59
hi! String      gui=NONE guifg=#496f6f
hi! Comment     gui=NONE guifg=#775555
hi! Special     gui=NONE guifg=#87AFAF
hi! PreProc     gui=NONE guifg=#a274c5
hi! Title       gui=NONE guifg=#FFFFFF
hi! link Error Normal
hi! Directory   gui=NONE guifg=#5F87AF
hi! Underlined  gui=NONE gui=underline 

hi! Function guifg=#d06749

hi! Todo guibg=NONE guifg=#bb4444
hi! Note guibg=NONE guifg=#bb8888

hi! link Error Normal

"Furniture
hi! VertSplit    gui=NONE guifg=#202020 guibg=#202020
hi! StatusLine   gui=NONE guifg=#d1c4c4 guibg=#202020
hi! StatusLineNC gui=NONE guifg=#d0c0c0 guibg=#202020
hi! Visual        guibg=#222222

"hi link SpecialKey Ignore

" Search
hi! IncSearch guifg=#40cc30 guibg=NONE gui=underline,bold
hi! link Search Incsearch

"hi MatchParen  

hi! Cursor  guifg=white guibg=#ff5500
hi! iCursor guifg=white guibg=#0088ff


