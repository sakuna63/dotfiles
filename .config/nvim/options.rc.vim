" ===================================================
" ================ General Config ====================

set number                      " Show line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden                      " Allow open other file when current file is not saved
" http://qiita.com/shotat/items/da0f42ea90610ca0dadb
set synmaxcol=200
" set confirm                     " Confirm whether saving file when quiting vim without saving

syntax on
set nofoldenable                 " Disable folding

" ===================================================
" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ===================================================
" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
" if has('persistent_undo') && !isdirectory(expand('~').'/.config/nvim/backup')
silent !mkdir ~/.config/nvim/backup > /dev/null 2>&1
set undodir=~/.config/nvim/backup
set undofile
" endif

" ===================================================
" ================ Indentation ======================

set autoindent                  " Keep indentation
set smartindent                 " Change indentation respond to end of line
set smarttab                    " Use shiftwidth setting as <TAB> width instead of tabstop
set shiftwidth=2                " <TAB> width for auto indent
set softtabstop=2               " <TAB> width for bacsspace and manual tab inserting
set tabstop=2                   " <TAB> width to show a <TAB> in display
set expandtab                   " Use spaces insted of <TAB>

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

set wrap                      " wrap lines
" set nowrap                      " Don't wrap lines

" ===================================================
" ================ Completion =======================

set wildmode=list:full
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignorecase              " Ignore case
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ===================================================
" ================ Scrolling ========================

set scrolloff=8                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set lazyredraw                  " Accelerate scrolling

" ===================================================
" ================ Search ===========================

set incsearch                   " Find the next match as we type the search
set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching...

" ===================================================
" ================ Clipboard ========================

" Sync with OS clipboard. See also http://goo.gl/LlwFno
set clipboard+=unnamed,unnamedplus " Sync with OS clipboard

" ===================================================
" ================= Auto ============================

autocmd BufNewFile,BufRead .z* set filetype=zsh
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead Guardfile set filetype=ruby
autocmd BufNewFile,BufRead *.pde set filetype=processing
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.toml set filetype=toml
autocmd BufNewFile,BufRead *.{gp,gnu} set filetype=gnuplot
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" ===================================================
" ================= Misc ============================

" Disable concealing See also http://qiita.com/karur4n/items/a26007236c59c5fb8735
let g:tex_conceal=''
let g:vim_json_syntax_conceal = 0
