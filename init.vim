"------------------------------------------------------------------------------
" VUNDLE START
"------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"------------------------------------------------------------------------------
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"------------------------------------------------------------------------------
" better than nerdtree
Plugin 'tpope/vim-vinegar'
" Directory viewer for Vim
Plugin 'justinmk/vim-dirvish'
"------------------------------------------------------------------------------
" git integration
Plugin 'tpope/vim-fugitive'
"------------------------------------------------------------------------------
" ctags tag browser
"------------------------------------------------------------------------------
Bundle 'majutsushi/tagbar'
Bundle 'craigemery/vim-autotag'
nmap <Leader>tt :TagbarToggle<CR>
"------------------------------------------------------------------------------
Plugin 'L9'
"------------------------------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme='sol'

" use the special fonts
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
"------------------------------------------------------------------------------
Bundle 'jeetsukumaran/vim-buffergator'

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one

" Remapping 'bq', because quits vim
map bd :bd<CR>

" Show all open buffers and their status
" nmap <leader>bl :ls<CR>
" not having leader here was slowing down 'l' key
map <leader>ls :BuffergatorOpen<CR>
"------------------------------------------------------------------------------
" Enhanced multi-file search
Bundle 'wincent/loupe'
"------------------------------------------------------------------------------
" Allows to find chars/words, and to move cursor quickly
Bundle 'Lokaltog/vim-easymotion'
"------------------------------------------------------------------------------
" Helps write HTML faster
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"------------------------------------------------------------------------------
" vim-scripts repos
Bundle 'FuzzyFinder'
"------------------------------------------------------------------------------
" automatically update session
Bundle 'tpope/vim-obsession'
"------------------------------------------------------------------------------
" nerdtree
Bundle 'scrooloose/nerdtree'
nmap <leader>nt :NERDTreeToggle<CR>

"Bundle 'jistr/vim-nerdtree-tabs'
"let g:NERDTreeWinSize=25
"nmap <leader>nt :NERDTreeTabsToggle<CR>
"map nt <leader>nt
" http://vimcasts.org/blog/2013/01/
"   oil-and-vinegar-split-windows-and-project-drawer/
let NERDTreeHijackNetrw=1
"------------------------------------------------------------------------------
Bundle 'tmux-plugins/vim-tmux'
"------------------------------------------------------------------------------
Plugin 'ivalkeen/vim-simpledb'
let g:simpledb_show_timing = 0
"sql
"------------------------------------------------------------------------------
" provides sytax highlighting for timux file
Plugin 'benmills/vimux'
"------------------------------------------------------------------------------
" automatically close parentheses and brackets
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
"------------------------------------------------------------------------------
" Provides insert mode compleation 
Plugin 'ervandew/supertab'
"------------------------------------------------------------------------------
" search from Vim via ack
Plugin 'mileszs/ack.vim'
"------------------------------------------------------------------------------
" Alignment 
Plugin 'godlygeek/tabular'
"------------------------------------------------------------------------------
"Markup/markdown
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
let g:pandoc#syntax#conceal#urls = 1
"------------------------------------------------------------------------------
Plugin 'elzr/vim-json'
"------------------------------------------------------------------------------
" Folding indented code blocks
Plugin 'tweekmonster/braceless.vim'
autocmd FileType python BracelessEnable +indent
"------------------------------------------------------------------------------
"XXX Autocomplete
"------------------------------------------------------------------------------
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
" Python completion
Plugin 'ncm2/ncm2-jedi'
" Words in buffer completion
Plugin 'ncm2/ncm2-bufword'
" Filepath completion
Plugin 'ncm2/ncm2-path'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'



" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"


"------------------------------------------------------------------------------
" Python 
"------------------------------------------------------------------------------
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
" ale lint - https://github.com/w0rp/ale
Plugin 'w0rp/ale'
let g:ale_enabled = 0
let g:ale_python_mypy_options = '--ignore-missing-imports'

" format python with yapf
" autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
Bundle 'lambdalisue/vim-pyenv'

"------------------------------------------------------------------------------
" sort imports with isort 
""-----------------------------------------------------------------------------
Plugin 'fisadev/vim-isort'
let g:vim_isort_map = '<C-i>'
"------------------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use 'filetype plugin on'
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update 
"                  or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean  - confirms removal of unused plugins; 
"                 append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"------------------------------------------------------------------------------
" VUNDLE END
"------------------------------------------------------------------------------

" enable project-specific .vimrc files
set exrc

" enable 256 colors
set t_Co=256
set number
syn on

set modeline

" auto indent
set ai                

" backspace can join lines
set backspace=2		    

" <Tab> at start of line tabs <shiftwidth> chars
set smarttab		      

" show cursor position
set ruler		          

" keep a backup copy during the edit session
set writebackup		    

" Incremental search.
set incsearch		      

set complete=.,w,b,u,t,i

set expandtab

set shiftwidth=2

set tabstop=2

set colorcolumn=80

set nowrap

"always show the status line
set laststatus=2

set statusline=%1*[%Y]%F\%(\ %m%r%H%)%=%3P<%l,%c>

" Join adds two spaces after a period.
set joinspaces		    

" plugins are enabled
filetype plugin on	  

" Let K ask man for the word under the cursor 
set keywordprg=man\ -s  

" show current uncompleted command?  
set showcmd           

" show the matching bracket for the last ')'? 
set showmatch         

" show the current mode?  
set showmode          

setlocal spell spelllang=en_us

" disabling for now because it causes "STRANGE" highlighting 
set nospell    

" write with sudo trick
command W w !sudo tee % > /dev/null

:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup 
:endif

autocmd FileType html
            \ setlocal formatprg=tidy\ -indent\ -quiet\ --show-errors\ 0\ --tidy-mark\ no\ --show-body-only\ auto


" vim events
" autocmd  EventName  filename_pattern   :command
" to get a list of all events do: 
" help autocmd-events 
autocmd FileType python :set tabstop=4
autocmd FileType python :set shiftwidth=4
autocmd FileType perl   :set tabstop=2
autocmd FileType perl   :set shiftwidth=2

" shows all vim colors with names
" /opt/local/share/nvim/runtime/syntax/colortest.vim

hi Search cterm=NONE ctermfg=black ctermbg=lightgreen
let perl_fold=1
set secure
