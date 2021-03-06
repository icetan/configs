" be iMproved
set nocompatible

let g:vim_home = split(&rtp, ',')[0] "'~/.config/nvim'

" Automatically install vim-plug
if empty(glob(g:vim_home.'/autoload/plug.vim'))
  call system('mkdir -p '.g:vim_home.'/autoload')
  call system('curl -fLo '.g:vim_home.'/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  autocmd VimEnter * PlugInstall
endif

"if empty(glob(g:vim_home.'/spell'))
"  let lang = 'en'
"  call system("curl -l 'ftp://ftp.vim.org/pub/vim/runtime/spell/' | grep -E '^(".lang.")\.' | xargs -I% curl 'ftp://ftp.vim.org/pub/vim/runtime/spell/%' -o '".g:vim_home."/spell/%'")
"endif

" Begin declaration of plugins
call plug#begin(g:vim_home.'/plugged')

" Asynchronous commands yay!
"if has('clientserver')
"  Plug 'pydave/AsyncCommand'
"endif

" Status line
Plug 'itchyny/lightline.vim'
"Plug 'edkolev/tmuxline.vim' " Only needed to generate a tmux theme conf file

" Formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
"Plug 'godlygeek/tabular', { 'on': ['Tabularize', 'Tab'] }
Plug 'godlygeek/tabular'

" .lvimrc files for project local editor settings
Plug 'embear/vim-localvimrc'
"Plug 'cd-hook'

" Project management
Plug 'tpope/vim-vinegar'
Plug 'kien/ctrlp.vim'
if has('python') | Plug 'FelikZ/ctrlp-py-matcher' | endif " PyMatcher for CtrlP
"Plug 'RobertAudi/ctrlp_bdelete.vim' " Mapping doesn't work, need to fix

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'icetan/gitignore'

" Movement
Plug 'jayflo/vim-skip'
Plug 'tpope/vim-unimpaired'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'christoomey/vim-tmux-navigator'

" language support
" JavaScript
Plug 'pangloss/vim-javascript',             { 'for': 'javascript' }
Plug 'ZeusTheTrueGod/vim-format-js',        { 'for': 'javascript' }
" CoffeeScript
Plug 'kchmck/vim-coffee-script',            { 'for': 'coffee' }
Plug 'mintplant/vim-literate-coffeescript', { 'for': 'litcoffee' }
" TypeScript
Plug 'leafgarland/typescript-vim',          { 'for': 'typescript' }
" CSS / Less
Plug 'groenewege/vim-less',                 { 'for': [ 'sass', 'less' ] }
Plug 'ap/vim-css-color',                    { 'for': 'css' }
" HTML
Plug 'mattn/emmet-vim',                     { 'for': 'html' }
" Scala
Plug 'derekwyatt/vim-scala',                { 'for': 'scala' }
" Haskell
Plug 'bitc/vim-hdevtools',                  { 'for': 'haskell' }
"Plug 'eagletmt/neco-ghc',                   { 'for': 'haskell' }
" Java
"Plug 'vim-scripts/javacomplete',            { 'for': 'java' }
" Markdown
Plug 'nelstrom/vim-markdown-folding',       { 'for': 'markdown' }
Plug 'tpope/vim-markdown',                  { 'for': 'markdown' }

" gtags support
Plug 'vim-scripts/gtags.vim',               { 'on': [ 'Gtags' ] }

" Logs
Plug 'dzeban/vim-log-syntax',               { 'for': 'log' }

" linters
Plug 'scrooloose/syntastic'

" color schemes
Plug 'icetan/vim-colors-solarized'

"Plug 'MultipleSearch'

call plug#end()


""" My settings

if has("gui_running")
  set guioptions=egmrt                " Hide toolbar in MacVim
  set guifont=Menlo:h11
endif

"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:solarized_termtrans=1

set background=dark
colorscheme solarized

hi SignColumn ctermbg=8
"hi link LineHighlight ErrorMsg
" Set sign column color to same as line numbers
hi! link SignColumn LineNr

" UTF-8
scriptencoding utf-8
set encoding=utf-8
set nobomb
" Buffers
set hidden
" Search
set gdefault                          " Global search by default (/g turns it off).
set hlsearch                          " Highlight results.
set incsearch                         " Search-as-you-type.
set ignorecase                        " Case-insensitive…
set smartcase                         " …unless phrase includes uppercase.
" UI
set cursorline
set fillchars=vert:\                  " No pipes in vertical split separators.
set listchars=nbsp:·,extends:»,tab:▸·,trail:·
set list!                             " Show invisibles.
set showcmd                           " Show partially typed command sequences.
set laststatus=2                      " Always show status bar.
set ruler                             " Show line, column and scroll info in status line.
set textwidth=80                      " Automatically wrap lines when inserting.
set wrap                              " Wrap lines.
set linebreak
set showbreak=↵                       " Line wrap char.
set visualbell                        " Don't beep.
set modelines=1                       " Use modeline overrides.
set scrolloff=3                       " Minimum number of lines to always show above/below the caret.
set noshowmode                        " Hide mode.
set nofoldenable                      " Disable fold on open file
" Editing
set backspace=indent,eol,start        " Allow backspacing over everything in insert mode.
set nojoinspaces                      " 1 space, not 2, when joining sentences.
" Auto indenting
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
" Remove backup files
set nobackup
set noswapfile
set nowritebackup
" Autoread file on change
"set autoread
" Always forward slashes
set shellslash
" Don't print stuff from shell
set shellpipe=2>&1>
" Save editor state to ~/.viminfo
set viminfo=%,!,'50,\"100,:100,n~/.viminfo
" Use mouse in terminal
set mouse=a
set mousemodel=extend
" No timeout for ESC
set timeoutlen=1000 ttimeoutlen=0
" Look for ctags up the dir tree
set tags=tags;/

" Files to ignore
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Airline config
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"
"" unicode symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = '|'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.readonly = '▲'
"let g:airline_symbols.linenr = 'L'
"let g:airline_symbols.whitespace = '●'
"
"let g:airline#extensions#hunks#non_zero_only = 1

"let g:airline#extensions#syntastic#enabled = 0

" Add current work dir to status line
"function! AirlineInit()
"  let g:airline_section_c = airline#section#create_left(['%{split(getcwd(), "/")[-1]}', 'file'])
"endfunction
"autocmd VimEnter * call AirlineInit()

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'filename', 'ctrlpmark'] ],
      \   'right': [ [ 'errors', 'lineinfo' ], ['percent'], [ 'fileformat', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'fugitive', 'filepath' ] ],
      \   'right': [ [ 'errors', 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'filepath': 'MyFilePath',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark'
      \ },
      \ 'component_expand': {
      \   'errors': 'MyErrors',
      \ },
      \ 'component_type': {
      \   'errors': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  "\   ? (winwidth(0) > strlen(expand('%')) ? expand('%') : fname)
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname
        \   ? fname
        \   : '[No Name]'
        \ ) .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFilePath()
  let fname = expand('%')
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]' ) .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 80 ? &fileformat . ':' . (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 80 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyMode()
  let fname = expand('%:t') == 'ControlP' ? 'CtrlP' : lightline#mode()
  return winwidth(0) > 80 ? fname : split(fname, '.\zs')[0]
endfunction

function! MyErrors()
  return winwidth(0) > 20 && !empty(SyntasticStatuslineFlag()) ? '▲' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

" TODO: Better updating of syntastic status.
"augroup AutoSyntastic
"  autocmd!
"  autocmd BufWritePost *.c,*.cpp,*.js call s:syntastic()
"augroup END
"function! s:syntastic()
"  SyntasticCheck
"  call lightline#update()
"endfunction


" v7.3 specific stuff
if v:version >= 703
  " Margin line same value as textwidth
  set colorcolumn=+0
  "hi ColorColumn ctermbg=lightgrey guibg=lightgrey

  " Persistent undo
  set undofile
  set undodir=~/.vimundo " Need to create this directory for undofile to work
endif

" OS exceptions
if has("win32")
  set shell=sh.exe
  set shellcmdflag=--login\ -ic
  set shellxquote=\"
endif

" TODO: doesn't work in iTerm2 + OSX + tmux
" Sync with OS clipboard
"if has("clipboard")
"  set clipboard=unnamed " copy to the system clipboard
"
"  if has("unnamedplus") " X11 support
"    set clipboard+=unnamedplus
"  endif
"endif

" Key mappings
let mapleader = ","

set pastetoggle=<F4>

" Clear highlights
map <F3> :let @/=''<CR>

" Close current buffer
map <C-W>d :bn\|bd #<CR>

" Create an empty buffer in verical split window
map <C-W>n :vert new<CR>

" Ctrl-h same as split horizontally
noremap <C-W>h <C-W>s
" Ctrl-x same as close window
map <C-W>x <C-W>c

" Open current buffer in new tab, hack for tmux like zoom feature
noremap <C-W>z :tab split<CR>

" Simplified window navigation
" XXX: Hack for neovim, Ctrl-H is interpreted as a backspace
" https://github.com/neovim/neovim/issues/2048
if has('nvim')
  "nnoremap <BS> <C-W>h
  nnoremap <bs> :<c-u>TmuxNavigateLeft<cr>
else
  nnoremap <C-H> <C-W>h
endif
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-l> <C-W>l
"nmap - <C-W>-
nmap + <C-W>+

" Make Y consistent with C and D - yank to end of line, not full line.
nnoremap Y y$

" Don't save overwriten text into default register when pasting in visual
" mode.
vnoremap p "_dP

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" CtrlP
if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

let g:ctrlp_show_hidden = 1

" CtrlP mappings
map <C-T>f :CtrlPCurFile<CR>
map <C-T>m :CtrlPMRUFiles<CR>
map <C-T>d :CtrlPDir<CR>
map <C-T>b :CtrlPBuffer<CR>
map <C-T>o :CtrlPBookmarkDir<CR>
map <C-T>a :CtrlPBookmarkDirAdd<CR>
map <C-T>r :CtrlPClearCache<CR>
map <C-T>t :CtrlPBufTag<CR>
map <C-T>q :CtrlPQuickfix<CR>

" Maps C-d in CtrlP buffer mode to delete marked buffers.
"call ctrlp_bdelete#init()

" Replace ctags lookup with gtags
nnoremap [g :execute "Gtags " . expand("<cword>")<CR>
nnoremap ]g :execute "Gtags -r " . expand("<cword>")<CR>
nnoremap <C-g> :Gtags -f %<CR>
function! GtagsFunc()
  call system( "find . -type f ! -path '".join(split(&wildignore,','),"' ! -path '")."' | gtags -f -" )
endfunction
command! Gtagsr call GtagsFunc()

" Completion behavior http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
" TODO: Remaping Ctrl-N in completion popup to down arrow doesn't work
"inoremap <expr> <C-n> (pumvisible() ? "<Down>" : "<C-n>")
"inoremap <expr> <C-p> (pumvisible() ? "<Up>" : "<C-p>")

" General omnicomplete
set omnifunc=syntaxcomplete#Complete
au FileType python     setlocal omnifunc=pythoncomplete#Complete
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
au FileType css        setlocal omnifunc=csscomplete#CompleteCSS
au FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
au FileType php        setlocal omnifunc=phpcomplete#CompletePHP
au FileType c          setlocal omnifunc=ccomplete#Complete

" Haskell setup
au FileType haskell setlocal omnifunc=necoghc#omnifunc
au FileType haskell setlocal formatprg=pointfree\ \"$(cat)\"
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>

" Java setup
"au FileType java setlocal omnifunc=javacomplete#Complete
let g:EclimCompletionMethod = 'omnifunc'
" Remap lookup symbol
au FileType java nnoremap [g :JavaSearch<CR>
au FileType java nnoremap ]g :JavaCallHierarchy<CR>
" 4 space indentation
au FileType java setlocal sw=4 sts=4 ts=4

" TypeScript
" 4 space indentation
au FileType typescript setlocal sw=4 sts=4 ts=4
" Always target ES5
let g:syntastic_typescript_tsc_args='--target ES5'

" HTML
" 4 space indentation
au FileType html setlocal sw=4 sts=4 ts=4
" Use tidy5 to get HTML5 linting
"let g:syntastic_html_tidy_exec = 'tidy5'
" Ignore errors and warnings for custom tags and attributes
let g:syntastic_html_tidy_ignore_errors =
  \[" proprietary attribute \""
  \,"> is not recognized!"
  \,"discarding unexpected <"
  \]

" Syntastic

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '▲'
highlight SyntasticWarningSign ctermfg=3 guifg=yellow

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" Force a redraw
nnoremap <leader>r :redraw!<CR>

" TODO: Make a working key mapping to invoke syntastic manualy and show results
nnoremap <leader>s :Errors<CR>

" Highlight selected text (visual mode), forwards and `#` only higlights
" witouth jumping.
nnoremap <silent># :let @/='\<'.expand('<cword>').'\>'<CR>
vnoremap <silent>* :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent># :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy:let @/=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>gV:call setreg('"', old_reg, old_regtype)<CR>
"vnoremap <silent> # :<C-U>let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>gvy?<C-R><C-R>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>gV:call setreg('"', old_reg, old_regtype)<CR>
"nnoremap <silent> ¨ :let @/='\<'.expand('<cword>').'\>'<CR>

" TODO: Add multiple higlights
"nnoremap <silent><leader>m :execute 'SearchBuffers ' . getreg('/')<CR>:let @/=''<CR>
"nnoremap <silent><leader>c :SearchBuffersReset<CR>:let @/=''<CR>

" ,l will highlight the current line
"command HighlightLine execute 'match LineHighlight /\%'.line('.').'l/'
"nnoremap <silent> <leader>l ml:HighlightLine<CR>

function! QuickFixPreview()
  if &buftype ==# 'quickfix'
    exe "normal \<CR>"
    "exe "HighlightLine"
    wincmd p
  endif
endfunction

" Pressing spacebar in quickfix window will preview and not move the cursor to
" the target line
nnoremap <silent><Space> :call QuickFixPreview()<CR>

" You need to install `gfm2html` using NPM and chrome-cli.
" $ npm install -g gfm2html
" $ brew install chrome-cli
function! Gfm2Html()
  call system("bash -l -c 'gfm2html \"" . expand('%') . "\" /tmp/vim-md.html; (echo $(chrome-tab file:///tmp/vim-md.html $(cat /tmp/vim-md-id)) > /tmp/vim-md-id; sleep 1; rm /tmp/vim-md.html)'")
endfunction
nnoremap <leader>m :Silent call Gfm2Html()<CR>

" Open file or URL under cursor externally
nnoremap <leader>b :silent call system('open ' . shellescape(expand('<cfile>')))<CR>

" Fugitive and diff key mappings
nnoremap <leader>gd :NoIgnore Gdiff<CR>
nnoremap <leader>gw :NoIgnore Gwrite<CR>
nnoremap <leader>gr :NoIgnore Gread<CR>
nnoremap <leader>gW :NoIgnore Gwrite!<CR>
nnoremap <leader>gR :NoIgnore Gread!<CR>
nnoremap df2 :diffget //2 \| diffup<CR>
nnoremap df3 :diffget //3 \| diffup<CR>
nnoremap d2 :diffget 2 \| diffup<CR>
nnoremap d3 :diffget 3 \| diffup<CR>
nnoremap d4 :diffget 4 \| diffup<CR>
nnoremap du :diffup<CR>
nnoremap dt :diffthis<CR>
nnoremap dq :windo diffoff<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Markdown files
au  BufRead,BufNewFile *.md,*.markdown set ft=markdown
let g:markdown_fenced_languages = ['html', 'xml', 'python', 'sh', 'bash=sh', 'json']
" CoffeeTe tempate files
au BufRead,BufNewFile *.coffeete set ft=html
" Arduino source files
au BufRead,BufNewFile *.ino set ft=cpp
" TileMill and Carto files
au BufRead,BufNewFile *.mss set ft=less
au BufRead,BufNewFile *.mml set ft=javascript
" Riot .tag files
au BufRead,BufNewFile *.tag set ft=html

" Make CSS class and id names include `-`
au FileType html,css,less,scss setl isk+=-

" Not redrawing correctly after execution of shell commands when running regular
" non-GUI Vim and some times needs to force a redraw. Haven't had this problem
" with NeoVim though.
if has('nvim')
  command! -nargs=+ Silent execute 'silent <args>'
else
  command! -nargs=+ Silent execute 'silent <args>' | redraw!
endif

" TODO: Convert to plugin
" Nicer grep
function! GrepFunc(...)
  let exfiles = split(&wildignore, ',')
  let exdirs = map(filter(copy(exfiles), "v:val=~'\\/\\*\\?$'"), "substitute(v:val, '\\/\\*\\?$', '', 'g')")
  call filter(exfiles, "v:val!~'\\/\\*\\?$'")
  let args_ = '-I '
  if len(exfiles) | let args_ .= '--exclude={'.join(exfiles, ',').'} ' | endif
  if len(exdirs) | let args_ .= '--exclude-dir={'.join(exdirs,',').'} ' | endif
  let args_ .= join(a:000, ' ')
  "if (empty(v:servername))
    exe 'Silent grep! ' . args_
    copen
  "else
  "  exe 'AsyncGrep ' . args_
  "  echo 'Greping...'
  "endif
endfunction

function! GrepirSelection()
  call GrepFunc('-iR "'.substitute(substitute(@/, '^\\<', '\\b', ''), '\\>$', '\\b', '').'" .')
endfunction

command -nargs=+ Grep   call GrepFunc(<f-args>)
command -nargs=+ Grepi  execute 'Grep -i <args>'
command -nargs=+ Grepr  execute 'Grep -R <args>'
command -nargs=+ Grepir execute 'Grep -iR <args>'
nnoremap <silent><leader>f :call GrepirSelection()<CR>

let g:localvimrc_persistent = 1

" Add global git ignore to wildignore
let s:pwd = system('pwd')
autocmd VimEnter * let &wildignore = &wildignore . ',' . netrw_gitignore#Hide()
" \ . join(map(split(netrw_gitignore#Hide(), ','), "s:pwd . '/' . v:val"), ',')
"autocmd VimEnter * WildignoreFromGitignore ~ .gitignore_global

function! WithoutWildignore(...)
  let lastwildignore = &wildignore
  let &wildignore = ''
  execute(join(a:000, ' '))
  let &wildignore = lastwildignore
endfunction

command -nargs=+ NoIgnore call WithoutWildignore(<f-args>)

function! ToggleWildignore()
  if (exists('s:lastwildignore'))
    let &wildignore=s:lastwildignore
    unlet s:lastwildignore
  else
    let s:lastwildignore=&wildignore
    let &wildignore=''
  endif
endfunction

command ToggleWildignore call ToggleWildignore()

nnoremap <leader>i :ToggleWildignore<CR>

source ~/.vimrc.local
