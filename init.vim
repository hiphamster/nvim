"-----------------------------------------------------------------------------------------
" VUNDLE START
"-----------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"-----------------------------------------------------------------------------------------
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"-----------------------------------------------------------------------------------------
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"-----------------------------------------------------------------------------------------
" git integration
Plugin 'tpope/vim-fugitive'

"-----------------------------------------------------------------------------------------
" This plugin provides a start screen for Vim and Neovim
" Plugin 'mhinz/vim-startify'
"-----------------------------------------------------------------------------------------
Plugin 'L9'
"-----------------------------------------------------------------------------------------
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

"-----------------------------------------------------------------------------------------
Bundle 'jeetsukumaran/vim-buffergator'
"-----------------------------------------------------------------------------------------

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
map ls :BuffergatorOpen<CR>

" cd ~/.vim/bundle/command-t && make 
" cd ~/.vim/bundle/command-t/ruby/command-t && make 
Bundle 'wincent/command-t'
"-----------------------------------------------------------------------------------------
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"-----------------------------------------------------------------------------------------
Bundle 'Lokaltog/vim-easymotion'
"-----------------------------------------------------------------------------------------
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"-----------------------------------------------------------------------------------------
Bundle 'tpope/vim-rails'
"-----------------------------------------------------------------------------------------
" sets 'path' in vim to match CLASSPATH for jvm langs
" this plugin interferes with eclim and causes A LOT OF PAIN!!!!
" Bundle 'tpope/vim-classpath'
"-----------------------------------------------------------------------------------------
" vim-scripts repos
Bundle 'FuzzyFinder'
"-----------------------------------------------------------------------------------------
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" 
"Bundle 'breeze.vim'
"-----------------------------------------------------------------------------------------
" automatically update session
Bundle 'tpope/vim-obsession'
"
"-----------------------------------------------------------------------------------------
" nerdtree
Bundle 'scrooloose/nerdtree'
nmap <leader>nt :NERDTreeToggle<CR>

"Bundle 'jistr/vim-nerdtree-tabs'
"let g:NERDTreeWinSize=25
"nmap <leader>nt :NERDTreeTabsToggle<CR>
"map nt <leader>nt
" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
let NERDTreeHijackNetrw=1
"-----------------------------------------------------------------------------------------
 "Clojure
Bundle 'guns/vim-clojure-static'

" ayelluas
" it seems that vim-fireplace requires python 2.7, and breaks with 3.2
Bundle 'tpope/vim-fireplace'
" jump to definition under the cursor
nmap <leader>K "zyw:exe "Djump ".@z" "<CR>

Bundle 'tpope/vim-leiningen'


" Bundle 'vim-scripts/paredit.vim'
" Bundle 'venantius/vim-cljfmt'
" Bundle 'tpope/vim-surround'
" Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'tpope/vim-slave'
"-----------------------------------------------------------------------------------------
Bundle 'tmux-plugins/vim-tmux'
"-----------------------------------------------------------------------------------------
Plugin 'ivalkeen/vim-simpledb'
let g:simpledb_show_timing = 0
"sql
"-----------------------------------------------------------------------------------------
Plugin 'benmills/vimux'
"-----------------------------------------------------------------------------------------
"Snippets - chunks of pre-build code 
"Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"-----------------------------------------------------------------------------------------
" Visual marks
" Plugin 'kshenoy/vim-signature'
" causes problems with vim-nerdtree-tabs

"-----------------------------------------------------------------------------------------
" Vertical indentation for blocks
" Plugin 'Yggdroot/indentLine'
" nmap <leader>i :IndentLinesToggle<CR>

" will move this to Java.vim
" vertical line indentation
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#09AA08'
"let g:indentLine_char = '│'
"-----------------------------------------------------------------------------------------
" automatically close parentheses and brackets
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
"-----------------------------------------------------------------------------------------
" Provides insert mode compleation 
Plugin 'ervandew/supertab'
"-----------------------------------------------------------------------------------------
" search from Vim via ack
Plugin 'mileszs/ack.vim'
"-----------------------------------------------------------------------------------------
" search from Vim via ack
Plugin 'wesQ3/vim-windowswap'
"-----------------------------------------------------------------------------------------
Plugin 'godlygeek/tabular'
"-----------------------------------------------------------------------------------------
"Markup/markdown
" Plugin 'plasticboy/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
let g:pandoc#syntax#conceal#urls = 1
Plugin 'elzr/vim-json'
"-----------------------------------------------------------------------------------------
Plugin 'tweekmonster/braceless.vim'
autocmd FileType python BracelessEnable +indent
"-----------------------------------------------------------------------------------------
" Autocomplete
"-----------------------------------------------------------------------------------------
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plugin 'zchee/deoplete-jedi'
"Plugin 'davidhalter/jedi-vim'

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

" To close preview window of deoplete automagically
autocmd CompleteDone * pclose 

let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'

"-----------------------------------------------------------------------------------------
" Python 
"-----------------------------------------------------------------------------------------
" ale lint - https://github.com/w0rp/ale
Plugin 'w0rp/ale'

" format python with yapf
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

"-----------------------------------------------------------------------------------------
" Java
"-----------------------------------------------------------------------------------------
Plugin 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"-----------------------------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----------------------------------------------------------------------------------------
" VUNDLE END
"-----------------------------------------------------------------------------------------

" enable 256 colors
set t_Co=256
set number
syn on

set modeline

set ai                " auto indent

set backspace=2		    " backspace can join lines

set smarttab		      " <Tab> at start of line tabs <shiftwidth> chars
set ruler		          " show cursor position

" The following eats gcc and SGI cc/CC
set writebackup		    " keep a backup copy during the edit session

"set digraph		      " Enter ISO-8869-1 umlauts on US keyboards!
set incsearch		      " Incremental search.
set complete=.,w,b,u,t,i
set expandtab
set shiftwidth=2
set tabstop=2

set nowrap

"always show the status line
set laststatus=2

set statusline=%1*[%Y]%F\%(\ %m%r%H%)%=%3P<%l,%c>
" set statusline=%<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"set hlsearch         " highlight search matches

set joinspaces		    " Join adds two spaces after a period.

filetype plugin on	  " plugins are enabled

set keywordprg=man\ -s  " Let K ask man for the word under the cursor 

set showcmd           " show current uncompleted command?  

set showmatch         " show the matching bracket for the last ')'? 

set showmode          " show the current mode?  

setlocal spell spelllang=en_us

"set spellfile=~/.spellfile.utf8.add

set nospell         " disabling for now because it causes "STRANGE" highlighting 

" testing
" zyw - puts word under the cursor into a named register, in this case 'z'
" to recall it use @z, can do zyW instead of zyw, see diff between 'word' 
" and WORD; the command below will put a word under the cursor into z reg,
" will open new tab and use that word a filename 
map <C-t> "zyw:exe "tabe ".@z.""<CR>
" -----------------------------------------------------------------------------
" Perl
" -----------------------------------------------------------------------------
Bundle 'majutsushi/tagbar'
" -----------------------------------------------------------------------------
" Perl
" -----------------------------------------------------------------------------
nmap <leader>pc :w !perl -c<CR>
" -----------------------------------------------------------------------------
" Ruby
" -----------------------------------------------------------------------------
  Bundle 'vim-ruby/vim-ruby'
" -----------------------------------------------------------------------------
" THIS REQUIRES TMUX!!!! 
" -----------------------------------------------------------------------------
" Run perldoc on a word under cursor, and display
" it in a new pane, at the bottom of the screen
" todo: need to add if/else block to only set this if i'm inside tmux
map <C-j> "zyw:exe "silent !tmux split-window -l 10 'perldoc -f'".@z.""<CR>

" same as above for man
map <C-k> "zyw:exe "silent !tmux split-window -l 10 'man '".@z.""<CR>

" same as above for python
map <C-l> "zyw:exe "silent !tmux split-window -l 10 'pydoc '".@z.""<CR>

" same as above for a new shell, still not sure about the number of "
map <C-p> "i:exe "silent !tmux split-window -l 10 'bash '"<CR>
" -----------------------------------------------------------------------------
"
" nmap <leader>gs :enew | r !git status<CR>


" this is annoying 
" autocmd! BufWritePost *.js JSHint

:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup 
:endif

" vim events
" autocmd  EventName  filename_pattern   :command
" to get a list of all events do: 
" help autocmd-events 
autocmd FileType python :set tabstop=4
autocmd FileType python :set shiftwidth=4
autocmd FileType perl   :set tabstop=2
autocmd FileType perl   :set shiftwidth=2

" folds perl subs
" zO - unfold all
" zo - unfold under cursor 
" zC - fold all
" zc - fold under cursor 
" :help fold

" shows all vim colors with names
" /opt/local/share/nvim/runtime/syntax/colortest.vim
hi Search cterm=NONE ctermfg=black ctermbg=lightgreen
let perl_fold=1
