" echo '(>^.^<)'
"------------------------------------------------------------------------------
" Plug START
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"------------------------------------------------------------------------------
colorscheme peachpuff

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/bundle')

Plug 'edkolev/tmuxline.vim'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'lightline'

" nerdtree
Plug 'scrooloose/nerdtree'
nmap <leader>nt :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1

" better than nerdtree
Plug 'tpope/vim-vinegar'

" Directory viewer for Vim
Plug 'justinmk/vim-dirvish'

" git integration
Plug 'tpope/vim-fugitive'

" ctags tag browser
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
nmap <Leader>tt :TagbarToggle<CR>

" Plug 'L9'

" airline
"------------------------------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

"------------------------------------------------------------------------------
Plug 'jeetsukumaran/vim-buffergator'

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
Plug 'wincent/loupe'

" Allows to find chars/words, and to move cursor quickly
Plug 'Lokaltog/vim-easymotion'

" Helps write HTML faster
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
" Plug 'FuzzyFinder'

" automatically update session
Plug 'tpope/vim-obsession'

Plug 'tmux-plugins/vim-tmux'

" provides sytax highlighting for timux file
Plug 'benmills/vimux'

Plug 'ivalkeen/vim-simpledb'
let g:simpledb_show_timing = 0

" automatically close parentheses and brackets
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

" Provides insert mode compleation 
Plug 'ervandew/supertab'

" search from Vim via ack
Plug 'mileszs/ack.vim'

" Alignment 
Plug 'godlygeek/tabular'

"Markup/markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
let g:pandoc#syntax#conceal#urls = 1

Plug 'elzr/vim-json'

" Folding indented code blocks
Plug 'tweekmonster/braceless.vim'
autocmd FileType python BracelessEnable +indent

"ncm2 autocomplete
"------------------------------------------------------------------------------
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Python completion
Plug 'ncm2/ncm2-jedi'
" Words in buffer completion
" Plugin 'ncm2/ncm2-bufword'
" Filepath completion
" Plugin 'ncm2/ncm2-path'

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
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

" HTML
let g:ale_html_tidy_executable = '/opt/local/bin/tidy'

" Python 
"------------------------------------------------------------------------------
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
" ale lint - https://github.com/w0rp/ale
Plug 'w0rp/ale'
let g:ale_enabled = 0
let g:ale_python_mypy_options = '--ignore-missing-imports'

" format python with yapf
" autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

Plug 'lambdalisue/vim-pyenv'

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" sort imports with isort 
Plug 'fisadev/vim-isort'
let g:vim_isort_map = '<C-i>'

Plug 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call plug#end()           
"------------------------------------------------------------------------------
" Plug END
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

set colorcolumn=100

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

"autocmd FileType html setlocal formatprg=tidy -indent -quiet --show-errors 0 --tidy-mark no --show-body-only auto

" vim events
" autocmd  EventName  filename_pattern   :command
" to get a list of all events do: 
" help autocmd-events 
"autocmd FileType python :set tabstop=4
"autocmd FileType python :set shiftwidth=4
"autocmd FileType perl   :set tabstop=2
"autocmd FileType perl   :set shiftwidth=2

" shows all vim colors with names
" /opt/local/share/nvim/runtime/syntax/colortest.vim

hi Search cterm=NONE ctermfg=black ctermbg=lightgreen
let perl_fold=1
set secure
