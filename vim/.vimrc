
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

set background=dark
colorscheme abstract

set spelllang=en_gb
set spellfile=~/.vim/spell.en.utf-8.add

au BufNewFile,BufRead /tmp/neomutt*  setf mail
au BufNewFile,BufRead /tmp/neomutt*  set ai et tw=68 spell

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

" Append template to new C++ files
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
" autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'

"Plugin 'honza/vim-snippets'
Plugin 'bling/vim-bufferline' "show the list of buffers in the command bar
Plugin 'delimitMate.vim' "completion for quotes, parens, brackets

Plugin 'airblade/vim-gitgutter'

"https://www.youtube.com/watch?v=7-dfpQ5sexk
"do it like this else just "yarn install" wont work
" "yarn install --ignore-engines" will work
Plugin 'neoclide/coc.nvim' "conquer of completion

Plugin 'tpope/vim-commentary' " for comments

" Plugin 'morhetz/gruvbox' " for gruvbox color theme

" Navigation with tmux support
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required


"General shotcut for compiling and running
" you need cp.sh in computer to work 
set makeprg=make.sh\ %:r
autocmd filetype cpp nnoremap <F5> :w <bar> Make <CR> 
autocmd filetype cpp nnoremap <F6> :vertical terminal ++shell ++cols=40 ./%:r<CR>
autocmd filetype cpp nnoremap <F8> :!./%:r<CR>

"CodeForces specific
nnoremap <F9> :vertical terminal ++shell ++cols=40 cf test<CR>
nnoremap <F12> :vertical terminal ++shell ++cols=40 cf submit<CR>

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

"trigger through shift
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsEditSplit="vertical"

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


set cursorline
highlight CursorLine term=bold cterm=NONE ctermbg=none  ctermfg=none gui=bold
highlight CursorLineNr term=bold cterm=none ctermbg=none ctermfg=yellow gui=bold

" Map J and K keys to move selected block up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

