" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins

" UI
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

" Features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joonty/vdebug'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'lbrayner/vim-rzip'

" Languages
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'freitass/todo.txt-vim'
Plug 'aklt/plantuml-syntax'
Plug 'lumiliet/vim-twig'
Plug 'briancollins/vim-jst'
Plug 'pearofducks/ansible-vim', {'do': './UltiSnips/generate.sh'}
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/haproxy'
Plug 'sudar/vim-arduino-syntax'

call plug#end()

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set number
set colorcolumn=81,101,121
set wildignorecase

if has("termguicolors")
  set termguicolors
endif

let mapleader = ","

colorscheme desert

" coc configuration
let g:coc_global_extensions = [
  \ '@yaegassy/coc-ansible',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-phpactor',
  \ 'coc-pyright',
  \ 'coc-sh',
  \ 'coc-tsserver',
\ ]

" vim-airline configuration
let g:airline_powerline_fonts = 1

" NERDTree shortcuts
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
  \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

" Open fzf with Ctrl+p.
map <C-p> :FZF<CR>

" Open Tagbar with F8.
nmap <F8> :TagbarToggle<CR>

" Syntax highlighted languages in Markdown fenced code blocks
let g:markdown_fenced_languages = [
  \ 'javascript',
  \ 'js=javascript',
  \ 'json',
  \ 'typescript',
  \ 'ts=typescript',
\ ]

" File type detection for HAProxy
au BufRead,BufNewFile haproxy* set ft=haproxy

source ~/.vim/coc-config.vim
