import getpass
import sys
import telnetlib
import time

Host="10.13.237.100"

user=raw_input(' Enter User name: ')
password=getpass.getpass()

tn = telnetlib.Telnet(Host)
tn.read_until(b'Username: ')
tn.write(user.encode('ascii') + b'\n')

if password:
    tn.read_until(b'Password: ')
    tn.write(password.encode('ascii')+b'\n')

time.sleep(2)
tn.write(b'enable\n')
time.sleep(2)
tn.write(b'cisco\n')
time.sleep(2)
tn.write(b'config t\n')
time.sleep(2)


tn.write(b'interface g0/1\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)

tn.write(b'exit\n')

tn.write(b'interface g0/1.10\n')
time.sleep(2)
tn.write(b'encapsulation dot1Q 10\n')
time.sleep(2)
tn.write(b'ip address 192.168.10.254 255.255.255.0\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)
tn.write(b'exit\n')

tn.write(b'interface g0/1.20\n')
time.sleep(2)
tn.write(b'encapsulation dot1Q 20\n')
time.sleep(2)
tn.write(b'ip address 192.168.20.254 255.255.255.0\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)
tn.write(b'exit\n')

tn.write(b'interface g0/1.30\n')
time.sleep(2)
tn.write(b'encapsulation dot1Q 30\n')
time.sleep(2)
tn.write(b'ip address 192.168.30.254 255.255.255.0\n')
time.sleep(2)
tn.write(b'no shutdown\n')
time.sleep(2)
tn.write(b'exit\n')



tn.write(b'ip dhcp pool Vlan10\n')
time.sleep(2)
tn.write(b'network 192.168.10.0 255.255.255.0\n')
time.sleep(2)
tn.write(b'default-router 192.168.10.254\n')
time.sleep(2)
tn.write(b'dns-server 8.8.8.8\n')
tn.write(b'exit\n')

tn.write(b'ip dhcp pool Vlan20\n')
time.sleep(2)
tn.write(b'network 192.168.20.0 255.255.255.0\n')
time.sleep(2)
tn.write(b'default-router 192.168.20.254\n')
time.sleep(2)
tn.write(b'dns-server 8.8.8.8\n')
tn.write(b'exit\n')

tn.write(b'ip dhcp pool Vlan30\n')
time.sleep(2)
tn.write(b'network 192.168.30.0 255.255.255.0\n')
time.sleep(2)
tn.write(b'default-router 192.168.30.254\n')
time.sleep(2)
tn.write(b'dns-server 8.8.8.8\n')
time.sleep(2)
tn.write(b'exit\n')

tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)






