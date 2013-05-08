#!/usr/bin/expect --
#
set list [open "oldswitches.txt"]
set filedata [ read $list]
foreach i $filedata {
spawn telnet $i
expect {
	"Unable to connect to remote host" {
	incr $i
	} }
send "\r"
expect "Please Enter Login Name:*"
send "admin\r"
expect "Please Enter Password:"
send ""
expect "*>"
send "enable\r"
expect "Password:"
send ""
expect "*#"
send "config t\r" 
expect "*(config)#"
send "no logging 10.0.0.7\r"
send "logging 10.1.1.16\r"
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
