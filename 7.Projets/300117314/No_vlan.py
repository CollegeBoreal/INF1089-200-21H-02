import getpass
import sys
import telnetlib
import time

Host="10.13.237.211"

user=input(' Enter User name: ')
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


for n in range(17,20):
    tn.write(b"no vlan " + str(n).encode('ascii') + b"\n")
    time.sleep(2)
    

tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)
