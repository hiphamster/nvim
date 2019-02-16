
let g:python_host_prog  = '/Users/alex/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/alex/.pyenv/versions/neovim3/bin/python'

" vim-plug plugin manager
" START
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap <leader>nt :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1

" Provides insert mode compleation 
Plug 'ervandew/supertab'

" Directory viewer for Vim
Plug 'justinmk/vim-dirvish'

" git integration
Plug 'tpope/vim-fugitive'

"------------------------------------------------------------------------------
" ctags tag browser
"------------------------------------------------------------------------------
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
nmap <Leader>tt :TagbarToggle<CR>

"------------------------------------------------------------------------------
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
" vim-buffergator
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

" Enhanced multi-file search
Plug 'wincent/loupe'

" Allows to find chars/words, and to move cursor quickly
Plug 'Lokaltog/vim-easymotion'

" Helps write HTML faster
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" automatically update session
Plug 'tpope/vim-obsession'

" provides sytax highlighting for timux file
Plug 'benmills/vimux'

Plug 'ivalkeen/vim-simpledb'
let g:simpledb_show_timing = 0

" automatically close parentheses and brackets
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

" search from Vim via ack
Plug 'mileszs/ack.vim'

" Alignment 
Plug 'godlygeek/tabular'

"Markup/markdown
Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
let g:pandoc#syntax#conceal#urls = 1

Plug 'elzr/vim-json'

" Folding indented code blocks
Plug 'tweekmonster/braceless.vim'
autocmd FileType python BracelessEnable +indent

"---------------------------------------------------------------------------------
" deoplete code completion
"------------------------------------------------------------------------------
Plug 'zchee/deoplete-jedi'

let g:deoplete#sources#jedi#show_docstring = 0

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

" sort imports with isort 
Plug 'fisadev/vim-isort'
let g:vim_isort_map = '<C-i>'

" vim-plug plugin manager
" END
call plug#end()


" python code formatter
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

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
