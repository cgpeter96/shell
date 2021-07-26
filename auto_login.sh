#!/usr/bin/expect -f
# usage: auto_login.sh servername

set name [lindex $argv 0]
set password "yourpassword"

# 服务器配置
set s1 { "hostname" "username" "yourpassword" } 
set s2 { "hostname" "username" "yourpassword" }


# 匹配服务器
if { $name=="s1" } { 
    set ip [lindex $s1 0]
    set username [lindex $s1 1]
    set password [lindex $s1 2] 
 } elseif { $name=="s2" } { 
    set ip [lindex $s2 0]
    set username [lindex $s2 1]
    set password [lindex $s2 2] 
 } else {

}




spawn ssh $username@$ip
expect {
"*yes/no" { send "yes\r";exp_continue }
"*password:" { send "$password\r" }
}
interact
