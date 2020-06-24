set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ganterich/vimcolors'
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
set ruler nonumber
set norelativenumber
set path+=** wildignore=*.dll,*.exe,*.so,*.a wildmenu
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
colorscheme ganterich

set guifont=Liberation\ Mono:h14
if has('win32')
	"set guifont=Consolas:h14
	"set guifont=Liberation\ Mono
	let &makeprg="cd build && cmake --build ."
elseif has('linux')
	"set guifont=Liberation\ Mono:h14
	let &makeprg="cd build && make -j4"
    runtime ftplugin/man.vim
    let g:ft_man_open_mode = 'vert'
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
"nmap <leader>s :w<CR>:so %<CR>
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

nmap <BS> {
vmap <BS> {
nmap <S-h> {
vmap <S-h> {
nmap <CR> }
vmap <CR> }
nmap <S-l> }
vmap <S-l> }

" Window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

xnoremap p pgvy
"tnoremap <Esc> <C-\><C-n>


nmap <leader>+ :NERDTreeToggle<CR>
nmap <leader>- :NERDTreeFocus<CR>

nmap <leader>p :CtrlPMRUFiles<CR>
nmap <leader>b :CtrlPBuffer<CR>

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

"hi! link TODO Comment
hi! link Error Normal

