" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" 更友好的vim插件
Plug 'tpope/vim-sensible'
"代码配色
Plug 'junegunn/seoul256.vim'
" 目录树
Plug 'scrooloose/nerdtree'
" YCM代码补全
Plug 'Valloric/YouCompleteMe'
" taglist,记得安装ctags&cscope
Plug 'yegappan/taglist'

"===== TODO插件,未来可以尝试====

"轻量级的看情况用
"Plug 'skywind3000/vim-auto-popmenu'
"Plug 'skywind3000/vim-dict'

"异步运行
"Plug 'skywind3000/asyncrun.vim'

"一个有效的模糊查找器，可以随时找到文件
"Plug 'Yggdroot/LeaderF'

 

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"============配色=============
let g:seoul256_background = 236
colo seoul256

"========精简补全配置===============
" enable this plugin for filetypes, '*' for all files.
"let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
let g:apc_enable_ft = {'*':1}
" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b
" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

"==============YCM配置======================
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
"ycm python解释器
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
let g:ycm_key_invoke_completion = '<c-z>'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
"let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"上下左右键行为,有点坑"
"inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
"inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
"inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
"inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

"===========nerdtree配置================
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Taglist配置
map <F2> :Tlist <CR> 

"============通用配置===========
set nocompatible    " 关闭兼容模式
syntax enable       " 语法高亮
"光标所在行列
set cursorline
"set cursorcolumn


"控制
set fileencodings=utf-8,gbk  "使用utf-8或gbk编码方式
set confirm                  "在处理未保存或只读文件时，弹出确认消息
set selectmode=mouse,key      "启动选择模式的方式
set completeopt=longest,menu  "智能补全,弹出菜单，无歧义时才自动填充


"显示
set t_Co=256                  "可以使用的颜色数目
set number                    "显示行号
set laststatus=2              "显示状态行
set ruler                    "显示标尺
set showcmd                  "显示输入的命令
set showmatch                "高亮括号匹配
set matchtime=1              "匹配括号高亮的时间(十分之一秒)
set matchpairs={:},(:)          "匹配括号"{}""()"   
set hlsearch                  "检索时高亮匹配项
set incsearch                "边检索边显示匹配

"格式
set noexpandtab              "不要将tab转换为空格
set shiftwidth=4              "自动缩进的距离,也是平移字符的距离
set tabstop=4                "tab键对应的空格数
set autoindent                "自动缩进
set smartindent              "智能缩进
cs add /home/peter/cpp_code/test/cscope.out

