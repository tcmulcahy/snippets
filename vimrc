" TODO: Figure out something that works in the Linux non-x-windows terminal
" too.
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" send t_SI/t_EI to correct the cursor shape (assuming we are starting in
" normal mode)
startinsert
call feedkeys("\<esc>")


filetype plugin indent on
colorscheme elflord
syntax on


" Put backups and swap files in tmp
set backupdir=/tmp/$USER/vim,/tmp
set directory=/tmp/$USER/vim,/tmp

if expand('$TMPDIR') == '$TMPDIR'
  let $TMPDIR = '/tmp/'
endif

" I put most vim temp files in their own directory.
let s:vim_cache = expand('$TMPDIR/$USER/vim-cache')
if filewritable(s:vim_cache) == 0 && exists("*mkdir")
    call mkdir(s:vim_cache, "p", 0700)
endif

" Enable undo that lasts between sessions.
if has("persistent_undo")
    let s:undodir = s:vim_cache.'/undo'
    if filewritable(s:undodir) == 0 && exists("*mkdir")
      call mkdir(s:undodir, "p", 0700)
    endif
    set undofile
    let &undodir = s:undodir
endif

" Turn on syntax highlighting
syntax on

" Allows switching buffers without saving
set hidden

" Show column/line in status bar
set ruler

" Use spaces instead of tabs
set expandtab
set smarttab

" Allow backspace over indent, end-of-line, and start of insert
set backspace=indent,eol,start

" Adjust indent with tab key in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Tab/Shift-Tab to cycle through buffers in normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Smart case searching
set smartcase
set ignorecase

" Incremental search
set incsearch

" Make the current file's directory the current working directory 
if has("autochdir")
  set autochdir
endif

" autosave on buffer change
set autowriteall

augroup persistent_undo
    au!
    au BufWritePre /tmp/*           setlocal noundofile
    au BufWritePre COMMIT_EDITMSG   setlocal noundofile
    au BufWritePre *.tmp            setlocal noundofile
    au BufWritePre *.bak            setlocal noundofile
    au BufWritePre .vim-aside       setlocal noundofile
augroup END
