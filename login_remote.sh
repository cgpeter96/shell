#!/bin/bash
# 用于快速登录机器,免于一直输入密码
# 基于expect，如果没有expect需要安装下
username=""
password=""
host_list=()
port_list=()

#此处写相应的机器host和port 如果机器密码不一样需要创建下相应的password_list
host_list[${#host_list[@]}]="wwwww"
port_list[${#port_list[@]}]=22


for((i=0;i<${#host_list[@]};i++))
do
    echo "$i:  ${host_list[$i]} "
done

choose_idx=0
read -p "选择服务器:" arg
if [ "$arg" -ge 0 ];then
   choose_idx=$arg
fi


ip=${host_list[$choose_idx]}
port=${port_list[$choose_idx]}
echo "${username}@${ip}:$port"

expect -c "spawn ssh -p $port  $username@$ip
# note login .. 这行用于匹配无需输入密码的，但是提前登录后需要有login相关的提示，才能工作。
expect {
\"*login*\" { interact }
\"*yes/no*\" { send \"yes\r\";exp_continue }
\"*password:\" { send \"$password\r\";interact }
}"
