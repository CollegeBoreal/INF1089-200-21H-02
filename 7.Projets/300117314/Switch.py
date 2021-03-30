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

tn.write(b'interface range g0/0\n')
time.sleep(2)
tn.write(b'switchport trunk encapsulation dot1q\n')
time.sleep(2)
tn.write(b'switchport mode trunk\n')
time.sleep(2)


for n in range(10,40):
    tn.write(b"no vlan " + str(n).encode('ascii') + b"\n")
    time.sleep(2)
    

tn.write(b'interface g0/1\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 10\n')
time.sleep(2)
tn.write(b'exit\n')
time.sleep(2)

tn.write(b'interface g0/2\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 20\n')
time.sleep(2)
tn.write(b'exit\n')
time.sleep(2)

tn.write(b'interface g0/3\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 30\n')
time.sleep(2)
tn.write(b'exit\n')
time.sleep(2)

tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)

 
