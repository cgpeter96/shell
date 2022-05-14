#!/bin/bash
# author:peter
# desc:一键安装vim插件plug.vim&C/C++
# 查找表 https://github.com/skywind3000/awesome-cheatsheets/blob/master/editors/vim.txt
cd $(dirname $0)
# step1
git clone https://github.com/junegunn/vim-plug

#step2
[[ ! -d "~/.vim/autoload/" ]] &&  mkdir ~/.vim/autoload/
[[ ! -d "~/.vim/plugged" ]] &&  mkdir ~/.vim/plugged/

cp vim-plug/plug.vim ~/.vim/autoload/
cp ./vimrc ~/.vimrc 
#进入vim执行
#:PlugInstall

# NOTE: 看情况是否需要编译YCM
# NOTE: cmake>=3.14

# step3(optinal 看情况编译,也可以用默认的)
sudo apt install build-essential cmake python3-dev
sudo apt install clang libclang-dev
cd ~/.vim/plugged/YouCompleteMe
python3 ./install.py --all
cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/

# old vim Vundle插件和python补全
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

##添加配置文件
#echo 'set nocompatible              " be iproved, required
#filetype off                  " required
#
#" set the runtime path to include Vundle and initialize
#set rtp+=~/.vim/bundle/Vundle.vim
#call vundle#begin()
#" alternatively, pass a path where Vundle should install plugins
#"call vundle#begin('~/some/path/here')
#
#" let Vundle manage Vundle, required
#Plugin 'VundleVim/Vundle.vim'
#
#" All of your Plugins must be added before the following line
#call vundle#end()            " required
#filetype plugin indent on    " required
#" To ignore plugin indent changes, instead use:
#"filetype plugin on' >>~/.vimrc
#
##安装python 补充jedi-vim
#git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
#
#echo 'Plugin 'davidhalter/jedi-vim'
#"python环境配置
#let g:jedi#environment_path = "~/anaconda3/bin/python"' >>~/.vimrc
