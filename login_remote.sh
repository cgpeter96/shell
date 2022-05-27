#!/bin/bash
# 用于管理快速登录服务器，减少显示输入密码
# 依赖：expect,这个工具需要提前安装 yum install expect or apt install expect
#必须填写
default_username=""
#必须填写
default_password=""
default_port=22
msg_list=()
host_list=()
username_list=()
password_list=()
port_list=()


#instruction of connection for remote server
#服务器地址
host_list[${#host_list[@]}]=""
#账号
username_list[${#username_list[@]}]=""
#密码
password_list[${#password_list[@]}]=""
#端口号
port_list[${#port_list[@]}]=""
#备注信息
msg_list[${#msg_list[@]}]=""

#e.g， 只是测试可以把下面注释去掉。
#host_list[${#host_list[@]}]="xxx.xx.com"
#username_list[${#username_list[@]}]="username"
#password_list[${#password_list[@]}]="password"
#port_list[${#port_list[@]}]="22"
#msg_list[${#msg_list[@]}]="测试机"

#print the server list
fmt="%-5s\t%-30s\t%-5s\t%-30s\n"
printf $fmt "index" "hostname" "port" "message"
for((i=0;i<${#host_list[@]};i++))
do
    printf $fmt $i ${host_list[$i]}  ${port_list[$i]} ${msg_list[$i]}
done

choose_idx=0
read -p "Select Server:>>>" arg
if [ "$arg" -ge 0 ];then
   choose_idx=$arg
else
   echo "please check input:$arg"
   exit 1
fi


ip=${host_list[$choose_idx]}
port=${port_list[$choose_idx]}
username=${username_list[$choose_idx]}
password=${password_list[$choose_idx]}
# check server
if [[ ! -n $ip || ! -n $port || ! -n $username || ! -n $password ]]
then
    echo -e "${ip}\t${port}\t${username}\t${password}"
    echo "ERROR:please check server information"
    exit 1
fi
echo "Connect to ${username}@${ip}:$port"

# build connection
#exp_continue匹配到会往下执行
expect -c "spawn ssh -p $port $username@$ip
expect {
\"*login*\" { interact }
\"*yes/no*\" { send \"yes\r\";exp_continue }
\"*password:\" { send \"$password\r\";interact }
}"
