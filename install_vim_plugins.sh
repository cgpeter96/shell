#!/bin/bash
# author:peter
# desc:一键安装vim插件管理Vundle和python补全

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#添加配置文件
echo 'set nocompatible              " be iproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on' >>~/.vimrc

#安装python 补充jedi-vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

echo 'Plugin 'davidhalter/jedi-vim'
"python环境配置
let g:jedi#environment_path = "~/anaconda3/bin/python"' >>~/.vimrc
