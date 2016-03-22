" Disable vi compatibility
set nocompatible

" ===================================================
" ================ General Config ====================

set number                      " Show line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden                      " Allow open other file when current file is not saved
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
" if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backup')
  silent !mkdir ~/.vim/backup > /dev/null 2>&1
  set undodir=~/.vim/backup
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
" ================ Keybind ==========================
" These are only basic keybinds.
" Keybinds for plugin is written in ~/.vim/.vimrc.bundle

let mapleader = "\<Space>"

" ESC map
inoremap jj <ESC>
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
cnoremap <C-j> <ESC>

" Emacs like bindings
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc><S-a>

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>

" Prevent saving deleted character into register
nnoremap x "_x

" Select whole line
vnoremap v ^$h

" Change indent continuously
vnoremap < <gv
vnoremap > >gv

" Map ; to : for US key mapping
nnoremap ; :

" Tab Control {{{

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]

" Tab jump via number
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

nnoremap <silent> [Tag]c :tablast <bar> tabnew<CR>
nnoremap <silent> [Tag]x :tabclose<CR>
nnoremap <silent> [Tag]n :tabnext<CR>
nnoremap <silent> [Tag]p :tabprevious<CR>

" }}}

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

" ===================================================
" ================= Bundle  =========================

if filereadable(expand("~/.vim/.vimrc.bundle"))
  so ~/.vim/.vimrc.bundle
endif
