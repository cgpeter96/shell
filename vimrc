"set number
"显示行号 
syntax on "自动语法高亮 
set shiftwidth=4 "默认缩进4个空格 
set softtabstop=4 "使用tab时 tab空格数 
set tabstop=4 "tab 代表4个空格 
set expandtab "使用空格替换tab
set encoding=utf-8 "设置编码
set autoindent "在插入模式下，对每行按与上行同样的标准进行缩进

" vundle配置
set nocompatible              " be iproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let g:jedi#environment_path = "/home/peter/anaconda3/bin/python"
