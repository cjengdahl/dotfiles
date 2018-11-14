""""""""""""""""""""""""
"       Vundle         "
""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 			" let Vundle manage Vundle, required
Plugin 'flazz/vim-colorschemes' 		" color scheme pack
Plugin 'xolox/vim-misc'					" support for xolox's other plugins
Plugin 'xolox/vim-notes'				" note taking plugin
	:let g:notes_directories = ['~/Documents/Notes', '~/notes']
	:let g:notes_suffix = '.txt'
Plugin 'airblade/vim-gitgutter' 		" revision indication since last commit
Plugin 'w0rp/ale'						" code analysis / linter
Plugin 'editorconfig/editorconfig-vim'	" editor setings - tab space, whitespace triming, etc.
Plugin 'scrooloose/nerdtree'			" project navigation
Plugin 'tpope/vim-surround'				" suround selected text with enclosing characters

" Potential future plugins
" Plugin 'terryma/vim-multiple-cursors'	" sublime text like cursor functionality
" Plugin 'junegunn/fzf.vim'				" Go-to-anything

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""
"       Display        "
""""""""""""""""""""""""

syntax on
colorscheme monokai

" powerline 
" set rtp+=/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/powerline/bindings/vim
" set laststatus=2
" set t_Co=256

""""""""""""""""""""""""
"      Navigation      "
""""""""""""""""""""""""

set number 
set ruler

""""""""""""""""""""""""
"      Formatting      "
""""""""""""""""""""""""

set autoindent							" copy indent from current line to next
set shiftwidth=4						" default indent width of 4 spaces
set tabstop=4							" default tab of 4 spaces
set smarttab							" enable tab completion 

""""""""""""""""""""""""
"    Miscellaneous     "
""""""""""""""""""""""""

set visualbell 							" blink curser instead of error bell
