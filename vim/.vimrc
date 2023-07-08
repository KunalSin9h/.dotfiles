
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

"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized

set background=dark
colorscheme aylin

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

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-dispatch'
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'bling/vim-bufferline' "show the list of buffers in the command bar
Plugin 'delimitMate.vim' "completion for quotes, parens, brackets

Plugin 'airblade/vim-gitgutter'

"https://www.youtube.com/watch?v=7-dfpQ5sexk
"do it like this else just "yarn install" wont work
" "yarn install --ignore-engines" will work
Plugin 'neoclide/coc.nvim' "conquer of completion

Plugin 'tpope/vim-commentary' " for comments

" Navigation with tmux support
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required


"General shotcut for compiling and running
" you need make.sh in computer to work 
set makeprg=make.sh\ %:r
autocmd filetype cpp nnoremap <F5> :w <bar> Make <CR> 
autocmd filetype cpp nnoremap <F6> :vertical terminal ++shell ++cols=40 ./%:r.out<CR>
autocmd filetype cpp nnoremap <F8> :!./%:r.out<CR>

"CodeForces specific
nnoremap <F9> :vertical terminal ++shell ++cols=40 cf test<CR>
nnoremap <F12> :vertical terminal ++shell ++cols=40 cfsubmit.sh<CR>

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

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_removed_first_line = 'x^'
let g:gitgutter_sign_removed_above_and_below = 'x%'
let g:gitgutter_sign_modified_removed = '~x'

highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2 guibg=NONE
highlight GitGutterChange guifg=#bbbb00 ctermfg=3 guibg=NONE
highlight GitGutterDelete guifg=#ff2222 ctermfg=1 guibg=NONE

hi Normal guibg=NONE ctermbg=NONE
highlight clear LineNr
" set cursorline
" highlight CursorLine term=bold cterm=NONE ctermbg=none  ctermfg=red gui=bold
" highlight CursorLineNr term=bold cterm=none ctermbg=none ctermfg=white  gui=none 

" Map J and K keys to move selected block up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
