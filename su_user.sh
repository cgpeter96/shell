#!/bin/bash
# @author:cgpeter96
# @function: reduce times of input passwd
default_username=""
default_password=""
default_target_user=""

username=$default_username
password=$default_password

expect -c "spawn sudo -u $default_target_user bash
expect {
\"*password for $username\" { send \"$password\r\";interact }
\"*\" { interact }
}"
