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



for n in range(2,10):
    tn.write(b"vlan " + str(n).encode('ascii') + b"\n")
    time.sleep(2)
    tn.write(b"name Python_VLAN_" + str(n).encode('ascii') + b"\n")
    
time.sleep(2)
tn.write(b'interface fastEthernet 0/1\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 2\n')
time.sleep(2)

time.sleep(2)
tn.write(b'interface fastEthernet 0/2\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 3\n')
time.sleep(2)

time.sleep(2)
tn.write(b'interface fastEthernet 0/3\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 4\n')
time.sleep(2)

time.sleep(2)
tn.write(b'interface fastEthernet 0/4\n')
time.sleep(2)
tn.write(b'switchport mode access\n')
time.sleep(2)
tn.write(b'switchport access vlan 5\n')
time.sleep(2)


tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)

