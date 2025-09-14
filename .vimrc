"Map d to _d (_ is black whole register) so its not copied, just delted
nnoremap d "_d
vnoremap d "_d

" To add plugin, we just add Plug 'username/plugin-name'
" Than we save our .vimrc file, source it with command :source ~/.vimrc
" And type :PlugInstall to download and isntall plugins
" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')


  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'


call plug#end()

" }}}

"My settings
set number relativenumber

"Use system buffer for copying, so after y, copied text can be pased outside of vim as well
set clipboard=unnamedplus


"NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"FreeCodeCamp settings
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" My remaps - Ctrl j down whole page and Ctrl k up whole page
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
