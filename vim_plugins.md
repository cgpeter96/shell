## vim 配置说明手册

## 插件管理

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### 修改.vimrc
set nocompatible              " be iproved, required
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
"filetype plugin on

```


## vim-jedi插件

```
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
```

### 添加vimrc配置

```
Plugin 'davidhalter/jedi-vim'
#记得上面这句要移动到 call vundle#end上面
let g:jedi#environment_path = "/home/peter/anaconda3/bin/python"
```
### jedi快捷键配置

```
默认快捷补全 ctrl+space
可以使用 let g:jedi#completions_command = "<C-N>" 设置 <Ctrl-n>(同时按下Ctrl和n键) 组合键用于触发jedi-vim的自动补齐功能
然后使用ctrl+space代替esc


#命令在控制模式下(esc),可以用esc or ctrl+[进入

Goto assignments: <leader>g (typical goto function)
跳转到定义： <leader>d
显示Python文档(Pydoc)： K
重命名：<leader>r
展示某个变量的使用方法：<leader>n (shows all the usages of a name)
打开某个模块：:Pyimport os (打开 os 模块)
注：<leader> 表示Vim的leader键，默认为 \。
```

