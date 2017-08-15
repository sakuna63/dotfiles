if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"

" ===================================================
" ================ dein.vim  ========================

" Use different cache directory depending on application
if exists('g:nyaovim_version')
  let s:dein_cache_path = expand('~/.cache/nyaovim/dein')
elseif has('nvim')
  let s:dein_cache_path = expand('~/.cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path .'/repos/github.com/Shougo/dein.vim'

" Add dein.vim to runtimepath if needed
if &runtimepath !~ '/dein.vim'
  " If we haven't cloned dein.vim yet, just clone it !!
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

" Enable notification notified via terminal-notifier (on mac)
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  if exists('g:nyaovim_version')
    " TODO: add nyaovim plugins here
  end

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

runtime! options.rc.vim
runtime! keymap.rc.vim
