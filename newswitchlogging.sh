#!/usr/bin/expect --
# Telnet script for switches 10.0.0.1, 10.0.4.3, 10.0.5.1, and 10.0.0.3
set list [open "newswitches.txt"]
set filedata [ read $list]
foreach i $filedata {
spawn telnet $i
expect {
	"Unable to connect to remote host" {
	incr $i
   	} }
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
