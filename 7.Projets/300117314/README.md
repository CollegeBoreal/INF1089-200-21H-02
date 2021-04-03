# :zap: How to configure our network using python scripts:zap: 
:star: in this project I will show you how to use python script to configure your router on a Stick and your vlans on your switch and put all interfaces on the right vlans. 


## :zap: This is our topology :zap:
:star: we will use one router and one switch with three vlans and each vlan will receive IP address directly from DHCP server configured on my router.
<img src=images/1.PNG  alt="alt text" width="650" height="500">


#  :pushpin: Configuration of Router:

## :one: Connecrting remotely using SSH: 
:star: Connecting to our router from distance usign this set of commands. SSH helps us to connect to our router with our username and password: 
```python
import getpass
import sys
import telnetlib
import time

Host="10.13.237.210"

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
```
## :ok_hand:
:pushpin: all that it dose is exactly like connecting to our router using Putty like the next two photos: 

##
<img src=images/2.PNG  alt="alt text" width="550" height="400">

##

<img src=images/3.PNG  alt="alt text" width="550" height="400">


## :two: Enabling and configuring our interfaces:     

:star: Now that we are connected, first of all we should turn on our main interface and then configure our virtual interfaces using this set of commands.

```python

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
```

##

## :three: Configuring DHCP server: 

:star: Les's receive our IP addresses automatically from our router in each vlan by using this lines of commands: 


##
```python

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
```

##

## :four: Printing the result of our automation when it's done:

:star: This set of commands helps us to finish the execution and to verify which configuration is done at the end of executing the scrip:

##
```python
tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)
``` 

##
:star: Let's execute the scrip on our computer:

```
python Router.py
```

##
<img src=images/4.PNG  alt="alt text" width="950" height="400">


##
:star: Let's verify our pools existance on our router:

```
show run
```
##
<img src=images/5.PNG  alt="alt text" width="550" height="400">

#  :pushpin: Configuration of Switch:

##

## 1️⃣: Creating trunk connection between the switch and router:

##
```python
tn.write(b'interface range g0/0\n')
time.sleep(2)
tn.write(b'switchport trunk encapsulation dot1q\n')
time.sleep(2)
tn.write(b'switchport mode trunk\n')
time.sleep(2)
```

##

## :two: Creating Vlans using loop feature in Python:

##
:star: Herer we are creating Vlans using loop, it creates vlan 10 til vlan 40:

##
```python

for n in range(10,40):
    tn.write(b"no vlan " + str(n).encode('ascii') + b"\n")
    time.sleep(2)
    
```

##

## :three: Dedicating interface to vlan:

```python
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


```
## :four: Printing the result:
```python
tn.write(b'end\n')
tn.write(b'exit\n')
line=tn.read_all()
print (line)
```



