# shell
scripts for shell

## 文件说明
- zshrc shell的配置文件
- vimrc vim的配置文件，与下面几个搭配使用
  - install_vim_plugin.sh
  - vim_plugin.md
- auto_login.sh 自动登录配置，其实没有ssh-copy-id好用。
- tmux.conf tmux一些建议配置
- login_remote.sh 快速登录远程机器，避免多次输入密码。
- su_user.sh 快速切换账号
- condarc conda的配置文件，加快下载. 家目录下添加`.condarc`文件， 执行`conda clean -i` ,然后执行`conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia`
