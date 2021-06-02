" echo '(>^.^<)'
"------------------------------------------------------------------------------
" nvim documentation: https://neovim.io/doc/
" Plug START
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"------------------------------------------------------------------------------
colorscheme peachpuff

set nocompatible              " be iMproved, required

" Set internal encoding of vim, not needed on neovim (coc.nvim)
set encoding=utf-8

" Some servers have issues with backup files, see #649. (coc.nvim)
set nobackup
set nowritebackup

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

" syntax file for scss (sassy css)
Plug 'cakebaker/scss-syntax.vim'

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

" search from Vim via ack
Plug 'mileszs/ack.vim'

" Alignment 
Plug 'godlygeek/tabular'

"Markup/markdown
"""Plug 'gabrielelana/vim-markdown'
"""Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
let g:pandoc#syntax#conceal#urls = 1
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

Plug 'elzr/vim-json'

" Folding indented code blocks
Plug 'tweekmonster/braceless.vim'
autocmd FileType python BracelessEnable +indent

"" Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

"coc start -------------------------------------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_node_path = '/opt/local/bin/node'

inoremap <silent><expr> <c-space> coc#refresh()

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>g

" Adds support for JSON with Comments for Vim 
" (used by vscode config required by coc)
Plug 'kevinoid/vim-jsonc'

"coc end -----------------------------------------------------------------------

" javascript 
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

set shortmess+=c
inoremap <c-c> <ESC>

" make it fast
" let ncm2#popup_delay = 5
" let ncm2#complete_length = [[1, 1]]

" Use new fuzzy based matches
" let g:ncm2#matcher = 'substrfuzzy'

" Disable Jedi-vim autocompletion and enable call-signatures options
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"

" HTML
""let g:ale_html_tidy_executable = '/opt/local/bin/tidy'

" Python 
"------------------------------------------------------------------------------
" let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
" ale lint - https://github.com/w0rp/ale
"" Plug 'w0rp/ale'
"" let g:ale_enabled = 0
"" let g:ale_python_mypy_options = '--ignore-missing-imports'

" format python with yapf
" autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf --style ~/.config/nvim/yapf_py_style<CR>

Plug 'lambdalisue/vim-pyenv'

" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" sort imports with isort 
Plug 'fisadev/vim-isort'
let g:vim_isort_map = '<C-i>'

Plug 'leafgarland/typescript-vim'

Plug 'chrisbra/csv.vim'

" All of your Plugins must be added before the following line
call plug#end()           
"------------------------------------------------------------------------------
" Plug END
"------------------------------------------------------------------------------

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
let perl_fold=1
set foldlevelstart=99 "start file with all folds opened

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

set secure
