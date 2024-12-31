" ░░░██╗░░░██╗██╗███╗░░░███╗██████╗░░█████╗░
" ░░░██║░░░██║██║████╗░████║██╔══██╗██╔══██╗
" ░░░╚██╗░██╔╝██║██╔████╔██║██████╔╝██║░░╚═╝
" ░░░░╚████╔╝░██║██║╚██╔╝██║██╔══██╗██║░░██╗
" ██╗░░╚██╔╝░░██║██║░╚═╝░██║██║░░██║╚█████╔╝
" ╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░

"General Editor Setting
set autoread                    " Auto reload file after external commandset relativenumber
set binary                      " Enable binary support

set number relativenumber                       " set no relativenumber
set ttyfast                     " Fast terminal

set foldmethod=syntax

" Move between open buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

syntax on

set nohlsearch
set noerrorbells

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cindent  
set smartindent

set nowrap
set incsearch
set scrolloff=6
set backspace=indent,eol,start

set encoding=utf-8

set nocompatible
set belloff=all
set signcolumn=yes

set mouse=a             "mouse support
set title               "File title
set ttimeoutlen=0       "time to run command
set wildmenu            "adv. menu for auto-comp.
set splitbelow splitright

syntax enable

set spelllang=en_gb
set spellfile=~/.vim/spell.en.utf-8.add

"Cursor Style on diff mode(Insert & Normal)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Esc to jj
imap jj <Esc>
inoremap {<CR> {<CR>}<Esc>O
"space to za for toggling folds
nnoremap <Space> za 

"Extra file
set noundofile
set noswapfile
set nobackup

"Remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"Append template to new Files
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
autocmd BufNewFile *.go 0r ~/.vim/templates/init.go
autocmd BufNewFile *.rs 0r ~/.vim/templates/init.rs
autocmd BufNewFile *.c 0r ~/.vim/templates/init.c

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-bufferline' "show the list of buffers in the command bar
Plugin 'delimitMate.vim' "completion for quotes, parens, brackets

Plugin 'ziglang/zig.vim'

"https://www.youtube.com/watch?v=7-dfpQ5sexk
"do it like this else just "yarn install" wont work
"yarn install --ignore-engines" will work
Plugin 'neoclide/coc.nvim' "conquer of completion
Plugin 'tpope/vim-commentary' " for comments

"Navigation with tmux support
Plugin 'christoomey/vim-tmux-navigator'

"solarized
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
set termguicolors
colorscheme gruvboxhard
"let g:solarized_termcolors=256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"

" General shotcut for compiling and running
" you need make.sh in computer to work 
set makeprg=make.sh\ %:r
autocmd filetype cpp nnoremap <F5> :w <bar> Make <CR> 
autocmd filetype cpp nnoremap <F6> :vertical terminal ++shell ++cols=40 ./%:r.out<CR>
autocmd filetype cpp nnoremap <F8> :!./%:r.out<CR>

"CodeForces specific
nnoremap <F9> :vertical terminal ++shell ++cols=40 ru t<CR>
"nnoremap <F12> :vertical terminal ++shell ++cols=40 cfsubmit.sh<CR>

"Competatie Companion
"nnoremap <F10> :terminal ++shell ++rows=12 egor test<CR>
"nnoremap <F11> :terminal ++shell ++rows=2 egor copy<CR>

"vim utility
nnoremap <F2> :q <CR>
"ctrl + t -> terminal
nnoremap <c-t> :terminal <CR>

"c++ highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Map J and K keys to move selected block up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" zig autoformat on save
let g:zig_fmt_autosave = 0
