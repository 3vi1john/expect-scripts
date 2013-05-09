#!/usr/bin/expect --
# 
set list [open "coreswitches.txt"]
set filedata [ read $list]
foreach i $filedata {
spawn telnet $i
expect "Please Enter Login Name:*"
send "admin\r"
expect "Please Enter Password:"
send ""
expect "*>"
send "enable\r"
expect "Username: "
send "manager\r"
expect "Password: "
send ""
expect "*#"
send "write mem\r"
expect "*#:"
send "config t\r" 
expect "*(config)#"
send "banner motd #\r"
expect "Enter TEXT message. End with the character'#'"
send "* * * * * * * * * W A R N I N G * * * * * * * * *\r"
send "\r"
send "This computer system is the property of the East\r" 
send "Stroudsburg University. It is for authorized\r" 
send "Resnet admin use only. LOG OFF IMMEDIATELY!\r" 
send "\r"
send "* * * * * * * * * * * * * * * * * * * * * * * * *\r"
send "#\r"
expect "*(config)"
send "write mem\r"
expect "*(config)#"
send "exit\r"
expect "*#:"
send "exit\r"
expect "*>"
send "exit\r"
expect "*(y/n)?"
send "y/r"
}
# end of expect script.
