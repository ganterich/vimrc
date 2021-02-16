" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'ganterich/vimcolors'
Plugin 'morhetz/gruvbox'
Plugin 'AlessandroYorba/Alduin'
Plugin 'ganterich/cpp.vim'
Plugin 'ganterich/vbnet.vim'
Plugin 'OmniSharp/omnisharp-vim'
"Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on

syntax on
set encoding=utf-8
set incsearch

set nowrap
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

set mps+=<:>

"colorscheme ganterich

set guifont=Liberation\ Mono:h15
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
"nmap <leader>o :copen<CR>
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

omap <S-h> {
map <S-h> {
omap <S-l> }
map <S-l> }

" Inside next
omap in( :<C-u>normal! f(vi(<CR>
omap in{ :<C-u>normal! f{vi{<CR>
omap in[ :<C-u>normal! f[vi[<CR>
omap in< :<C-u>normal! f<vi<<CR>
omap in' :<C-u>normal! f'vi'<CR>
omap in" :<C-u>normal! f"vi"<CR>

" Inside last
omap il( :<C-u>normal! F)vi(<CR>
omap il{ :<C-u>normal! F}vi{<CR>
omap il[ :<C-u>normal! F]vi[<CR>
omap il< :<C-u>normal! F>vi<<CR>
omap il' :<C-u>normal! F'vi'<CR>
omap il" :<C-u>normal! F"vi"<CR>

" Window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

xnoremap p pgvy
tnoremap <Esc> <C-\><C-n>

nmap <leader>+ :NERDTreeToggle<CR>
nmap <leader>- :NERDTreeFocus<CR>

let g:ctrlp_by_filename=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore={
    \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules|obj|bin)$',
    \ 'file': '\v\.(exe|obj|pdb|ipch|swp)',
    \ 'link': ''
    \ }
let g:ctrlp_show_hidden=1
let g:ctrlp_switch_buffer=0


" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_completion_enabled = 1
" }}}

" OmniSharp: {{{
let g:OmniSharp_popup_options = {
    \ 'highlight': 'Normal',
    \ 'padding': [1],
    \ 'border': [1]
    \}
set omnifunc=ale#completion#OmniFunc
augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <F12> <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <S-F12> <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <C-T> <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs nmap <silent> <buffer> <C-Space> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-Space> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs nmap <silent> <buffer> <C-.> <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <C-.> <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END
" }}}

" deoplete: {{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" }}}




autocmd BufNewFile, BufRead *.bas  set ft=vbnet
autocmd BufNewFile, BufRead *.fs   set ft=cpp
autocmd BufNewFile, BufRead *.vs   set ft=cpp
autocmd BufNewFile, BufRead *.vs   set ft=cpp
autocmd BufNewFile, BufRead *.frag set ft=cpp
autocmd BufNewFile, BufRead *.vert set ft=cpp
autocmd BufNewFile, BufRead *.glsl set ft=cpp
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

hi! Normal       gui=NONE guifg=#b3b3a3 guibg=#0e0e0e
"hi! Statement    gui=NONE guifg=#cab975
hi! Statement    gui=NONE guifg=#fecc66
hi! link Type Statement
hi! link Identifier Normal
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
hi! Visual       guibg=#222222
hi! Pmenu        guibg=#000000

"hi link SpecialKey Ignore

" Search
hi! IncSearch guifg=#40cc30 guibg=NONE gui=underline,bold
hi! link Search Incsearch

"hi MatchParen  

hi! Cursor  guifg=white guibg=#ff5500
hi! iCursor guifg=white guibg=#0088ff

au FileType cs hi! link Include Type


"set background=dark
"let g:gruvbox_bold = 0
"let g:gruvbox_contrast_dark="hard"
"colorscheme gruvbox
