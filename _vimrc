set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'ganterich/vimcolors'
"Plugin 'ganterich/cpp.vim'
"call vundle#end()
"filetype plugin indent on

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
"colorscheme ganterich

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


"nmap <leader>+ :NERDTreeToggle<CR>
"nmap <leader>- :NERDTreeFocus<CR>

"nmap <leader>p :CtrlPMRUFiles<CR>
"nmap <leader>b :CtrlPBuffer<CR>

"let g:ctrlp_by_filename=1
"let g:ctrlp_working_path_mode=0
"let g:ctrlp_custom_ignore={
    "\ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules)$',
    "\ 'file': '\v\.(exe|obj|pdb|ipch)',
    "\ 'link': ''
    "\ }
"let g:ctrlp_show_hidden=1
"let g:ctrlp_switch_buffer=0


autocmd BufNewFile, BufRead *.bas set ft=vbnet
autocmd FileType typescript set shiftwidth=2 | set tabstop=2 | set expandtab

"hi! link TODO Comment
hi! link Error Normal


set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "ganterich"

hi! Normal       gui=NONE guifg=#d0c0c0 guibg=#1a1919
hi! Statement    gui=NONE guifg=#cab975
hi! link Type Statement
hi! link Identifier Constant
hi! Constant    gui=NONE guifg=#729a59
"hi! String      gui=NONE guifg=#dd9999
hi! String      gui=NONE guifg=#496f6f
hi! Comment     gui=NONE guifg=#775555
hi! Special     gui=NONE guifg=#87AFAF
hi! PreProc     gui=NONE guifg=#a274c5
hi! Title       gui=NONE guifg=#FFFFFF
hi! link Error Normal
hi! Directory   gui=NONE guifg=#5F87AF
hi! Underlined  gui=NONE gui=underline 

hi! Function guifg=#d06749

hi! Todo guibg=NONE guifg=#ff4444

"Furniture
hi VertSplit    cterm=NONE ctermbg=235 ctermfg=0 guibg=#acb0a9 guifg=#2e3436
hi Visual       cterm=NONE ctermbg=238 guibg=#222222

hi link SpecialKey Ignore

"Tabs
hi TabLine ctermbg=233 ctermfg=242 cterm=NONE
hi TabLineSel ctermbg=235 ctermfg=248 cterm=NONE
hi TabLineFill ctermbg=233 ctermfg=246 cterm=NONE

" Search
hi IncSearch  cterm=NONE ctermbg=243 ctermfg=214
hi Search     cterm=NONE ctermbg=58 ctermfg=NONE

"Folding
hi FoldColumn cterm=NONE ctermbg=235 ctermfg=243
hi Folded     cterm=NONE ctermbg=234 ctermfg=243

"Diff
hi DiffDelete cterm=NONE ctermbg=233 ctermfg=233
hi DiffAdd    cterm=NONE ctermbg=237 
hi DiffText   cterm=NONE ctermbg=240 ctermfg=15
hi DiffChange cterm=NONE ctermbg=238
hi DiffRemoved ctermbg=234 ctermfg=124
hi DiffAdded ctermbg=237 ctermfg=76

hi MatchParen cterm=NONE ctermbg=235 ctermfg=227

"popup menus
hi Pmenu      cterm=NONE ctermbg=241 ctermfg=248 guibg=#626262 guifg=#A8A8A8
hi PmenuSel   cterm=NONE ctermbg=246 ctermfg=255 guibg=#949494 guifg=#ffffff
hi PmenuSbar  cterm=NONE ctermbg=240 ctermfg=236 guibg=#585858 guifg=#303030
hi PmenuThumb cterm=NONE ctermbg=246 ctermfg=240 guibg=#949494 guifg=#585858

" Sepll errors
if has("spell")
    hi SpellBad cterm=NONE ctermbg=52  
    hi SpellLocal cterm=NONE ctermbg=234
    hi SpellCap ctermbg=235 ctermfg=4 cterm=underline
endif

" Python
hi link pythonFunction Title
hi LongLines ctermbg=232
hi link pythonClass Title
hi pythonSpaceError ctermbg=234

" NeoMake errors
" Turn off the red (keep the underline)
hi NeomakeErrorDefault ctermfg=None






hi! Cursor  guifg=white guibg=#ff5500
hi! iCursor guifg=white guibg=#0088ff
